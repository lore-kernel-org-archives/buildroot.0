From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 21 Feb 2020 09:23:04 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20200220034343.2370e4e4@windsurf>
References: <20200219074844.F3D6C85D78@fraxinus.osuosl.org>
 <20200220034343.2370e4e4@windsurf>
Message-ID: <6a628cba-468e-ed9f-7896-8b9c71a84065@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 20/02/2020 ? 03:43, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Wed, 19 Feb 2020 07:48:39 -0000
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>>     master   | 92  | 67  |  0  | 159 |
> 
> These results are not really good, so we need to put some effort into
> reducing the number of build failures in the autobuilders. See below
> for an analysis of the different build failures. Your help is
> appreciated to fix those issues.

This email is missing from the Buildroot Archives [1].

There is something unusual... It seems that "buildroot at buildroot.org" is not in
"Cc" but "Redirect Mail".

Due to this, only the reply from Giulio was archived.
I'm replying using "Cc" for the ml.

[1] http://lists.busybox.net/pipermail/buildroot/2020-February/thread.html

Best regards,
Romain

> 
>>     m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/81ee33eb606062a62765d95b66a26f130d280c53 |     
> 
> Segmentation fault in elf2flt:
> 
> ld (ld-elf2flt): /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/elf2flt terminated with signal 11 [Segmentation fault]
> 
> Romain, I am wondering if you already had a look into this. Could you
> comment?
> 
>>  powerpc64   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/d10a06addfdd927fd2ac772b25aaf9a057d20158 |     
>>   mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/16d2a2efed3b13ca648c83b64150da4c2c53afd7 |     
>> powerpc64le  |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/603f1be80822977f3181c99b8b01b3f2d531ace7 |     
>>    sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7b4780dd10b471243451f7f89c6b7de0c7e7ec4e |     
> 
> Per-package directories issue, fixed by
> https://git.buildroot.org/buildroot/commit/?id=84b4c19e551288911a230c2b73e96bc6e2ed12f9
> 
>>     m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/4e1f7f335d2c853e2a5e6ad96c14157ba8f003c7 |     
> 
> Another elf2flt issue:
> 
> ld (ld-elf2flt): /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/elf2flt terminated with signal 11 [Segmentation fault], core dumped
> 
> Romain ? :-)
> 
>> microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/b9edb405f6cf3322ddbb640c8e89cca57e840fc2 | ORPH
> 
> ../input.h:76:3: error: unknown type name 'FILE'
> 
> Not clear what is happening here. Could anyone investigate ?
> 
>>     i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/16129b6d867578fc1cbcd36ed3a6cad806c21b10 |     
>>   powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7442b75921b95f5772520b62ff4004bc98251ee4 |     
>>     arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/979be1e697bb75cc018141e8fa83905696e738cf |     
>>     arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/240de32ee2a20b56db535147c98220783c48295f |     
> 
> I have submitted http://patchwork.ozlabs.org/patch/1241072/ to fix this.
> 
>>     m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/9552e97cd64c447c8582efbe326ddafa42bf9a01 |     
>>     m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/976d99bc9b052f8d9429e666ac7fff7768ffff6b |     
> 
> Another elf2flt segfault. Why are we seeing these segfaults? I don't
> think we used to have so many. Is it due to the relatively recent
> rebuild of all Buildroot toolchains, which perhaps mean we're using a
> newer version of elf2flt ?
> 
>>     arm      |           efl-1.22.3           | NOK | http://autobuild.buildroot.net/results/4d7861fd5908c59546de19f6af3c27d061fed60b |     
> 
> /data/buildroot/buildroot-test/instance-0/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:39:22: error: expected ',' or '...' before '&&' token
> 
> Some C++ mess it seems. Romain, any idea ?
> 
>>     arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/3cd8e2c64e8051a95e0e097cdd0878b00afacf8e |     
>>   sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/edde1b609fd6b0e6be9870f78c71a6ababa49884 |     
>>   aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/b24891ac2f7b661db63c54f52024efc1e23f0339 |     
>>     arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/491215f51a2f1c725099c53685b34513e3ff55e7 |     
>>    x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/d3552e742381c737e5cacc5ca421c154ef93cde1 |     
>>    x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/385f0b988fc1ffbf918fb9adc4dd556b2fb367ab |     
>>    mipsel    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/26137934eb18531985f5b648f391501835445331 |     
>>   powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/32b5aacc2cae822d169b9a61ec4d7c1292caf877 |     
>>   aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/cc1e3df1eec85a9eca98b992f646061fb888512b |     
> 
> Fixed by https://git.buildroot.org/buildroot/commit/?id=607040e91381aae35205659e8edd7b2eeb45d420
> 
>>     arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/4a5a8cb6411d709acb7ea8c83b3c8e45fdc0a10b | ORPH
> 
> Another elf2flt issue.
> 
>>    nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/432a2766836107ed5536f861a8fbcab33e1f8cf6 |     
> 
> Wonderful, another compiler segfault:
> 
> ref-filter.c: In function 'find_longest_prefixes_1':
> ref-filter.c:1914:1: internal compiler error: Segmentation fault
> 
> Giulio or Romain, any idea ?
> 
>>     m68k     |         gptfdisk-1.0.4         | NOK | http://autobuild.buildroot.net/results/6db5f9d8663730a54b04c1e624438095598b2573 | ORPH
> 
> Our friend elf2flt strikes again. We really need to fix this issue.
> 
>>     arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/b97923f7db5e0d7d5609152078573360937e0318 |     
> 
> Static linking issue. It may be the same problem as the one affecting
> libglib2. See below.
> 
>> powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/89a2785352caae69cdf6aa02d55475aa4ed506d1 |     
>>   riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6e8ef0be643e030434474b58b15b3eff43081e5a |     
> 
> Still this mysterious failure that happens only on Yann's machine. Yann? :-)
> 
>>   riscv64    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/b922547540022a6fbde238053e2e5373a96ad48b |     
> 
> CMake Error at cmake/config-ix.cmake:438 (message):
>   Unknown architecture
> 
> Something not careful enough is using host-llvm even though the target
> architecture is not supported. Romain ?
> 
>>     i586     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/30699ba23805d2b267644dc321b8aaec72a6bc89 | ORPH
> 
> cannot delete non-empty directory: share/gettext
> could not make way for new symlink: share/gettext
> 
> This is a per-package directory issue.
> 
>>    x86_64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/bc06573718c7b05bb2ea081089cb3afa6b3cd2c2 |     
>>     mips     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/929fb828553ca99c9fe3480286627f149226b857 |     
>>     arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/3cba9e7e96aeb5ca6c68a82b972988a7bc1dc87a |     
>>     arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/0e67255cc1b184273749e8fdb721f815b144031d |     
>>     arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/6216d389edff9893f8f791ab2fbfe46d8e1276fc |     
>>     arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/34644e28467ac49eb4bc676ac0eb48c0978d4eb9 |     
>> microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/7ba2762786c08231a69a07558274e52750b7627c |     
> 
> Fixed by https://git.buildroot.org/buildroot/commit/?id=6bf74ce3dbfec8979e379bc1b919f29d09f0d87b
> 
>>    xtensa    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/17cb7ca0e7ca1359fc2b575a6b6c93d493dd54fb |     
>>   riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/5b619163f23e356c790a04c027f9b9ba8b650c43 |     
>>     arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/d9dca72127a005952a7f97ec0297cec2fd3968f4 |     
> 
> /data/buildroot/buildroot-test/instance-0/output/host/lib/gcc/arm-buildroot-linux-musleabihf/8.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../src/.libs/libgdiplus.so: undefined reference to `GifQuantizeBuffer'
> 
> Sergio, could you have a look ?
> 
>>     arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/68b4aa933fd5a60f4ac2ea023079053f805c621b |     
>>    sparc     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/279f4f8f293a4aa73b6534e4cbc90e5583951daa |     
>>     sh4      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/1610673bc92f3cab2b858af8c4b1d0b6c871e614 |     
>>     arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e27bf4715cc68ef976b2124663cc1c2d08a06d04 |     
>>     arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/b43ef2ad840c5bf897d0453f86026b58654f9377 |     
> 
> This is a static linking issue caused by a change in the pkg-config
> handling in our meson logic. I have reported this to Arnout at
> http://lists.busybox.net/pipermail/buildroot/2020-February/274491.html.
> However now I see that Fabrice has proposed
> http://lists.busybox.net/pipermail/buildroot/2020-February/274178.html
> to resolve the problem, which seems like a good approach.
> 
> Arnout?
> 
>>   powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/673d2a580afb774c39faf69c859418579cefccde |     
>>   powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/7afbb81c0ebc93a75ec58c067f9758369bcae5d6 |     
> 
> These would be fixed by http://patchwork.ozlabs.org/patch/1235413/.
> 
>>     m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/f9d3d8534d090a575d163f92920b6ad6cc1531a2 |     
>>     m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/acf87e81130e85e7fb05edf5f6dedf095f16e226 |     
> 
> elf2flt I love you.
> 
>>     arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/67d341c0cc272323d6e231a20796a6848c21d760 | ORPH
> 
> src/svgtiny.c:21:10: fatal error: autogenerated_colors.c: No such file or directory
>    21 | #include "autogenerated_colors.c"
> 
> Some generated file is not here. Parallel build issue? Something else?
> 
> We don't have any maintainer of libsvgtiny. Any volunteer ?
> 
>>    x86_64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/49c150649fa50e9dc67939e072cd5a1d3a7aa661 |     
>>    x86_64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/86036e0e4e29eeffbe4aa10ca6e075155b675e72 |     
> 
> I would suspect these would be fixed by http://patchwork.ozlabs.org/patch/1240964/.
> 
>>     m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/61f53630ed85ee0d0d6dbf71012db77f4d7986ad |     
> 
> elf2flt issue.
> 
>>    xtensa    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/8c49a36b1fe423561473395d8f055c90436d2a5f |     
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/opencv3-3.4.9/modules/dnn/misc/caffe/opencv-caffe.pb.h:17:2: error: #error This file was generated by an older version of protoc which is
>  #error This file was generated by an older version of protoc which is
>   ^~~~~
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/opencv3-3.4.9/modules/dnn/misc/caffe/opencv-caffe.pb.h:18:2: error: #error incompatible with your Protocol Buffer headers. Please
>  #error incompatible with your Protocol Buffer headers.  Please
>   ^~~~~
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/opencv3-3.4.9/modules/dnn/misc/caffe/opencv-caffe.pb.h:19:2: error: #error regenerate this file with a newer version of protoc.
>  #error regenerate this file with a newer version of protoc.
>   ^~~~~
> 
> OK, needs to be investigated. opencv3 used to be maintained by Samuel
> Martin, but Samuel is no longer active in Buildroot. Any volunteer?
> 
>>     i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e0e7ed448df8bdd6cb13a0989d7a6c7dbaa5bc4e | 
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/8.3.0/../../../../i586-buildroot-linux-musl/bin/ld: vmtoolsd-cmdLine.o: undefined reference to symbol 'libintl_gettext'
> 
> Needs to link against the proper libintl library. Anyone to look into this ?
>     
>>  powerpc64   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/1ee145c19ee2cd5e6c237bc2864bae75e9ee4115 |     
> 
> Fails while downloading stuff during the build. I guess this is what is
> being fixed by the work on Cargo integration in Buildroot.
> 
>>     i686     |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/0996643e6d235168ca77271f15b21f8c167e400f |     
> 
> /home/buildroot/autobuild/instance-1/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/include/EGL/eglplatform.h:134:10: fatal error: X11/Xlib.h: No such file or directory
>  #include <X11/Xlib.h>
> 
> Anybody to have a look ?
> 
>>    sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7612824c472bd34f352a83aea50a9707442b1b42 |     
> 
> /home/peko/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/include/asm/termbits.h:16:8: error: redefinition of 'struct termio'
>  struct termio {
> 
> 
>>     arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/cba93a681d10692c4e4c5584e4c962bd18a608d4 | ORPH
>>     arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/efd344724a244010e3411bb6599dec42adb8acaa | ORPH
>>     arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3f7c9d3738db5154cad27e548495643225dde0bc | ORPH
>>     arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7513ce8a3c501aa31aa1bd1a9908ad090b2b11b1 | ORPH
> 
> These would be fixed by my series:
> 
> http://patchwork.ozlabs.org/project/buildroot/list/?series=159621
> 
>>   riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/f0c62cf7edda5c811c7f2eda6212d3889f2920df |     
> 
> Not clear why it failed. This is not a reproducible build issue, there
> are no errors in the logs. It was built with
> BR2_PER_PACKAGE_DIRECTORIES=y, so possibly with top-level parallel
> build, and therefore the error might be outside of the log.
> 
>>     arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/593c94c707508b549547e4b42727ce669229c820 |     
> 
> This one is a reproducible build issue due to elf2flt storing the build
> date in the BFLT header. I have already fixed this in upstream elf2flt
> https://github.com/uclinux-dev/elf2flt/commit/453398f917d167f8c308c8f997270c48ae8f8b12,
> we need to backport this in BR and rebuild our noMMU toolchains.
> 
>>   powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/47667ea26dc4ed87d4aeb4ac9ae86fcd42223c6b |     
> 
> Also no visible error here, also probably a top-level parallel build.
> We need to somehow fix the logic we use to extract the error when doing
> top-level parallel builds.
> 
>>     arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/ad8058cd98378d8813ab72bc292c8c5b9e41d7a0 |     
> 
> video_filter/opencv_example.cpp:200:46: error: could not convert 'cv::Scalar_<double>((double)0, (double)0, (double)0, (double)0)' from 'cv::Scalar' {aka 'cv::Scalar_<double>'} to 'CvScalar'
>              cvRectangle( p_img[0], pt1, pt2, CV_RGB(0,0,0), 3, 8, 0 );
> 
> Meh. VLC/OpenCV issue.
> 
> Thomas
> 
