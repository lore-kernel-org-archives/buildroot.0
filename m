From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Tue, 10 Mar 2009 14:09:30 +0100
Subject: [Buildroot] Problem with libgtk12 and libtool (unable to infer
	tagged configuration)
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF335189C@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Since two days i'm trying to solve the error that libtool outputs.
Here is a snippet of the output of make:

touch /buildroot/build_avr32/gtk+-1.2.10/.configured
/usr/bin/make -j1
CC=/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -C
/buildroot/build_avr32/gtk+-1.2.10
make[1]: Entering directory `/buildroot/build_avr32/gtk+-1.2.10'
/usr/bin/make  all-recursive
make[2]: Entering directory `/buildroot/build_avr32/gtk+-1.2.10'
Making all in po
make[3]: Entering directory `/buildroot/build_avr32/gtk+-1.2.10/po'
make[3]: Fuer das Ziel all ist nichts zu tun.
make[3]: Leaving directory `/buildroot/build_avr32/gtk+-1.2.10/po'
Making all in gdk
make[3]: Entering directory `/buildroot/build_avr32/gtk+-1.2.10/gdk'
/bin/sh ../libtool --mode=compile
/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -DG_LOG_DOMAIN=\"Gdk\" -I..
-DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DGTK_NO_CHECK_CASTS
-I/usr/include/glib-1.2 -I/lib/glib/include -D_REENTRANT
-I/buildroot/build_avr32/staging_dir/usr/include/X11    -g -O2 -Wall -c
gdk.c
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[3]: *** [gdk.lo] Error 1
make[3]: Leaving directory `/buildroot/build_avr32/gtk+-1.2.10/gdk'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/buildroot/build_avr32/gtk+-1.2.10'
make[1]: *** [all-recursive-am] Error 2
make[1]: Leaving directory `/buildroot/build_avr32/gtk+-1.2.10'
make: *** [/buildroot/build_avr32/gtk+-1.2.10/gtk/.libs/libgtk.a] Error
2


I'm building for AVR32 and use the buildroot from Atmel.
I tried it with the latest buildroot (Revision 25593) from Subversion
Repository and the error is still there.
It's a cross compiling problem with libtool, but i don't know how to
solve it.
Searching the web wasn't really helpful, best i found is
http://metastatic.org/text/libtool.html
There are two suggestions (that are not tested) which may work, but they
both are not what i want and are not really good.
Has anyone compiled libgtk12 with success, or has any hints how to solve
this?
My hostmachine runs OpenSuSE 11.0 and libtool 1.5.26-23.1 is installed.

Best regards
Sebastian
