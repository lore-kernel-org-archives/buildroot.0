From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 17 Feb 2017 23:02:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <20170217211242.GC3470@free.fr>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
Message-ID: <20170217220250.GJ12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
Yann E. MORIN wrote,

> Fabrice, J?rg, Simon, Jonathan, Will, James, Gustavo, Wojciech,
> Waldemar, Bernd, Adam, Eric, Julien B., Julien C., Peter, Vicente,
> Cyril, Sam, Samuel, Spenser,
> 
> There are questions for each of you below. Could you please take a
> moment to have a look?
> 
> On 2017-02-17 08:28 +0100, Thomas Petazzoni spake thusly:
> >         or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/cd963404761070623489ee74df3e69f5052f40a1
> >         or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/99e6e01f0d85fe8eb5d9b09fcc3971b577c9ba6b
> >         or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/e5b471dbb91ef2a15844a9ee6d1a83a38f7cc07d
> 
>     error: 'printf' was not declared in this scope
> 
> Fabrice?

There is already a patch on the list, it is just unclear why this is
only happening for or1k toolchain. Maybe an issue in the modified gcc
5, which is in use.
 
> >         i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/bd4cca6e7706a68dd6c16a7bb409185c9f006a57
> >         m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/4118477ac02732b99b8bb3db8bef43290edbc5de
> 
> Neither mbedtls nor poarslsl detected. Patches by J?rg on the list (in
> this order):
>     https://patchwork.ozlabs.org/patch/728005/
>     https://patchwork.ozlabs.org/patch/728007/
>     https://patchwork.ozlabs.org/patch/728004/
>     https://patchwork.ozlabs.org/patch/728006/
> 
> >          arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/9d0cbb045a21d6b97d33f791c90eacd84198dee8
> >          arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/5179aade1ddfe3975b17f49b534e84ba1a55bdab
> >          arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/9330594ec5870f255edd8a2df81052257d228cfd
> >          arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/0b87eb16d3bdef25e618f5c54181d18a465ef655
> 
>     undefined reference to `pthread_cancel_init'
>     undefined reference to `__libgcc_s_resume'
> 
> Probably needs NPTL. Simon?

uClibc-ng static ARM issue, patch sent.
 
> >         or1k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/81047e13f4d7896abae1036e098303e6bf68a0e7
> 
>     error: 'strtoll' is not a member of 'std'
> 
> C+11 stuff... Jonathan?
> 
> >     mips64el |                   dbus-1.10.16 | NOK | http://autobuild.buildroot.net/results/2a4d8539c2a325eec5ade5e06452294e32cb12b7
> 
> Transient download error. Ignore.
> 
> >          arm |                  enchant-1.6.0 | NOK | http://autobuild.buildroot.net/results/70d72b5e767965726a1e5eca437f3efc4af92c86
> 
>     multiple definition of `_Unwind_Resume'
>     undefined reference to `pthread_cancel_init'
>     undefined reference to `__libgcc_s_resume'
> 
> Probably needs NPTL. Will?

uClibc-ng static ARM issue, patch sent. 
 
> >         i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/b7f95e39d5b6984594fbf1e7549ddb3cf281600c
> 
> Tries to link with host libraries. I'll take it.
> 
> >          arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/fb14e37aaf453874d1c33e5ed73b9c751ace5ae3
> >          arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/774a8dd489760bc213ac7cf3e8040cee6a4e2437
> >          arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/80aba6b26a21914197388baf73ada4b79952db13
> >          arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a2bda0553eff5e415e622aa7a38763d838ae43c2
> 
>     multiple definition of `_Unwind_Resume'
>     undefined reference to `pthread_cancel_init'
>     undefined reference to `__libgcc_s_resume'
> 
> Probably needs NPTL. James?

uClibc-ng static ARM issue, patch sent.
 
> >         or1k |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/c24dd55e773167be182f40ae723e82d3f71c6eba
> 
>     error: field 'uc_mcontext' has incomplete type
> 
> Some ucontext issue on or1k (see below, there are more)... Waldemar, Gustavo?

uClibc-ng or1k issue, patch sent.
 
> >         or1k |              gstreamer1-1.10.3 | NOK | http://autobuild.buildroot.net/results/717d78ce0935749f477bdf3133b6f20057a28c01
> 
>     error "Could not detect architecture; don't know whether it supports
>     unaligned access! Please file a bug."
> 
> Not available on or1k? Gustavo?
> 
> >         or1k |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/470eac9012c5a551ace8079e1bdb3ffbc5a73c1e
> 
> Again some ucontext issue on or1k. Waldemar, Wojciech?

uClibc-ng or1k issue, patch sent.
 
> >         or1k |                  jsoncpp-1.7.7 | NOK | http://autobuild.buildroot.net/results/8d5145eaca2939206b88ea5abfef9bd11fefca69
> 
>     error: 'snprintf' is not a member of 'std'
> 
> Some C++11 trickery again? Bernd?

Maybe something similar to alljoyn issue?
 
> > microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/aef1b915ffd3e5678af8682727c22c5618edfd89
> 
>     collect2: fatal error: ld terminated with signal 11 [Segmentation fault]
> 
> Spenser?

Interesting. uClibc-ng toolchain, I will take a look.
 
