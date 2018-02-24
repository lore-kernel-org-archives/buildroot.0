From: Sjoerd Venema <srg.venema@gmail.com>
Date: Sat, 24 Feb 2018 22:12:19 +0100
Subject: [Buildroot] unsafe header/library path used in cross-compilation:
 '-I/usr/include/readline'
Message-ID: <CAPzckP7PfQYz-+vH09kjX3v0C7kM8nrdEB8aNrhoe4ZfiiF2dQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm getting an "unsafe header/library path used in cross-compilation"-error
while building ecasound (https://ecasound.seul.org/ecasound/download.php).
From what I've read so far is that it's because the makefile references the
/usr/-directory. What I can't figure out is how to change the makefile to
not do that. Turning on/off the "paranoid"-function in menuconfig didn't
make a difference.

[buildroot at br buildroot]$ make ecasound
>>> ecasound 2.9.1 Building
PATH="/home/buildroot/buildroot-2018.02-rc2/output/host/bin:/home/buildroot/buildroot-2018.02-rc2/output/host/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/buildroot/.local/bin:/home/buildroot/bin"
/usr/bin/make -j5  -C
/home/buildroot/buildroot-2018.02-rc2/output/build/ecasound-2.9.1/
/usr/bin/make  all-recursive
Making all in kvutils
make[4]: Nothing to be done for `all'.
Making all in libecasound
Making all in plugins
make[5]: Nothing to be done for `all'.
make[5]: Nothing to be done for `all-am'.
Making all in ecasound
/home/buildroot/buildroot-2018.02-rc2/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-g++
-DHAVE_CONFIG_H -I. -I. -I.. *-I/usr/include/readline* -I. -I..
-I../libecasound -I../kvutils -D_REENTRANT -D_XOPEN_SOURCE=600
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-ffast-math -fstrict-aliasing -DNDEBUG -DENABLE_DBC -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -c -o eca-curses.o
eca-curses.cpp
arm-buildroot-linux-uclibcgnueabihf-g++: WARNING: unsafe header/library
path used in cross-compilation: '*-I/usr/include/readline*'
eca-curses.cpp:46:22: fatal error: readline.h: No such file or directory
 #include <readline.h>
                      ^
compilation terminated.
make[4]: *** [eca-curses.o] Error 1
make[3]: *** [all-recursive] Error 1
make[2]: *** [all] Error 2
make[1]: ***
[/home/buildroot/buildroot-2018.02-rc2/output/build/ecasound-2.9.1/.stamp_built]
Error 2
make: *** [_all] Error 2

Many thanks!
Sjoerd Venema

<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Virus-free.
www.avast.com
<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180224/3143bc08/attachment.html>
