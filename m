From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2010 12:29:34 +0100
Subject: [Buildroot] Remove the Glib 1.x / Gtk 1.x stack ?
Message-ID: <20100214122934.5aae9b87@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Gtk 1.x does not build here:

make[3]: Entering directory `/home/thomas/buildroot/output/build/gtk+-1.2.10/gdk'
/bin/sh ../libtool --mode=compile /home/thomas/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.. -DG_LOG_DOMAIN=\"Gdk\" -I.. -DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DGTK_NO_CHECK_CASTS -I/usr/include/glib-1.2 -I/lib/glib/include -D_REENTRANT -I/home/thomas/buildroot/output/staging/usr/include/X11    -g -O2 -Wall -c gdk.c
/bin/sh ../libtool --mode=compile /home/thomas/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.. -DG_LOG_DOMAIN=\"Gdk\" -I.. -DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DGTK_NO_CHECK_CASTS -I/usr/include/glib-1.2 -I/lib/glib/include -D_REENTRANT -I/home/thomas/buildroot/output/staging/usr/include/X11    -g -O2 -Wall -c gdkcc.c
/bin/sh ../libtool --mode=compile /home/thomas/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.. -DG_LOG_DOMAIN=\"Gdk\" -I.. -DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DGTK_NO_CHECK_CASTS -I/usr/include/glib-1.2 -I/lib/glib/include -D_REENTRANT -I/home/thomas/buildroot/output/staging/usr/include/X11    -g -O2 -Wall -c gdkcolor.c
/bin/sh ../libtool --mode=compile /home/thomas/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.. -DG_LOG_DOMAIN=\"Gdk\" -I.. -DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DGTK_NO_CHECK_CASTS -I/usr/include/glib-1.2 -I/lib/glib/include -D_REENTRANT -I/home/thomas/buildroot/output/staging/usr/include/X11    -g -O2 -Wall -c gdkcursor.c
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[3]: *** [gdkcolor.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [gdkcc.lo] Error 1
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[3]: *** [gdkcursor.lo] Error 1
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[3]: *** [gdk.lo] Error 1
make[3]: Leaving directory `/home/thomas/buildroot/output/build/gtk+-1.2.10/gdk'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/thomas/buildroot/output/build/gtk+-1.2.10'
make[1]: *** [all-recursive-am] Error 2
make[1]: Leaving directory `/home/thomas/buildroot/output/build/gtk+-1.2.10'
make: ***
[/home/thomas/buildroot/output/build/gtk+-1.2.10/gtk/.libs/libgtk.a]
Error 2

Gtk 1.x is not very ancient, I'm not sure it's really useful anymore.
The package hasn't been updated in a while (it's still 1.2.10, while
the latest version of the 1.x series is 1.3.15).

Can't we just remove it from Buildroot ? If so, both libgtk12 and
libglib12 can be removed.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
