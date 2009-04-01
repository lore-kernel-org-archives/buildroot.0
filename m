From: Jeff Steele <jsteele@coloradocollege.edu>
Date: Wed, 01 Apr 2009 10:04:16 -0600
Subject: [Buildroot] util-linux error : blkid/blkid.h not found ?
Message-ID: <1238601856.5157.78.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



I *finally* got everything to build.  (svn, armeb, OABI). But there was
one error I had to fix by hand.


The package util-linux-2.13-pre7 failed to compile due to a missing
header file : blkid/blkid.h

This header file is in the package e2fsprogs-1-41.3, but I can't find
anything in the Makefile, configure, etc. for e21fsprogs that installs
the headers.  In order to get util-linux to compile, I did the
following :

# cd e2fsprogs-1.41.3
# for i in blkid e2p et ext2fs ss uuid; do
# mkdir ../../staging_dir/usr/include/$i;
# cp $i/*.h ../../staging_dir/usr/include/$i;
# done;

After this, util-linux compiled just fine.
