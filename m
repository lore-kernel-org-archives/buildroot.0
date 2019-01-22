From: Igor Miranda <igorcmiranda3110@gmail.com>
Date: Tue, 22 Jan 2019 18:05:59 -0200
Subject: [Buildroot] Unsafe Headers
Message-ID: <CAAOxJQQArADC06G0XDQkQU2mGJ6XQWjZtGfUVTKRafzNoR0q9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

*Dear Buildroot Support,*

*I'm writing this email because I did a recipe for the GST-SHARK and I got
this error:*

+ check for build tools
  checking for autoreconf ...
/usr/bin/autoreconf
  checking for pkg-config ...
/usr/bin/pkg-config
configure.ac:96: installing './compile'
configure.ac:34: installing './config.guess'
configure.ac:34: installing './config.sub'
configure.ac:16: installing './install-sh'
configure.ac:16: installing './missing'
common/coverage/lcov.mak:2: warning: .PHONY was already defined in
condition GST_GCOV_ENABLED, which is included in condition TRUE ...
Makefile.am:88:   'common/coverage/lcov.mak' included from here
Makefile.am:38: ... '.PHONY' previously defined here
Makefile.am: installing './INSTALL'
plugins/tracers/Makefile.am:1: error: Libtool library used but 'LIBTOOL' is
undefined
plugins/tracers/Makefile.am:1:   The usual way to define 'LIBTOOL' is to
add 'LT_INIT'
plugins/tracers/Makefile.am:1:   to 'configure.ac' and run 'aclocal' and
'autoconf' again.
plugins/tracers/Makefile.am:1:   If 'LT_INIT' is in 'configure.ac', make
sure
plugins/tracers/Makefile.am:1:   its definition is in aclocal's search path.
plugins/tracers/Makefile.am: installing './depcomp'
tests/check/Makefile.am:8: warning: AM_TESTS_ENVIRONMENT multiply defined
in condition TRUE ...
common/check.mak:15: ... 'AM_TESTS_ENVIRONMENT' previously defined here
tests/check/Makefile.am:1:   'common/check.mak' included from here
parallel-tests: installing './test-driver'
autoreconf: automake failed with exit status: 1
package/pkg-generic.mk:220: recipe for target
'/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/.stamp_configured'
failed
make: ***
[/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/.stamp_configured]
Error 1


*So, after I add libtoolize in my mk file and I got this other error:*



libtool: install: /usr/bin/install -c .libs/libgstshark.so.0.0.0
/home/igor/buildroot/buildroot/output/target/usr/lib/libgstshark.so.0.0.0
libtool: install: (cd /home/igor/buildroot/buildroot/output/target/usr/lib
&& { ln -s -f libgstshark.so.0.0.0 libgstshark.so.0 || { rm -f
libgstshark.so.0 && ln -s libgstshark.so.0.0.0 libgstshark.so.0; }; })
libtool: install: (cd /home/igor/buildroot/buildroot/output/target/usr/lib
&& { ln -s -f libgstshark.so.0.0.0 libgstshark.so || { rm -f libgstshark.so
&& ln -s libgstshark.so.0.0.0 libgstshark.so; }; })
libtool: install: /usr/bin/install -c .libs/libgstshark.lai
/home/igor/buildroot/buildroot/output/target/usr/lib/libgstshark.la
libtool: warning: relinking 'libgstsharktracers.la'
libtool: install: (cd
/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/plugins/tracers;
/bin/bash
"/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/libtool"
--silent --tag CC --tag disable-static --mode=relink
/home/igor/buildroot/buildroot/output/host/bin/arm-buildroot-linux-gnueabi-gcc
-I../.. -I../..
-I/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0
-I/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib/glib-2.0/include
-I/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/include
-pthread -DG_THREADS_MANDATORY -DG_DISABLE_DEPRECATED -Wall
-Wdeclaration-after-statement -Wvla -Wpointer-arith -Wmissing-declarations
-Wmissing-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wformat-nonliteral -Wformat-security -Wold-style-definition -Winit-self
-Wmissing-include-dirs -Waddress -Waggregate-return -Wno-multichar
-Wnested-externs -g -DGST_DISABLE_DEPRECATED -Werror
-I/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/include/gstreamer-1.0
-I/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0
-I/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib/glib-2.0/include
-I/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/include
-pthread -DGST_USE_UNSTABLE_API -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -module -avoid-version -export-symbols-regex
"^_*gst_plugin_.*" -no-undefined -Wl,-Bsymbolic-functions -o
libgstsharktracers.la -rpath /usr/lib/gstreamer-1.0
libgstsharktracers_la-gstplugin.lo libgstsharktracers_la-gstsharktracer.lo
libgstsharktracers_la-gstgraphic.lo libgstsharktracers_la-gstcpuusage.lo
libgstsharktracers_la-gstproctime.lo
libgstsharktracers_la-gstinterlatency.lo
libgstsharktracers_la-gstscheduletime.lo
libgstsharktracers_la-gstframerate.lo
libgstsharktracers_la-gstqueuelevel.lo libgstsharktracers_la-gstbitrate.lo
libgstsharktracers_la-gstbuffer.lo
libgstsharktracers_la-gstperiodictracer.lo
-L/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib
-lgobject-2.0 -lgmodule-2.0 -pthread -lglib-2.0
-L/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib
-lgstreamer-1.0 -lgobject-2.0 -lglib-2.0 libgstshark.la -inst-prefix-dir
/home/igor/buildroot/buildroot/output/target)
libtool: warning: remember to run 'libtool --finish /usr/lib'
arm-buildroot-linux-gnueabi-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-L/usr/lib'
libtool:   error: error: relink 'libgstsharktracers.la' with the above
command before installing it
Makefile:646: recipe for target 'install-pluginLTLIBRARIES' failed
make[4]: *** [install-pluginLTLIBRARIES] Error 1
make[4]: Leaving directory
'/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/plugins/tracers'
Makefile:963: recipe for target 'install-am' failed
make[3]: *** [install-am] Error 2
make[3]: Leaving directory
'/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/plugins/tracers'
Makefile:483: recipe for target 'install-recursive' failed
make[2]: *** [install-recursive] Error 1
make[2]: Leaving directory
'/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/plugins'
Makefile:599: recipe for target 'install-recursive' failed
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory
'/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5'
package/pkg-generic.mk:315: recipe for target
'/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/.stamp_target_installed'
failed
make: ***
[/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/.stamp_target_installed]
Error 2
Visualizar o anexo gst-shark.mk
gst-shark.

*I will send my mk file too, but what changes is that in this line:*

*cd $(@D) && ./autogen.sh --prefix=${STAGING_DIR}/usr
--libdir=${STAGING_DIR}/usr/lib *

*with libtoolize is going to be something like this *

*cd $(@D) && libtoolize && ./autogen.sh --prefix=${STAGING_DIR}/usr
--libdir=${STAGING_DIR}/usr/lib*

?rea de anexos
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190122/70b731ac/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gst-shark.mk
Type: text/x-makefile
Size: 830 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190122/70b731ac/attachment.bin>
