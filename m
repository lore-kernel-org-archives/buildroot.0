From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Fri, 08 Apr 2011 15:13:19 +0200
Subject: [Buildroot] [gdk-pixbuf] error: libintl.h: No such file or directory
Message-ID: <1302268399.4891.160.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
just to let you know (maybe someone skilled will fix this) while
compiling:
>>> gdk-pixbuf 2.23
[...]
libtool: compile:  /home/patben/Dev/buildroot/output/host/usr/bin/ccache /home/patben/Dev/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc --sysroot=/home/patben/Dev/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot -std=gnu99 -DHAVE_CONFIG_H -I. -I.. -DG_LOG_DOMAIN=\"GdkPixbuf\" -DGDK_PIXBUF_COMPILATION -I.. -I.. -I../gdk-pixbuf -I../gdk-pixbuf -DGDK_PIXBUF_LOCALEDIR=\"/usr/share/locale\" -DGDK_PIXBUF_LIBDIR=\"/usr/lib\" -DGDK_PIXBUF_BINARY_VERSION=\"2.10.0\" -DGDK_PIXBUF_PREFIX=\"/usr\" -pthread -I/home/patben/Dev/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/include/glib-2.0 -I/home/patben/Dev/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include -I/home/patben/Dev/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/include/libpng14 -DGDK_PIXBUF_ENABLE_BACKEND -DPIXBUF_LIBDIR=\"/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders\" -DBUILT_MODULES_DIR=\"./.libs\" -DG_DISABLE_SINGLE_INCLUDES -DGDK_PIXBUF_DISABLE_DEPRECATED -pipe -Os -mtune=c3-2 -march=c3-2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/patben/Dev/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/include -I/home/patben/Dev/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/include -Wall -MT gdk-pixbuf-util.lo -MD -MP -MF .deps/gdk-pixbuf-util.Tpo -c gdk-pixbuf-util.c  -fPIC -DPIC -o .libs/gdk-pixbuf-util.o
gdk-pixbuf-util.c:26:21: fatal error: libintl.h: No such file or directory
compilation terminated.

Copying missing libintl.h from:
buildroot/output/build/gettext-0.16.1/gettext-tools/intl/libintl.h to
buildroot/output/build/gdk-pixbuf-2.22.0/gdk-pixbuf/libintl.h
solves compilation problem.

This error occurs for past few snapshots.

-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments
