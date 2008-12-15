From: Dan Lykowski <dan.lykowski@dynonavionics.com>
Date: Mon, 15 Dec 2008 15:24:40 -0800
Subject: [Buildroot] Bug building fontconfig
Message-ID: <4946E738.6020803@dynonavionics.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building fontconfig crashes with the following problem on Ubuntu 8.04/8.10.

/usr/bin/gcc -L/buildroot/build_i686/staging_dir/lib 
-L/buildroot/build_i686/staging_dir/usr/lib 
--sysroot=/buildroot/build_i686/staging_dir/ -o fc-case fc-case.o
/usr/bin/ld: this linker was not configured to use sysroots
collect2: ld returned 1 exit status

Removing the --sysroot and building by hand allows the file to link. I 
cant seem to find where this is being added to the cflags/ldflags. Any 
help would be appreciated. It continues to happen whenever linking using 
the host linker.

Dan Lykowski
