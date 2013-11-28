From: Alexandre Schnegg <alexandre.schnegg@gmail.com>
Date: Thu, 28 Nov 2013 17:23:41 +0100
Subject: [Buildroot] Freescale specific kernel header to compile imx-lib
In-Reply-To: <20131128170846.7e1d8a40@skate>
References: <000b01ceeb8d$1d460fd0$57d22f70$@gmail.com>	<20131127173911.3f97da37@skate>	<003f01ceeb99$dc7c9980$9575cc80$@gmail.com>	<20131128102729.294dd0db@skate>	<00c501ceec4a$71937fb0$54ba7f10$@gmail.com>
 <20131128170846.7e1d8a40@skate>
Message-ID: <013501ceec56$340b6e30$9c224a90$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

I'm not familiar with the mailing list usage so if I make another mistake please tell me.

By the way, I have got an answer from Armadeus :

" current (recent) gstreamer-fsl-plugins only works with recent imx-lib packages which doesn't seems to work on i.MX27 anymore... (tested on APF51 only)"

They have a home made way to use the hardware acceleration, I will test it.

Thank you for your help.
Alexandre Schnegg

-----Message d'origine-----
De : Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Envoy? : jeudi 28 novembre 2013 17:09
? : Alexandre Schnegg
Objet : Re: [Buildroot] Freescale specific kernel header to compile imx-lib

Dear Alexandre Schnegg,

Can you please reply to the Buildroot mailing list (possibly with me in
Cc) and not just to me directly? Whenever I provide free support, I'd like it to be public and archived in the mailing list.

Thanks!

Thomas

