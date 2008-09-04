From: Matt Wood <mattwood2000@gmx.net>
Date: Thu, 04 Sep 2008 20:19:36 +0200
Subject: [Buildroot] Atmel ARM - libintl.h not found - avahi
Message-ID: <20080904181936.65130@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone, I've had problems off and on with avahi in buildroot failing depending on which Atmel platform I build for, but now I need to get things up and running with networking support.

I'm trying to build the at91sam9263ek_defconfig and its failing on avahi again with the following error:
arm-linux-uclibc/bin/ld: cannot find -lintl

Looking at the config.log I see in many places this error:
conftest.c:96:21: error: libintl.h: No such file or directory

I also found this post on the www.at91.com forum:
"
...
...
...
The following message was seen in the make output

#Remove libintl header since gettext support is disabled
rm -rf toolchain_build_arm/uClibc_dev//usr/include/libintl.h

If I do a make uclibc-menuconfig I can't really see any options for turning on or off libintl functionality.

The message is printed based on the value of the configuration variable named UCLIBC_HAS_GETTEXT_AWARENESS. If this variable is false then libintl.h is removed with the message shown above.

Gave up at this point and just removed avahi. I'm not doing any networking so it is not required. If in the future I need it then maybe it will be fixed by then."

Does anyone know why intl support was taken out?  Any ides on how to fix this error?

Thanks, Matt.


-- 
GMX Kostenlose Spiele: Einfach online spielen und Spa? haben mit Pastry Passion!
http://games.entertainment.gmx.net/de/entertainment/games/free/puzzle/6169196
