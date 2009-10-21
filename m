From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 14:38:06 +0200
Subject: [Buildroot] building toolchain fails
In-Reply-To: <48B29D7D7EE043AF836DB1647ED0F5C6@apexjs> (Sagaert Johan's
	message of "Wed\, 21 Oct 2009 14\:26\:08 +0200")
References: <48B29D7D7EE043AF836DB1647ED0F5C6@apexjs>
Message-ID: <87eiowrkgh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Peter

 Sagaert> See attachement concerning my debian

 Sagaert> I will now look what i can do on the ubuntu machine.

Please keep discussion on the mailing list instead of mailing me
directly, so others can also follow.

Looking at your config.log makes the problem pretty obvious:

configure:1716: checking for C compiler default output
configure:1719: /home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux
-uclibc-gcc -Os -pipe -O2  -I/home/johan/buildroot/output/build/staging_dir/usr/
include -I/home/johan/buildroot/output/build/staging_dir/include --sysroot=/home
/johan/buildroot/output/build/staging_dir/ -isysroot /home/johan/buildroot/outpu
t/build/staging_dir -mabi=apcs-gnu -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_
FILE_OFFSET_BITS=64    conftest.c  >&5
ccache: failed to create /ccache-2.4/cache (No such file or directory)

configure:1722: $? = 1
configure: failed program was:
#line 1700 "configure"
#include "confdefs.h"

int
main ()
{

  ;
  return 0;
}
configure:1745: error: C compiler cannot create executables

So the problem is ccache somehow thinking it should write cache files to
/ccache-2.4.

Try disabling ccache and rebuild everything (rm -rf output; make).

-- 
Bye, Peter Korsgaard
