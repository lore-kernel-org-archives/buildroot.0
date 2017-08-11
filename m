From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 11 Aug 2017 07:27:07 +0200
Subject: [Buildroot] ci20_defconfig fails because of missing TLS support
In-Reply-To: <d32e5a1d-aa99-f189-bdfc-5d10b10c1eda@mind.be>
References: <d32e5a1d-aa99-f189-bdfc-5d10b10c1eda@mind.be>
Message-ID: <20170811052707.GK28021@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

>  Vicente, Waldemar,
> 
>  Since some time (probably since some uClibc bump), the ci20_defconfig has been
> failing with an error I don't really understand [1]:
> 
> > /usr/bin/make -j3 -C /builds/buildroot.org/buildroot/output/build/uclibc-1.0.25 ARCH="mips" CROSS_COMPILE="/builds/buildroot.org/buildroot/output/host/bin/mipsel-buildroot-linux-uclibc-" UCLIBC_EXTRA_CFLAGS=" " HOSTCC="/usr/bin/gcc"
> > make[1]: Entering directory '/builds/buildroot.org/buildroot/output/build/uclibc-1.0.25'
> > mipsel-buildroot-linux-uclibc-gcc.br_real: warning: '-mfused-madd' is deprecated; use '-ffp-contract=' instead
> > mipsel-buildroot-linux-uclibc-gcc.br_real: warning: '-mfused-madd' is deprecated; use '-ffp-contract=' instead
> > mipsel-buildroot-linux-uclibc-gcc.br_real: warning: '-mfused-madd' is deprecated; use '-ffp-contract=' instead
> > mipsel-buildroot-linux-uclibc-gcc.br_real: warning: '-mfused-madd' is deprecated; use '-ffp-contract=' instead
> > ####
> > #### Your compiler does not support TLS and you are trying to build uClibc-ng
> > #### with NPTL support. Upgrade your binutils and gcc to versions which
> > #### support TLS for your architecture. Do not contact uClibc-ng maintainers
> > #### about this problem.
> > ####
> > #### Exiting...
> > ####
> > Rules.mak:689: recipe for target 'gcc_tls_test_fail' failed
> > make[1]: *** [gcc_tls_test_fail] Error 1
> > make[1]: Leaving directory '/builds/buildroot.org/buildroot/output/build/uclibc-1.0.25'
> 
> 
>  Could you guys have a look, so we can hopefully get a fix in 2017.08?

It has nothing to do with uClibc-ng updates, it has something to do
with gcc updates and the toolchain-wrapper. I propose a patch, which
allows to build the toolchain, but later u-boot fails to compile
with gcc-6, so I can't do runtime check on my ci20 device.

best regards
 Waldemar
