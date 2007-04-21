From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Fri, 20 Apr 2007 19:47:35 -0700 (PDT)
Subject: [Buildroot] buildroot compile error
In-Reply-To: <20070420111413.GA15091@aon.at>
References: <255259.71430.qm@web15811.mail.cnb.yahoo.com>   
	<20070420111413.GA15091@aon.at>
Message-ID: <3666.63.193.249.101.1177123655.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
    I downloaded the latest version, 18505, of buildroot and
comfigured it as in the attached config file, and got
the following compile error (make_buildroot_18505.log.gz enclosed) :

gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -MM *.c > .depend 2>/dev/null || : \
  /bin/sh:  \
  /A/src/DEBIAN/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
\
  No such file or directory

----------------------------------------------------------------
  That is correct.  There is no staging_dir/bin directory.  So the
question is:  Why is the Makefile looking for arm-linux-uclibc-gcc
in a directory that hasn't been created yet?

  Has anyone seen this error before and know what the fix is?

Nina


-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 12683 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070420/d45f84cc/attachment-0001.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: make_buildroot_18505.log.gz
Type: application/x-gzip
Size: 13233 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070420/d45f84cc/attachment-0001.bin 
