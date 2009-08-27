From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Aug 2009 08:34:15 +0000 (UTC)
Subject: [Buildroot] [Bug 559] mesa3d build fails
In-Reply-To: <bug-559-163@https.bugs.busybox.net/>
References: <bug-559-163@https.bugs.busybox.net/>
Message-ID: <20090827083415.808D877764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=559





--- Comment #2 from Simon Pasch <fpasch@googlemail.com>  2009-08-27 08:34:14 UTC ---
(In reply to comment #1)
> Hmm, could you post the entire cmdline? It sounds to me as if -sysroot is
> missing, otherwise it should look in STAGING_DIR/usr/lib automatically.
> 


/home/test/x-tools/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-gcc -c -I.
-I../../../include -I../../../include/GL/internal -I../../../src/mesa/main
-I../../../src/mesa/glapi `pkg-config --cflags libdrm`  -Wall
-Wmissing-prototypes -std=c99 -ffast-math -Os -pipe -Os  --sysroot
/home/test/buildroot-2009.08-rc3/build_i686/staging_dir/ -fPIC -m32
-D_POSIX_SOURCE -D_POSIX_C_SOURCE=199309L -D_SVID_SOURCE -D_BSD_SOURCE
-D_GNU_SOURCE -DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER
-DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS
-DHAVE_POSIX_MEMALIGN -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM
-fno-strict-aliasing -DXF86VIDMODE -D_REENTRANT -UIN_DRI_DRIVER
-DDEFAULT_DRIVER_DIR=\"/usr/local/lib/dri\" ../../../src/mesa/glapi/glthread.c
-o ../../../src/mesa/glapi/glthread.o
/home/test/x-tools/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-gcc -c -I.
-I../../../include -I../../../include/GL/internal -I../../../src/mesa/main
-I../../../src/mesa/glapi `pkg-config --cflags libdrm`  -Wall
-Wmissing-prototypes -std=c99 -ffast-math -Os -pipe -Os  --sysroot
/home/test/buildroot-2009.08-rc3/build_i686/staging_dir/ -fPIC -m32
-D_POSIX_SOURCE -D_POSIX_C_SOURCE=199309L -D_SVID_SOURCE -D_BSD_SOURCE
-D_GNU_SOURCE -DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER
-DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS
-DHAVE_POSIX_MEMALIGN -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM
-fno-strict-aliasing -DXF86VIDMODE -D_REENTRANT -UIN_DRI_DRIVER
-DDEFAULT_DRIVER_DIR=\"/usr/local/lib/dri\"  ../../../src/mesa/x86/glapi_x86.S
-o ../../../src/mesa/x86/glapi_x86.o
/bin/sh ../../../bin/mklib -o GL -linker
'/home/test/x-tools/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-gcc'
-ldflags '' \
                -major 1 -minor 2  \
                -install ../../../lib -id /usr/local/lib/libGL.1.dylib \
                 -lX11 -lXext -lXxf86vm -lXdamage -lXfixes -lm -lpthread -ldl
`pkg-config --libs libdrm` glcontextmodes.o clientattrib.o compsize.o eval.o
glxcmds.o glxcurrent.o glxext.o glxextensions.o indirect.o indirect_init.o
indirect_size.o indirect_window_pos.o indirect_texture_compression.o
indirect_transpose_matrix.o indirect_vertex_array.o indirect_vertex_program.o
pixel.o pixelstore.o render2.o renderpix.o single2.o singlepix.o vertarr.o
xfont.o glx_pbuffer.o glx_query.o drisw_glx.o dri_common.o dri_glx.o XF86dri.o
glxhash.o ../../../src/mesa/main/dispatch.o ../../../src/mesa/glapi/glapi.o
../../../src/mesa/glapi/glthread.o ../../../src/mesa/x86/glapi_x86.o
mklib: Making Linux shared library:  libGL.so.1.2
/home/test/x-tools/i686-unknown-linux-gnu/lib/gcc/i686-unknown-linux-gnu/4.3.2/../../../../i686-unknown-linux-gnu/bin/ld:
cannot find -lX11
collect2: ld returned 1 exit status


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
