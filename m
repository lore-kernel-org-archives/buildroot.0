From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Fri, 26 Feb 2016 10:35:05 +0100
Subject: [Buildroot] [nano] error compiling nano
Message-ID: <CALtfCQZsG=u4scz83-6Ke1iVp9pDqpiN79365vnS2mpF05SFRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to compile the test editor: nano, with raspberrypi2_defconf
configuration and fail. It seems to be that the problem is in the source
file: char.c.

I attached you the log of the make:

---
...
     IGNORE_CALL_RESULT(mbtowc(NULL, NULL, 0));
     ^
chars.c: In function ?wctomb_reset?:
chars.c:101:5: warning: implicit declaration of function ?wctomb?
[-Wimplicit-function-declaration]
     IGNORE_CALL_RESULT(wctomb(NULL, 0));
     ^
/home/oscargomez/buildroot/buildroot-2016.02-rc2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\"
-DSYSCONFDIR=\"/etc\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -Wall -c -o prompt.o prompt.c
/home/oscargomez/buildroot/buildroot-2016.02-rc2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\"
-DSYSCONFDIR=\"/etc\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -Wall -c -o rcfile.o rcfile.c
/home/oscargomez/buildroot/buildroot-2016.02-rc2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\"
-DSYSCONFDIR=\"/etc\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -Wall -c -o search.o search.c
/home/oscargomez/buildroot/buildroot-2016.02-rc2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\"
-DSYSCONFDIR=\"/etc\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -Wall -c -o text.o text.c
/home/oscargomez/buildroot/buildroot-2016.02-rc2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\"
-DSYSCONFDIR=\"/etc\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -Wall -c -o utils.o utils.c
/home/oscargomez/buildroot/buildroot-2016.02-rc2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\"
-DSYSCONFDIR=\"/etc\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -Wall -c -o winio.o winio.c
/home/oscargomez/buildroot/buildroot-2016.02-rc2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
 -Wall   -o nano browser.o chars.o color.o cut.o files.o global.o help.o
move.o nano.o prompt.o rcfile.o search.o text.o utils.o winio.o  -lncurses
chars.o: In function `mbtowc_reset':
chars.c:(.text+0x68): undefined reference to `mbtowc'
chars.o: In function `wctomb_reset':
chars.c:(.text+0x74): undefined reference to `wctomb'
collect2: error: ld returned 1 exit status
make[4]: *** [nano] Error 1
make[3]: *** [all-recursive] Error 1
make[2]: *** [all] Error 2
make[1]: ***
[/home/oscargomez/buildroot/buildroot-2016.02-rc2/output/build/nano-2.5.1/.stamp_built]
Error 2
make: *** [_all] Error 2

----

Best regards.

Oscar Gomez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160226/56f9e2c2/attachment.html>
