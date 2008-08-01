From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Fri, 1 Aug 2008 13:43:28 +0200
Subject: [Buildroot] Error when compiling Mesa-7.0.3
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF3265494@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I got the following error when trying to let buildroot compile
Mesa-7.0.3:


make[4]: Entering directory
`/atmel/buildrootWork/build_avr32/Mesa-7.0.3/src/glx/x11'
Makefile:91: depend: Datei oder Verzeichnis nicht gefunden
touch depend
makedepend -I -fdepend -I. -I../../../include
-I../../../include/GL/internal -I../../../src/mesa/main
-I../../../src/mesa/glapi `pkg-config --cflags libdrm`  glcontextmodes.c
clientattrib.c compsize.c eval.c glxcmds.c glxext.c glxextensions.c
indirect.c indirect_init.c indirect_size.c indirect_window_pos.c
indirect_transpose_matrix.c indirect_vertex_array.c
indirect_vertex_program.c pixel.c pixelstore.c render2.c renderpix.c
single2.c singlepix.c vertarr.c xfont.c glx_pbuffer.c glx_query.c
glx_texture_compression.c dri_glx.c XF86dri.c \
                ../../../src/mesa/main/dispatch.c
../../../src/mesa/glapi/glapi.c ../../../src/mesa/glapi/glthread.c
../../../src/mesa/x86/glapi_x86.S
/bin/sh:
/atmel/buildrootWork/build_avr32/staging_dir/usr/bin/makedepend: cannot
execute binary file
make[4]: *** [depend] Fehler 126
make[4]: Leaving directory
`/atmel/buildrootWork/build_avr32/Mesa-7.0.3/src/glx/x11'
make[3]: *** [subdirs] Fehler 1
make[3]: Leaving directory
`/atmel/buildrootWork/build_avr32/Mesa-7.0.3/src'
make[2]: *** [default] Fehler 1
make[2]: Leaving directory `/atmel/buildrootWork/build_avr32/Mesa-7.0.3'
make[1]: *** [linux-dri-x86] Fehler 2
make[1]: Leaving directory `/atmel/buildrootWork/build_avr32/Mesa-7.0.3'
make: *** [/atmel/buildrootWork/build_avr32/Mesa-7.0.3/.built] Fehler 2


makedepend exists and is a binary. What does Mesa expects here?
