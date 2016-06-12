From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Jun 2016 18:09:56 +0000
Subject: [Buildroot] [Bug 8986] New: qt5imageformats fails to build on
 aarch64_be-buildroot-linux-gnu
Message-ID: <bug-8986-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8986

            Bug ID: 8986
           Summary: qt5imageformats fails to build on
                    aarch64_be-buildroot-linux-gnu
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

How to reproduce: Fresh buildroot clone as of today, make menuconfig, select
the aarch64 big-endian target with glibc (default), select qt5 and qtgui,
qtwidgets, qtsvg, imageformats components (.config attached).

The qtimageformats components fails to build like this:

/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/host/usr/bin/aarch64_be-buildroot-linux-gnu-g++
--sysroot=/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/host/usr/aarch64_be-buildroot-linux-gnu/sysroot
-Wl,--no-undefined -Wl,-O1 -Wl,--enable-new-dtags -shared -o libqwebp.so
.obj/main.o .obj/qwebphandler.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/alpha.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/buffer.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/frame.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/idec.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/io.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/quant.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/tree.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/vp8.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/vp8l.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dec/webp.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/demux/demux.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/cpu.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/dec.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/dec_sse2.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/enc.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/enc_sse2.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/lossless.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/upsampling.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/upsampling_sse2.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/yuv.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/alpha_processing.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/alpha_processing_sse2.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/dec_clip_tables.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/dec_mips32.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/enc_avx2.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/enc_mips32.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/lossless_mips32.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/lossless_sse2.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/yuv_mips32.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/yuv_sse2.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/alpha.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/analysis.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/backward_references.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/config.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/cost.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/filter.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/frame.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/histogram.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/iterator.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/picture.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/quant.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/syntax.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/token.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/tree.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/vp8l.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/webpenc.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/picture_csp.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/picture_psnr.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/picture_rescale.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/enc/picture_tools.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/mux/muxedit.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/mux/muxinternal.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/mux/muxread.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/bit_reader.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/bit_writer.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/color_cache.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/filters.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/huffman.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/huffman_encode.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/quant_levels.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/quant_levels_dec.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/random.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/rescaler.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/thread.o
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/utils/utils.o
 -lQt5Gui -lQt5Core -lrt -ldl -lpthread  
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/dec.o:
In function `VP8DspInit':
dec.c:(.text+0x2bbc): undefined reference to `VP8DspInitNEON'
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/enc.o:
In function `VP8EncDspInit':
enc.c:(.text+0x19d0): undefined reference to `VP8EncDspInitNEON'
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/lossless.o:
In function `VP8LDspInit':
lossless.c:(.text+0x2ac4): undefined reference to `VP8LDspInitNEON'
.obj/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/upsampling.o:
In function `WebPInitUpsamplers':
upsampling.c:(.text+0x3ebc): undefined reference to `WebPInitUpsamplersNEON'
collect2: error: ld returned 1 exit status
Makefile:276: recipe for target '../../../../plugins/imageformats/libqwebp.so'
failed
make[5]: *** [../../../../plugins/imageformats/libqwebp.so] Error 1
make[5]: Leaving directory
'/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/plugins/imageformats/webp'
Makefile:172: recipe for target 'sub-webp-make_first' failed
make[4]: *** [sub-webp-make_first] Error 2
make[4]: Leaving directory
'/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/plugins/imageformats'
Makefile:42: recipe for target 'sub-imageformats-make_first' failed
make[3]: *** [sub-imageformats-make_first] Error 2
make[3]: Leaving directory
'/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src/plugins'
Makefile:43: recipe for target 'sub-plugins-make_first' failed
make[2]: *** [sub-plugins-make_first] Error 2
make[2]: Leaving directory
'/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/src'
Makefile:43: recipe for target 'sub-src-make_first' failed
make[1]: *** [sub-src-make_first] Error 2
make[1]: Leaving directory
'/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0'
package/pkg-generic.mk:195: recipe for target
'/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/.stamp_built'
failed
make: ***
[/home/jenkins_slave/a/buildroot-aarch64_be-buildroot-linux-gnu/output/build/qt5imageformats-5.6.0/.stamp_built]
Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
