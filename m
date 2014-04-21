From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 11:49:49 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-20
In-Reply-To: <20140421063009.036D5100FF4@stock.ovh.net>
References: <20140421063009.036D5100FF4@stock.ovh.net>
Message-ID: <20140421114949.59c65c31@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As usual, analysis of the build results. Please help to fix them! Is
there some interest in me doing this on a regular basis? Or it's not
useful?

On Mon, 21 Apr 2014 08:30:08 +0200 (CEST), Thomas Petazzoni wrote:

>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2cb13a5bb92dabed219d49f49f0b9a2dfe65a0ca/

cairo-gl-private.h:287:5: error: unknown type name 'GLchar'

Could some OpenGL person look into this? Paul ? Yann ?

>   mips64el |   Compiling ../librpc/ndr/ndr_ | TIM | http://autobuild.buildroot.net/results/2ca7cc97b9980a2066388aa5c6df41f67da1a60f/

Another timeout to be investigated.

>       bfin |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/5ee69eb7492fbd462124d7a23b5b79003fc1dd64/

Fixed by
http://git.buildroot.net/buildroot/commit/package/cppcms?id=f9db7e6865e1805e8281136d5f2a6965f6a3b5c2.

>       bfin |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/c605022f2ff7168d28cc07e4176a3a3067aa7e36/

/home/test/test/1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libc.a(strncpy.o): In function `*___GI_strncpy':
/usr/src/packages/BUILD/blackfin-toolchain-uclibc-full-2013R1/uClibc/libc/string/generic/strncpy.c:27: multiple definition of `_strncpy'
libduma.a(duma.o):duma.c:(.text+0x144): first defined here

>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/920f6a913673a08ffd45712b41daad59644b99f1/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/8da7e6c8be07d6fcae3f18cdaf777ba16b636add/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/480b55155facf61f69b49e124865c20d000270b4/
>     x86_64 |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/3fcbf35ed720fa478adc4f6d6e8475ba8b68ca78/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/c8d83c695bd97b7ce7f5907ca7b1d1d514f6cc07/

All fixed by:

  http://git.buildroot.net/buildroot/commit/package/nodejs?id=fb80d283412b610fc0f5e4baf1c5bcdf093dadc2

Thanks Samuel!

>    powerpc | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/4216666973fdb8038732c78a95b47c3faf1f6546/

Remains to be fixed.

> microblazeel | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/ede17f2fdb9b5cd4b974ef820d95b0eba863c420/

Fixed by http://git.buildroot.net/buildroot/commit/package/jack2?id=5035af0cbb6a1dcb1e9b443fbf601be4fad737f9

> microblazeel | libstrophe-d408eaf2bbfe5ff5... | NOK | http://autobuild.buildroot.net/results/5bce2ff6b8cf6ec082b9ec0e5b7e4a80d7395225/
>     xtensa | libstrophe-d408eaf2bbfe5ff5... | NOK | http://autobuild.buildroot.net/results/499ffd50ec58b54343d6606c0f1bf7cd04f14e1c/
>       sh4a | libstrophe-d408eaf2bbfe5ff5... | NOK | http://autobuild.buildroot.net/results/b91a199ccdfe36d7f6d884bcf1642416ddf61264/

All fixed by
http://git.buildroot.net/buildroot/commit/package/libstrophe?id=c946a78996c25a65861672389a63ac59b3a5a4bc.

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/03e897160964108d30390200d299025f6dadb31c/

Compiler bug.

>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/257a10e9cb5022bb09e0c6a03844be5b5b3e0bd4/

Fixed by
http://git.buildroot.net/buildroot/commit/package/mplayer?id=e3de3ae58e830729bde1fcdc7da634567f4f3fa2.

>        arc |                openswan-2.6.41 | NOK | http://autobuild.buildroot.net/results/71f92d80b1aa3ac98660fb88004efd0ea55e784e/

/home/test/test/3/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/test/test/3/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/crt1.o: relocation R_ARC_32_ME against `main' can not be used when making a shared object; recompile with -fPIC
/home/test/test/3/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/crt1.o: could not read symbols: Bad value
collect2: error: ld returned 1 exit status
make[4]: *** [pluto] Error 1

Could some ARC person look into this? Alexey, Anton?

>        sh4 |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/f0592a6b04fd30b51796d69ca0b31cd8238a1dda/

This is for Gustavo :)

>      avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/1aad2d677dbf7b0a3cb0120a35f45123124f51ab/

Fixed by http://git.buildroot.net/buildroot/commit/package/python?id=616dd6245be75798fa6d9fd057a0fb5d7020dc97.

>        arm |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/8eddd934bd80fdbcdf7a9dbf5d9f8b7ba69634d4/

Fatih, could you have a look at this issue?

>     x86_64 |                qt5webkit-5.2.1 | NOK | http://autobuild.buildroot.net/results/527315bf9b506ec32a2fbd255526570c7486e5fb/

Compiler bug.

>        arm |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/27d22ff075e5e3e696d05ac6319043a5129abadc/

configure: error: chfn_chsh selected, but required PAM header file not available
make: *** [/scratch/peko/build/util-linux-2.24.1/.stamp_configured] Error 1

Fixed by
http://git.buildroot.net/buildroot/commit/package/util-linux?id=cb39b46f6007d02ba8db7611b5f11705b96e6cd1,
thanks Samuel!

>        arm |                vo-aacenc-0.1.3 | NOK | http://autobuild.buildroot.net/results/680b29cd824624eb8e4ec71187b9a6576444e72b/

Fixed by
http://git.buildroot.net/buildroot/commit/package/vo-aacenc?id=dc4d0e2f5cc783a826b3bfe4d31c00840407a8e2.

>       bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/dc8dd7c1dd019dd06c4f806f2bd44d270eca4905/
>       bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/439df2ad4482d08f295dbc40b2e88bf9167a7794/

I'll fix those ones today.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
