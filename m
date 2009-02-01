From: S0L0 at gmx-topmail.de <S0L0@gmx-topmail.de>
Date: Sun, 01 Feb 2009 12:44:51 +0100
Subject: [Buildroot] cannot build: conflicting types for '__kernel_dev_t'
Message-ID: <20090201114451.154610@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

i just wanted to try again getting buildroot to wrk, but I seem to have one more porblem:

I set up a new debian environment before ~ 2 hours. Installed gcc, libncurses5-dev and subversion (and all dependencies, of course).

After that I downloaded the sources and tried to compile:

svn co svn://uclibc.org/trunk/uClibc
cd uClibc
make menuconfig
->changed "Target Architecture" to "i386" and "Target x86 Processor Family" to "Pentium/586/K5/5x86/6x86/6x86MX".
make

################

I got the folowwing error after a couple of seconds:

  CC libc/inet/ether_addr.os
In file included from /usr/include/linux/if_ether.h:24,
                 from ./include/netinet/if_ether.h:26,
                 from ./include/netinet/ether.h:26,
                 from libc/inet/ether_addr.c:31:
/usr/include/linux/types.h:11: error: conflicting types for '__kernel_dev_t'
./include/bits/kernel_types.h:19: error: previous declaration of '__kernel_dev_t' was here
make: *** [libc/inet/ether_addr.os] Fehler 1

################

ok, I think, I understand what the error is, but I do not have a clue of how to fix this. I just played a bit around commenting-out the suspicious lines, but I ended up with more errors.


I hope anybody out there can help me :)

Best regards,

S0l0
-- 
_____________________________________________________________
Stephan Blanke
Stephan.Blanke at gmx.de
#166931535

Psssst! Schon vom neuen GMX MultiMessenger geh?rt? Der kann`s mit allen: http://www.gmx.net/de/go/multimessenger01
