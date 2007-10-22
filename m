From: =?ISO-8859-1?Q?=D6mer_Celikkanat?= <ocelikkanat@googlemail.com>
Date: Mon, 22 Oct 2007 12:51:48 +0200
Subject: [Buildroot] libglib2 error - Please help me
Message-ID: <9ed1d6350710220351q1925cd8cs6741841dc44f0cbf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi people,

I have a problem with the package "libglib2". I get this compiler eror:


make[3]: Entering directory `/home/ocelikkanat/buildroot/build_i386/glib-
2.14.1/gobject'
if
/home/ocelikkanat/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -DG_LOG_DOMAIN=\"GLib-GObject\" -I.. -I../glib
-I.. -DG_DISABLE_CAST_CHECKS -DG_DISABLE_DEPRECATED -DGOBJECT_COMPILATION
-DG_DISABLE_CONST_RETURNS  -pthread  -g -O2 -Wall -MT glib-genmarshal.o -MD
-MP -MF ".deps/glib-genmarshal.Tpo" \
  -c -o glib-genmarshal.o `test -f 'glib-genmarshal.c' || echo './'`glib-
genmarshal.c; \
then mv -f ".deps/glib-genmarshal.Tpo" ".deps/glib-genmarshal.Po"; \
else rm -f ".deps/glib-genmarshal.Tpo"; exit 1; \
fi
/bin/sh ../libtool --mode=link
/home/ocelikkanat/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
-g -O2 -Wall  -L/home/ocelikkanat/buildroot/build_i386/staging_dir/usr/lib
-lc -o glib-genmarshal  glib-genmarshal.o ../glib/libglib-2.0.la -lintl
mkdir .libs
/home/ocelikkanat/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
-g -O2 -Wall -o .libs/glib-genmarshal glib-genmarshal.o
-L/home/ocelikkanat/buildroot/build_i386/staging_dir/usr/lib
../glib/.libs/libglib-2.0.so-L/home/ocelikkanat/buildroot/build_i386/staging_dir/usr/lib/
/home/ocelikkanat/buildroot/build_i386/staging_dir/usr/lib/libintl.so -lc
-Wl,--rpath -Wl,/home/ocelikkanat/buildroot/build_i386/staging_dir/usr/lib
../glib/.libs/libglib-2.0.so: undefined reference to `wcscoll'
../glib/.libs/libglib-2.0.so: undefined reference to `_stdlib_mb_cur_max'
../glib/.libs/libglib-2.0.so: undefined reference to `wcsxfrm'
collect2: ld returned 1 exit status
make[3]: *** [glib-genmarshal] Error 1
make[3]: Leaving directory `/home/ocelikkanat/buildroot/build_i386/glib-
2.14.1/gobject'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/ocelikkanat/buildroot/build_i386/glib-
2.14.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/ocelikkanat/buildroot/build_i386/glib-
2.14.1'
make: *** [/home/ocelikkanat/buildroot/build_i386/glib-2.14.1
/glib/.libs/libglib-2.0.a] Error 2


These functions "wcscoll, wcsxfrm" are included in wchar.h and this is in
libc. But if I link the libc no success. I'm dispaired and don't know how I
can get forward. I can compile the other parts like "gthread, gmodule"
manually. Before this error I got a linker error from "libglib-2.0.so". This
grabs to libc.so.6 instead of libc.so.0.

Can anybody help me? Pleaseeeee.

greets
?mer
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071022/969d18a2/attachment.htm 