On Thu, 28 Nov 2013 15:59:22 +0100, Alexandre Schnegg wrote:
> Dear Thomas Petazzoni,
> 
> After I have cleaned the project, I didn't have this issue again.
> BEfore, I have only made the compilation in two step.
> 
> Now I have another issue (whole log attached):
> 
> rm-buildroot-linux-uclibcgnueabi-gcc "-DPACKAGE_NAME=\"GStreamer i.MX 
> Plug-ins\"" -DPACKAGE_TARNAME=\"gstreamer-i-mx-plug-ins\"
> -DPACKAGE_VERSION=\"3.0.1\" "-DPACKAGE_STRING=\"GStreamer i.MX 
> Plug-ins 3.0.1\"" -DPACKAGE_BUGREPORT=\"http://www.freescale.com\"
> -DPACKAGE_URL=\"\" -DPACKAGE=\"gst-fsl-plugins\" -DVERSION=\"3.0.1\"
> -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1
> -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1
> -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
> -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\"
> -DHAVE_VPU_LIB_H=1 -DHAVE_AACD_DEC_INTERFACE_H=1
> -DHAVE_MP3_DEC_INTERFACE_H=1 -DHAVE_OGGVORBIS_DEC_API_H=1
> -DHAVE_NB_AMR_DEC_API_H=1 -DHAVE_WBAMR_DEC_INTERFACE_H=1
> -DHAVE_MP3_ENC_INTERFACE_H=1 -DHAVE_AVCD_DEC_API_H=1
> -DHAVE_MPEG4_ASP_API_H=1 -DHAVE_MPEG2_DEC_API_H=1
> -DHAVE_VPU_WRAPPER_H=1 -DHAVE_FSL_PARSER_H=1 -DHAVE_FSL_UNIA_H=1
> -DHAVE_LINUX_VIDEODEV2_H=1 -I. -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -idirafter 
> /home/schnegg/Documents/armadeus/buildroot/output/build/linux-2.6.29.6
> /inclu
> de
> -I/home/schnegg/Documents/armadeus/buildroot/output/host/usr/arm-build
> root-l
> inux-uclibcgnueabi/sysroot/usr/include/gstreamer-0.10 -pthread 
> -I/home/schnegg/Documents/armadeus/buildroot/output/host/usr/arm-build
> root-l
> inux-uclibcgnueabi/sysroot/usr/include/glib-2.0
> -I/home/schnegg/Documents/armadeus/buildroot/output/host/usr/arm-build
> root-l inux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include 
> -I../inc/common -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64 -Os -pipe -Os 
> -I/home/schnegg/Documents/armadeus/buildroot/output/host/usr/arm-build
> root-l inux-uclibcgnueabi/sysroot/usr/include/imx-mm/audio-codec
> -I/home/schnegg/Documents/armadeus/buildroot/output/host/usr/arm-build
> root-l inux-uclibcgnueabi/sysroot/usr/include/imx-mm/video-codec
> -I/home/schnegg/Documents/armadeus/buildroot/output/host/usr/arm-build
> root-l inux-uclibcgnueabi/sysroot/usr/include/imx-mm/parser
> -I/home/schnegg/Documents/armadeus/buildroot/output/host/usr/arm-build
> root-l inux-uclibcgnueabi/sysroot/usr/include/imx-mm/vpu -DARM 
> -D_GNUC_ -MT libgstfsl_0.10_la-hwbuffer_allocator.lo -MD -MP -MF 
> .deps/libgstfsl_0.10_la-hwbuffer_allocator.Tpo -c 
> hbuf_alloc/hwbuffer_allocator.c  -fPIC -DPIC -o 
> .libs/libgstfsl_0.10_la-hwbuffer_allocator.o
> hbuf_alloc/hwbuffer_allocator.c:47:23: fatal error: linux/ipu.h: No 
> such file or directory compilation terminated. make[3]: *** 
> [libgstfsl_0.10_la-hwbuffer_allocator.lo] Error 1 make[3]: Leaving 
> directory
> `/home/schnegg/Documents/armadeus/buildroot/output/build/gst-fsl-plugins-3.0 .1/libs'
> make[2]: *** [all-recursive] Error 1
> make[1]: ***
> [/home/schnegg/Documents/armadeus/buildroot/output/build/gst-fsl-plugi
> ns-3.0 .1/.stamp_built] Error 2make[2]: Leaving directory
> `/home/schnegg/Documents/armadeus/buildroot/output/build/gst-fsl-plugi
> ns-3.0
> .1'
> 
> make[1]: Leaving directory
> `/home/schnegg/Documents/armadeus/buildroot' make: *** [all] Error 2
> 
> I found the "ipu.h" header and I placed it in "/usr/src/linux" with no 
> success.
> 
> What else can I do to make this header be visible ?
> 
> Thank you very much for your help. I also post my questions on the 
> armadeus-forum mailing list but no one helps me...
> 
> Regards
> Alexandre Schnegg
> 
> -----Message d'origine-----
> De : Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Envoy? : jeudi 28 novembre 2013 10:27
> ? : Alexandre Schnegg
> Cc : buildroot at busybox.net
> Objet : Re: [Buildroot] Freescale specific kernel header to compile 
> imx-lib
> 
> Dear Alexandre Schnegg,
> 
> On Wed, 27 Nov 2013 18:55:28 +0100, Alexandre Schnegg wrote:
> > Thank you for your response.
> > 
> > I can give you some more details.
> > 
> > When I only select the package "imx-lib", compilation is ok. But 
> > when I also select the package "gst-fsl-plugins", I have this issue:
> > 
> > checking whether -lc should be explicitly linked in... no checking 
> > dynamic linker characteristics... GNU/Linux ld.so checking how to 
> > hardcode library paths into programs... immediate checking whether 
> > stripping libraries is possible... no checking if libtool supports 
> > shared libraries... yes checking whether to build shared 
> > libraries... yes checking whether to build static libraries... yes 
> > checking vpu_lib.h usability... no checking vpu_lib.h presence...
> > no checking for vpu_lib.h... no
> > configure: error: lib_vpu is required, consider installing imx-lib
> > make[1]: ***
> > [/home/schnegg/Documents/armadeus/buildroot/output/build/libfslvpuwr
> > ap
> > -1.0.1
> > 7/.stamp_configured] Error 1
> 
> Armadeus is making some fairly major changes to the Buildroot 
> packages, so I'm not sure whether the help we can provide will be 100% 
> accurate.
> 
> <rant>
> 
> I've asked gazillions of times the Armadeus people to push their 
> changes upstream, I'm on their IRC channel to help them to do so if 
> they need help. But over the past 4+ years, they only contributed 25 
> patches to Buildroot, and have kept most of their Buildroot changes 
> out of tree. Seems like they prefer to update their stack of patches 
> over and over and over again.
> 
> </rant>
> 
> > make[1]: Leaving directory
> > `/home/schnegg/Documents/armadeus/buildroot' make: *** [all] Error 2 
> > schnegg at ubuntu:~/Documents/armadeus$ make menuconfig
> > make[1]: Entering directory
> > `/home/schnegg/Documents/armadeus/buildroot
> > 
> > It's seems the "imx-lib" isn't built. 
> 
> The libfslvpuwrap package has a dependency on imx-lib, so it should 
> get built before:
> 
> LIBFSLVPUWRAP_DEPENDENCIES += imx-lib
> 
> Can you restart your build from scratch (make clean; make), and log 
> the entire build output a file:
> 
> 	make 2>&1 | tee build.log
> 
> And then see if imx-lib is properly built before libfslvpuwrap. If 
> that's the case, then you should look if a vpu_lib.h file was 
> installed somewhere. Depending on that, we'll see what's going on:
> either it has been installed but libfslvpuwrap isn't looking for it at 
> the right place, or it hasn't been installed.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering 
> http://free-electrons.com



--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
