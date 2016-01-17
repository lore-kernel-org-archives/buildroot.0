From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 17 Jan 2016 18:10:58 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160117001117.569d43f2@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
Message-ID: <CAGduivyTp9AvHe09K1QOeKA3VU34T5nTnw-jqnJhvMzyfQDf3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Sun, Jan 17, 2016 at 12:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Gustavo, Vicente, J?rg, Frank, Bernd, Maxime, Carsten, Davide, Jeremy,
> VIcente, Gilles, Gary, Romain, Matt, Waldemar, Fran?ois, Alexey, Joris,
> Volkov: there are some specific build failures for which your help
> would be appreciated. See below. Thanks in advance for your help!
>
> On Sat, 16 Jan 2016 08:30:21 +0100 (CET), Thomas Petazzoni wrote:
>
>>       xtensa |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/1bf954501960db802c3e2280b30b70d6813bdb32/
>>          arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/7ba954e03822d758e25356935b0dfc2c91d3712a/
>
> <dlfcn.h> needed by the topology code. Fixed in
> https://git.busybox.net/buildroot/commit/?id=4707383c5d501a9ad7698579e5d0a4e2ab758c7e.
>
>>         bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a5558d054ab19f078d0992f8b691f35f3f1323c0/
>
> Compiler error, in FLAT mode. Not sure what's going on, as I was able
> to build assimp properly in a minimal Blackfin FLAT configuration.
>
>>         bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f0d25c8b08ba32361d47bd6bc344695f168396de/
>>         bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3f143ea946ad98176d8e5eaddecfa0bda11c0439/
>>      sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/510c59e13f1412ffb831801e6389a32a76b543b6/
>>        sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3f6f7a72bec601688991111f21e897306b1d76ca/
>>       xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5eab445d66a977cdfb73a6b5dede6af692c28b16/
>>       xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a511687d937c2575d8edffe9235b1507be1c9442/
>>         bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/eb659085949c6b62108b8c46c50e8abd01681f23/
>>         bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4f3c001e8fa6781c4a2ca9d82023f959b7897035/
>>      powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5a90ba61c5ac863a7779af7783c7b0584a0c79e3/
>>      powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a70ec3a94a18db77f094c71d8be055ae0d99862b/
>>       xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c0a57f9a03c308dcf8129d300d12f4a7d6d999de/
>>      powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d37761e95f2f45e92ef641e7117ff6d02f2865d1/
>>       xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/651efb92cd38569a1c53000c642b37a5c4b21115/
>>      powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/498380d65b3e3d604a36facec894fc60a30a5d74/
>>         mips |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/37ce98706477b259da4e9527878aeada2d52366c/
>>      powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/686755f4f925811fccbdadbe28ba7561af8c51ad/
>>         bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2f46b77f27ca7df9ae80ecaa6fdca6d981eeb8ff/
>>      powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/7be9e4860ca47f8906c355577d71c0c6e8d597be/
>>      powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c0bc9693cfbac282599c73e7f0b6dd19e41bbfa3/
>>       xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/23b6e683aa3db28d2103e47fd263dc9c5afd99b8/
>>       xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/903515ab22c112dacf1583fff77c859c6f68985d/
>>      powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/23e03277f61490b6f48035075df0fc5e5474168f/
>
> I guess most if not all of these are fixed by
> https://git.busybox.net/buildroot/commit/?id=25ba49518a93265ecb3146e6eb21a2a138989100
> and
> https://git.busybox.net/buildroot/commit/?id=9ebac3bd050ee57cdd8a5ede053aed5522f5e8dc.
>
>>       mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/c4f88c724829e1a2ff152c756ea3dae80fef149c/
>>     mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/870879c3d20dcfb327329fab0d8c13f320fd5788/
>>       mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/1d1889f407adce09f313e8660f8b660f256ea277/
>
> Vicente, Gustavo, can you have a look at those issues? It seems to be
> limited to MIPS, and I don't think it was happening before the recent
> bump of the bind package.
>
>>          arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/83112559d84dc156141339a31e3e02f1a2af5155/
>
> Fixed by
> https://git.busybox.net/buildroot/commit/?id=d7c54cb0c0cf8cb013d88ad3c2989ec323323235.
>
>>      powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e92fc7bac808e708e1aadd1b8e6677d003e5bbe4/
>>          arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/46d0907fe06a7b93bb092ad4bf869a2e0030cf32/
>>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9ef4d4f5d793f9a854d3a398d00eec6ce9b59178/
>>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/74e22545f50c9f9e7f12208a1cb9cbb9154a6150/
>>      powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5438729ded4bf9887a1dc080366aee9abf27fb19/
>>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/99ef4325d424569bbd900d6590b8a3a5e445c140/
>>          arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/caded0b9ff89ba69cb3775d5fef18565a85a398a/
>>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b81bcc845a091ff1182df7dec306492b67db10ea/
>>       xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/29241cbf4791947e8bd990253716d8d43e219c23/
>>     mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/648507a680fa0360622ad1fdd47fdf30d3c54091/
>>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dea9364e8d8276bbcf42847822ef5da905cd7007/
>>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/adcea53d916e0825cb5963768304dfe883d5d379/
>> microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/41ee80a733bc676d07d8296b262125b616070835/
>>       xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2c555d574540caf3a3b1ed64502274d3ba1f551b/
>>          arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/316dc6221a50537234e4b3e88268363d61b9bf59/
>>          arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d4eb7cdbfd1152bb5a2a80f832c5edf524852701/
>>          sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3bb3e2b683eabe7a6a9626f083b761b158a418ba/
>>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0e2f3f4e4fa9dca521206d52fc061709534be12b/
>>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/84f5d3417ef5cdb826435b0029ddc8d2e9e4ec44/
>>       x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/428cb84d3bde356050b04647a599aea0fae6aeff/
>
> Some of these are the isnan() declaration issue, which is now fixed
> thanks to
> https://git.busybox.net/buildroot/commit/?id=640b75c8d73d713c908d6b288802c9e6bffe76ed.
>
> However, there is still the FE_* definition problem. J?rg, do you have
> something in the works to fix this ?
>
>>          arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/5c5a48b050223d5f4f66a3a5ddde12cb17e310d7/
>
> musl build issue. There was a thread in August between Yann and Brendan
> about this. I pinged the thread.
>
>>          arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/20019b0daebf1aaf44e0802603108ff712f60513/
>
> In static linking configurations, when SDL_mixer is linked against
> libmad, chocolate-doom doesn't pass -lmad. To fix this, we need to:
>
>  * Fix SDL_mixer.pc so that it references libmad in Libs.private (or
>    Requires.private ?)
>
>  * Either use pkg-config directly in chocolate-doom.mk to pass the
>    appropriate flags, or change the chocolate-doom build system itself.
>
> Note that a similar problem might appear when SDL_mixer is linked
> against vorbis.
>
> Rodrigo, since you added the chocolate-doom package, can you look into
> fixing this ?
>
>> microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/50b9c93c0ee080c42362fd6d210745446077d7f5/
>
> Don't care.
>
>>          arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/2040d919e9d2564cf283ab815bea5ef34840ee61/
>
> musl build issue. Carsten, you added this package back in 2013, can you
> have a look ?
>
>>      aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0cd22eb74fa29e5a85bf897762e16ab3daf33962/
>
> Build problem due to atomic intrinsics:
>
>   more undefined references to `__atomic_store_16' follow
>
> Frank, can you investigate why it builds on x86_64 but not on aarch64 ?
>
>>       x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/617e5635e0c508f82043f21886b6ce9a30549ad2/
>
> Classical musl build issue. Maxime, you added this package, so can you
> fix it ? :-)
Yep, I'll cook up some patch for this.
>
>>     mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/12ef8ee60b3c016e8998ff240a6dc51e682f3058/
>>     mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/a964ce679fed3eaaebd0ee2f39639d8243e227ef/
>
> ERROR: fontconfig not found using pkg-config
>
> Bernd, Vicente ?
>
>> microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/6126357850f15fb97828cd1b186e71ced83716eb/
>
> internal compiler error: in gen_reg_rtx, at emit-rtl.c:838
>
> To be tested with the latest gcc version, and potentially report a gcc
> bug.
>
> Davide, you added this package back in 2014. Can you have a look ?
>
>> microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/4fa96981077c61599cc04b7c0f96b9f430f17f85/
>
> Binutils issue this time:
>
> /tmp/ccQKhnE1.s: Assembler messages:
> /tmp/ccQKhnE1.s: Error: PC relative branch to label logerror which is not in the instruction space
> /tmp/ccQKhnE1.s: Error: PC relative branch to label logerror which is not in the instruction space
>
> Same deal: test with the latest binutils version, and report a bug if
> the problem still exists.
>
> Jeremy, you added the fxload package, can you have a look ?
>
>
>>         i686 |         gst1-plugins-bad-1.6.2 | NOK | http://autobuild.buildroot.net/results/fab7afc3490d77a6b29760394337298f2fd55d51/
>>       x86_64 |         gst1-plugins-bad-1.6.2 | NOK | http://autobuild.buildroot.net/results/4da1b0454fe7bf028a62058d28dafda104fb75f4/
>
> gstdvbsrc.c: In function 'gst_dvbsrc_code_rate_get_type':
> gstdvbsrc.c:273:6: error: 'FEC_2_5' undeclared (first use in this function)
> gstdvbsrc.c:273:6: note: each undeclared identifier is reported only once for each function it appears in
> gstdvbsrc.c: In function 'gst_dvbsrc_modulation_get_type':
> gstdvbsrc.c:303:6: error: 'QAM_4_NR' undeclared (first use in this function)
> gstdvbsrc.c:303:5: error: initializer element is not constant
> gstdvbsrc.c:303:5: error: (near initialization for 'modulation_types[13].value')
>
> Not sure. Peter, Gustavo ?
>
>>        sparc |                 harfbuzz-1.1.3 | NOK | http://autobuild.buildroot.net/results/30dec74537539dcbfa97eb9f90f40b2a814830d1/
>
> hb-warning.cc:32:2: error: #error "Could not find any system to define atomic_int macros, library WILL NOT be thread-safe"
>  #error "Could not find any system to define atomic_int macros, library WILL NOT be thread-safe"
>   ^
> hb-warning.cc:33:2: error: #error "Check hb-atomic-private.hh for possible resolutions."
>  #error "Check hb-atomic-private.hh for possible resolutions."
>
> Gustavo, maybe we simply should disable this package on Sparc ? Only
> annoyance is that it is selected by Pango, which means that all reverse
> dependencies of Pango would have to be fixed :-/
>
> Another idea ?
>
>>      aarch64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/7d70b7dac91209d1a63c131e9eb098bd8be3e84c/
>
> make[3]: *** No rule to make target `hidtest.o', needed by `hidtest-libusb'.  Stop.
>
> Vicente, you added this package, can you have a look ?
>
>>      powerpc |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/49d02998eeb5817d92574f61f6786a4f5c71d131/
>
> Modules/getbuildinfo.o: file not recognized: File truncated
> collect2: error: ld returned 1 exit status
>
> Ooch, smells like a parallel build issue... but building Python with
> make -j1 would really be horrible :-/
>
>>        nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e8e730f90357fd9818d19ae48b7533c8c5dcbc49/
>>          arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3c673e550535d741d2773e359ed2bebaebad6ad2/
>>         bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5d526c4348a0ab3d802a9ef795096b2bfd1b3515/
>>          arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e64262b0045195892b2c7ed08cfef8f5682b9793/
>>       x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/844424b9db5ced38f90936fdc96eba480de34459/
>>         bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3ef4945e7c51f354eb4444fc40f50ba0e86929e9/
>>          arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/cec1c9d0723d72693d526dcfc3e9432b7694911f/
>
> Issue specific to this autobuilder instance, I'll have a look at this
> one.
>
>>          arm |                    httping-2.4 | NOK | http://autobuild.buildroot.net/results/f88f0dd592a52128d250b2c8668a524d6ca35d24/
>
> Improper libintl handling. Gustavo, you bumped this package last year,
> can you have a look ?
>
>>          arm |         imx-kobs-3.14.28-1.0.0 | NOK | http://autobuild.buildroot.net/results/05a159c7f8382237d4c941b1bb6de7dad72708f3/
>
> Gary, can you have a look ?
>
>>          arm |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/61e121c25fc07083bcccedfcb4f938d18f5c5456/
>
> Musl build issue:
>
> iprlib.h:49:27: fatal error: bits/sockaddr.h: No such file or directory
>  #include <bits/sockaddr.h>
>
> Romain, you bumped this package recently, can you have a look ?
>
>>          arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ce0bb96971147669c1bb253ce259eb5756f1d85e/
>
> Musl build issue. Gustavo, can you have a look ?
>
>>       x86_64 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/12cb73f3def95efe706bcd957bc2c091e7931d5a/
>
> Musl build issue. Matt, can you have a look ?
>
>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ae9eca750d27f80cf8b0743f41cdfcc50ea476f1/
>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/dca1ba4a15cd9326a43e99d78bd13021bc87d9a2/
>
> Romain, I don't remember what was the conclusion about this issue. I
> remember we discussed it at some point.
>
>>        sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/fa0ac44d3c7953b2e2afa03cd7570d8a5d49fcc4/
>
> Waldemar, this is a sparc problem, can you look into it ?
>
>>         mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cf7fd3dc8a1373c6c963a83e55d093b945f90f1a/
>>     mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a7dd03a12c06a1f01826f01f91b39af396dca0d8/
>>     mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a39a87c6547c9daa27e8a257c9e573d4c222fca4/
>>         mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f09b5d6120203cd5ddc60951828f880905297bcb/
>>         mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/108cdfac94e88bfdc318e0689295a3799cc23069/
>>     mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c14cabcc51f6870a0ab2381b32220d944590669f/
>>     mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f05e78f97928c5da48678cdf2e465d413fd5feca/
>>         mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0094b3f30f8815fa5ef10afb3b0e506549ee8674/
>>     mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4de0087f2bf63612c4354970d8307be7fa8beefd/
>>     mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5d9f963a30eea53dd22f0b0d6f0d63592114977a/
>>     mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0616fba52db8793ea5ac1383c47a86a72aae682f/
>>     mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e2d5f87095f877c9ff7807419014e4af8b43130b/
>>         mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4dc9605b801518aa8075972e46e83d4df98cdbb5/
>>     mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/26dd14f492e4a544400f2d2c6800ee5cde4a0b1f/
>>         mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8c668a64b6b9ed4ba7a77c3d3211a41de89c33b6/
>
> Vicente, we really need to solve this problem :)
>
>>          arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/9ba9e0c148110b69763c12e37a37738deab3f118/
>
> /home/buildroot/autobuild/run/instance-1/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/lib/libnspr4.so: undefined reference to `getprotobyname_r'
> /home/buildroot/autobuild/run/instance-1/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/lib/libnspr4.so: undefined reference to `getprotobynumber_r'
>
> Musl build issue.
>
>>      powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/cef2fe3d87b742743a54a2fdbc585771e175a9e6/
>
> In file included from secoid.c:1915:0:
> verref.h: In function 'SECOID_Init':
> verref.h:22:9: error: #pragma GCC diagnostic not allowed inside functions
> verref.h:23:9: error: #pragma GCC diagnostic not allowed inside functions
> cc1: warnings being treated as errors
>
> old compiler problem.
>
>>         i686 |                lighttpd-1.4.39 | NOK | http://autobuild.buildroot.net/results/13faa9ebce00359b8943775364a432ce422fe8b8/
>
> mod_magnet.c: In function 'magnet_status_set':
> mod_magnet.c:415:2: warning: implicit declaration of function 'luaL_checkint' [-Wimplicit-function-declaration]
> mod_magnet.c: In function 'magnet_copy_response_header':
> mod_magnet.c:692:2: warning: implicit declaration of function 'lua_getfenv' [-Wimplicit-function-declaration]
> mod_magnet.c: In function 'traceback':
> mod_magnet.c:839:18: error: 'LUA_GLOBALSINDEX' undeclared (first use in this function)
> mod_magnet.c:839:18: note: each undeclared identifier is reported only once for each function it appears in
> mod_magnet.c: In function 'magnet_attract':
> mod_magnet.c:987:19: error: 'LUA_GLOBALSINDEX' undeclared (first use in this function)
> mod_magnet.c:992:2: warning: implicit declaration of function 'lua_setfenv' [-Wimplicit-function-declaration]
>
> Fran?ois, this seems to be Lua related, can you have a look ?
>
>>          arm | linux-firmware-bbe4917c054e... | TIM | http://autobuild.buildroot.net/results/fc6001a9fcaeab2a67d03d5809360de00c16392a/
>
> Ignore.
>
>>        sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/faa42138e2b5a07b965926e55b831cb6e8eb3c0c/
>
> `undefined__sig_stub 'reference
>
>>      sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/85e181c2f75037e0d9b9a7bd288d9fdaa828bb34/
>
> undefined  toreference  `to__rt_sig_stub '`
>
> Waldemar, can you have a look ?
>
>>          arm |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/80d137d91e6f6173e29074cf12a38f192ce0d7ca/
>>       xtensa |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/15a0e4c3879eb56604fa88c2e31be641e933afa7/
>>      aarch64 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/39d2bae1398bd17891a9d0d2f698340fc7dca591/
>>         i686 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/7ac0eb736ad264c59637059ce207989c392f00f7/
>>      aarch64 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/a95d9b6eee7b41a0ce4cf6456fde08291cd8b860/
>
> Fixed by https://git.busybox.net/buildroot/commit/?id=be5d265220f36df7e0b633fcc55e3a33b2e74035
>
>> microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/8df9f0dd9cbc0446c0458d89cb182d0feb795774/
>
> Ignore.
>
>>          arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/7b3f5c0e3c59bd49614e8ad4eee3d89e3527a939/
>
> Compiler problem, issue is known by Synopsys.
>
>>      sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/268e328e2d9ea951c0728ab6031d32e2b460d015/
>>      sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/84847a9201244fce3e05e5e4e201f2e1848238de/
>
> ./libmoar.so: undefined reference to `AO_fetch_compare_and_swap_full'
>
> Waldemar, can you have a look ?
>
>>      powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/948f81d7ed2c080a675ee9fec754f6fda1fd905f/
>
> Not sure:
>
> cache.c: In function 'same_path':
> cache.c:429:22: error: field 'fh' has incomplete type
> cache.c:436:2: warning: implicit declaration of function 'name_to_handle_at' [-Wimplicit-function-declaration]
> Makefile:613: recipe for target 'mountd-cache.o' failed
>
> Maxime, can you have a look ?
I will look at it, the errors is a bit puzzling but I only glanced at
it for now.
>
>>          arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/8fb9cb823d723903f11d70325b0ea09e103504cf/
>
> checking whether to build SNMP drivers... yes
> configure: error: "neon libraries not found, required for neon based XML/HTTP driver"
>
> Most likely a static linking problem.
>
> Yann, you added the nut package, so ... :-)
>
>>      sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/84cfdfa21205954cb8f0e5541332570ba5206add/
>
> Another atomic related problem. Waldemar ?
>
>>          arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/aa2cf491dfb199a349afd107046f428107a583a0/
>
> Musl build issue:
>
> ./include/pgm/gsi.h:47:75: error: unknown type name 'ssize_t'
>  bool pgm_gsi_create_from_string (pgm_gsi_t*restrict, const char*restrict, ssize_t);
>
> Anyone to look into this?
>
>>       mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d8d6414ae28d9ea84118dfa5c0f73d9334a1c417/
>
> error: member 'QChar std::__cxx11::basic_string<QChar, std::char_traits<QChar>, secmem::alloc<QChar> >::<anonymous union>::_M_local_buf [8]' with constructor not allowed in union
>   _CharT           _M_local_buf[_S_local_capacity + 1];
>
> Anyone understands this ?
>
>>          arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a85a1839a45fb6102e53131ecc8f6dadf92bcdc2/
>
> Static linking, I'm assuming this *could* be fixed by
> https://git.busybox.net/buildroot/commit/?id=12009bb92931b153823110f811632540044d3b02,
> though I am not sure. Alexey ?a
>
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/199b8ed788e4ca3eca03b95710a3bb644d81d187/
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/546f94ee09fcff27ea2d7c6cebb0b48aec1881f8/
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bb90227b6a18bde0cef45f82620de560d48866e7/
>
> Compiler problem. I don't remember if I reported it.
>
>>          arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/2ef1ed958db8012224f9174334e9c58edace604a/
>
> Static linking problem. Joris, can you have a look ?
>
>>          sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/499f2a3204a6afab96322c431732541fefd622e8/
>
> Internal compiler error...
>
>>          arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/8e98934b066d4973d88e7d28b042b99550d68ae8/
>
> Compiler issue:
>
> /tmp/cctdImle.s: Assembler messages:
> /tmp/cctdImle.s:2253: Error: invalid register number `63'
> /tmp/cctdImle.s:2255: Error: invalid register number `63'
>
> Alexey ?
>
>>      powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d0a77147cba429bb42f102141810a23e831a8bcb/
>
> Compiler issue:
>
> eval.c: In function 'rb_protect':
> eval.c:881:1: internal compiler error: in move_insn, at haifa-sched.c:3439
>
>>          arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/748771df79b8537d3f4baeb1f7d423dec1f8c519/
>
> Same ARC compiler issue as above.
>
>>          arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/9759238db294c0703e8c685f2adc41dba3fdb31f/
>
> ../backend/.libs/libsane.a(libepsonds_la-epsonds.o):(.bss+0x10): multiple definition of `source_list'
> ../backend/.libs/libsane.a(libepson2_la-epson2.o):(.data+0x40): first defined here
> ../backend/.libs/libsane.a(libepsonds_la-epsonds.o):(.data+0x10): multiple definition of `mode_params'
> ../backend/.libs/libsane.a(libepson2_la-epson2.o):(.data+0x0): first defined here
>
> Vicente, you bumped sane-backends recently, can you have a look ?
>
>>     mips64el | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/be8d1ad7c05b39f8ed65b86f938bc2d9530e3c6d/
>
> Static linking issue, most likely:
>
> checking for mysql_init in -lmysqlclient... no
> configure: error: library 'mysqlclient' is required for the mysql module
>
> Anyone interested ?
>
>>          arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/c3d3bedffe0f4ba40f33d18e90a4802f4a7bfffb/
>
> PIE problem, under discussion.
>
>>          arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/357de0b07b2104e0c94cb3d21ca2096df0796071/
>
> Tries to build a shared library, in a static linking scenario. Anyone ?
>
>>       xtensa |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/64ac87a2a4847a45fc96cfaa4ded7f0821f66701/
>>       xtensa |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/9ebc5e3a6f1dd3ceb90d6786a1c5455c965f819e/
>> microblazeel |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/a197f03c1751a87c7f71e057f2c4619538b4b6c8/
>
> Patch pending to fix this.
>
>>       xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/f913556517654f833bf17f141597ba41570b02b7/
>>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/865ce538e3dc3ce8005a39b5400fc3f019d7a411/
>>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/0581889edfb7bf5ca0f23e3111ac6eeffbee3376/
>>     mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/1abb03babacacf13db33ae9fe89b5d52925b58b1/
>
> 2 different dependency problems.
>
>>          arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/2ca06e6bb9b147a44400e26acdd41dcc3ab7d9e4/
>
> checking for prlimit... no
> configure: error: flock selected, but required timer_create function not available
>
> Static linking issue. Anyone ?
>
>>         mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/a00f4856c4094508334477296d0ec203466fe56e/
>
> Vicente, this one is for you :)
>
>>          arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/aacb5ae636e2ae2df67a91696b1d2af276777b22/
>
> Yet another static linking issue caused by libintl.
>
>>        nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/d4a9e291ad1b36bd268b4b850aa10be3ac00b6d9/
>>          arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/c9cdee9e5cd031e5927b7aa26d92c48dbe35c1e7/
>
> Really bogus code triggers a warning that is now an error. Volkov, you
> added the zbar package, can you have a look ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