> >       x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/e7505f36d7c2cfaf7527515b2e3014c2e8e2c5ca
> 
>     undefined reference to `std::__cxx11::basic_string<char,
>     std::char_traits<char>, std::allocator<char> >::basic_string
>     (std::__cxx11::basic_string<char, std::char_traits<char>,
>     std::allocator<char> >&&)@GLIBCXX_3.4.21'
> 
> Some ugly C++11 issue? Bernd?
> 
> >      aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/0a266f54e2938f7479232b7acec1834250f6c064
> 
>     error: conflicting types for 'khronos_uint64_t'
> 
> Gustavo?
> 
> >         or1k |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/d8715a2b3783d877edf91bb14a80d36eac749b36
> 
> Yet another or1k ucontext issue... Waldemar, Simon?

uClibc-ng or1k issue, patch sent.
 
> > microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/638a65453879777a0d5bdb29231034cd261b41c0
> 
>     collect2: fatal error: ld terminated with signal 11 [Segmentation fault]
> 
> Booo... Spenser, any idea?
> 
> > microblazeel | make[4]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/92c165a970b9d8912c5ca50ed3567478cd2a2b3d
> 
> Timeout, but weird: the ffmpeg build started at 3850 seconds (a bit more
> than one hour) and the timeout is supposed to be 8h, so the ffmpeg build
> did not finish after about 7h...
> 
> >         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8ace02ec35eaa691c65c95240ecf7caa8137ea70
> 
>     error: 'asm' operand has impossible constraints
>          __asm__ volatile(
> 
> Bernd?
> 
> >  powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/4ba59ebb2cd16ed7e70c67e89f5f80c5b803d3c3
> >    powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/b97341c59b9c6f7dbdfe59cd770e0c285be8fa06
> >  powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/741535d8d9c75acebeff96679d4f1ac6ecbc5f61
> 
> Patch on the list:
>     https://patchwork.ozlabs.org/patch/706869/
> 
> >         sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/2944568f9623f1377e987a1dadde5ea8cc428c5f
> 
>     error: 'SIZE_MAX' was not declared in this scope
> 
> Missing header? Samuel?
> 
> >          arc |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/89864a1cf0d8b27b3efdf3c36ccb3244e88a6746
> 
>     undefined reference to `dl_iterate_phdr'
>     ld: GOT and PLT relocations cannot be fixed with a non dynamic linker

Some bells are ringing. We have a buildroot uclibc-ng toolchain with
BR2_STATIC_LIBS=y. But I see no explicit -static in CFLAGS/LDFLAGS
for this package, which might be the reason for the failure.
 
> Static linking issue. Julien B.?
> 
> >       x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/e9ff38bea523df79331de3004939ee39b446d723
> 
>     error: narrowing conversion [...] from 'char' to 'uchar...'
> 
> Damn gcc6... ;-) Should be easy; any taker?
> 
> >        nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/a02c4da118c2d0f90016c5e3c8877782d6882f96
> 
>     ld: BFD (Sourcery CodeBench Lite 2016.11-32) 2.26.51 assertion fail
> 
> >        nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/116931f17c4eb4977638ca0392bd6024e05d4ff9
> 
>     #error Target architecture was not detected as supported by
>     Double-Conversion.
> 
> No qt5 on nios2? 
> 
> >          arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/41a0559f0d3c760ba9aad77dea4ed43e25b63ac4
> 
>     Project ERROR: Library 'libpng' is not defined.
> 
> But it is enabled in the build. Dependency issue?
> 
> >          arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/8f55bdbdce189c14baed772bb74eb41a0f8ce83c
> 
>     #error "ARM architecture too old"
> 
> arm920t is an armv4. Surely we would not expect something big as Qt5 to
> stil work on such an old beast...
> 
> Julien C., for the other three qt5 failures: any idea?
> 
> 
> >      powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/1fd4195d3e941f4963a1957e4194b4e05e7bb909
> 
>     ld: BFD (crosstool-NG hg+-c65fcf8a34b7) 2.24 assertion fail
> 
> Cyril, Gustavo, Sam: you're the PPC experts?
> 
> >       mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/48a78b16a63448e1ac91efa7ae0ca77b2b9dba49
> 
>     Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v0,$t8,$t7'
> 
> Julien C., Peter S., Vicente?
> 
> > microblazeel |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/d4f2f7381e1313758816b91aacad664240a2beac
> 
> Needs NPTL, patch on the list:
>     https://patchwork.ozlabs.org/patch/729320/
> 
> >         or1k |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/8cf276e18d935fe03059941f56786bfd210b700d
> 
>     error: field 'uc_mcontext' has incomplete type
> 
> Again an or1k ucointext issue. Waldemar, Eric?

uClibc-ng or1k issue, patch sent.
 
> > microblazeel |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/716eced276823a225c30fd2534d88bfe0d90ac33
> 
>     undefined reference to `tputs'
> 
> Needs ncurses, static linking issue?
> 
> >       x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/28c76e4125134b729f99099c3a53c1dcc55d0f12
> >          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/558fd8acb31afd0a57c0c01020f73d9ee17a7bd9
> >          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/fd599fd32ceab165a4926044e42f543c03179dec
> >       xtensa |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/3bba96405442dd97bdecfdc7865e4e13927fd327
> >          arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/7e96654503efcc79d386e13e23c21031738d493c
> >     mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/bd4c8eb1687713062e5b1ebbcde7f464c13779f1
> >       x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/59f8410ba54e6ebbd7b65fd36f6b192a11f1262a
> >      powerpc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/6ec46927ce16cf2b159805872ebef363c75e7551
> >          arc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8005ec840ac748970f6c4d49a3b5f1e2f1b69adc
> 
>     configure: error:  You need to have ncurses forms library installed to
>     compile sngrep.
> 
> ncurses is disabled in this config. Adam?
> 
> >          arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/2d31a3295e51c5866fedae4adb0aa464e5079987
> >          arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/e240455fc0bc6141988b5e1209f1a9b85b016361
> 
> The wchar issue raised by Thomas upstream, which has a patch:
>     https://github.com/dbry/WavPack/commit/876fc3f3907e871d0938ac6c8c5252f5f31abd1f
> 
> Gustavo?
> 
> Thank you all for looking in these issue! ;-)

best regards
 Waldemar
