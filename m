From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 May 2017 22:42:33 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-07
In-Reply-To: <20170508062835.044A8207F0@mail.free-electrons.com>
References: <20170508062835.044A8207F0@mail.free-electrons.com>
Message-ID: <20170508224233.7332472b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 May 2017 08:28:35 +0200 (CEST), Thomas Petazzoni wrote:

>          arc |                     cups-2.2.3 | NOK | http://autobuild.buildroot.net/results/fe7fda3a1975571523558d02c8396deda7b65f9c | ORPH

Compiling search.c...
/tmp/ccC9w3Ls.s: Assembler messages:
/tmp/ccC9w3Ls.s:114: Error: operand out of range (128 is not between -128 and 127)

Toolchain issue on ARC. Alexey, is this problem already known on your side ?

>         m68k |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/3338539743c8b0399c6b0fcbbb7c28b58bf3f387 |     

Proposed fixed: https://patchwork.ozlabs.org/patch/759742/

>         m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/dc5a042952c3f1f6a6fa06db0e7ac70f701c50dc |     

undefined reference to `__sync_fetch_and_add_4'

We should add the appropriate BR2_TOOLCHAIN_* dependency.

>        nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6785eb2c6fba73885df7f586409dc7193f70429f | ORPH
>          arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3474b2dcab2aa232f569c84b62320dc6a9411a23 | ORPH
>         i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/00058baa19bd8e44529bc28026bd2bd3e8968f35 | ORPH
>     mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2b2a266ae7ad2edd9875c136811e98aafc38b9a0 | ORPH
>       mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/51c5c7865767b7f1589bc642e6e6170ee98afda3 | ORPH
>         i586 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/809a9c5b895475a6f5ab787edb8faa25bfde940f | ORPH
>       x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1ed0f3b179fc0e506406fd13c0c24e36950a8169 | ORPH
>     mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c9213690ed53b61da87bb726298bdb9e527dd682 | ORPH
>         mips |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1d50ed79447633047eb9d073d6658fdac9798afd | ORPH
>       xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3dfac664efaf109eaa2e56a282501575d1fd5155 | ORPH
>       x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/135f7147f3e55ebb5ade85f01149569a59551ca2 | ORPH
>      sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fde45fe33c3832a81c1952d67eb04d19e25c9c24 | ORPH
>      powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5f2fa5a677c74a8b661057ead480e683f6fd8867 | ORPH
>        sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/787d8132a6ffa1ed27e67fff5f5a075a38b092e9 | ORPH
>          sh4 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/778b13b8b3d6868aba9d6b41dcf6afb62b5accdd | ORPH
>          arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1311e642c7af0411c5e9e8384477ae25588c1696 | ORPH
>       mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fefe457471b6819a59fe9275d34765739e92a90e | ORPH
>        nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0424a2c6203890d3835bbc66f2b5a6ac94b596c5 | ORPH
>        sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0be3a50a8a92152aca9c40cc77a566fbbed5fb5d | ORPH
>         or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f60cae991544eb2c3940e17db9d12a29c76133c6 | ORPH
>  powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/271311e6c2138beac6c66463ecf9ca60cd0d37d8 | ORPH
>      sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/572cd899ae3bf4ae20e67578a1de7ff584fcb297 | ORPH
>  powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6918b5950e600ed3cd72d8e48bf974b73b1bcc80 | ORPH

All fixed, by adding a gcc >= 4.5 dependency. Thanks to Romain for
having worked on this.

>       x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/a4a65d01f049db83a93de92660f228dd18532625 |     

I'm proposing https://patchwork.ozlabs.org/patch/759789/ to fix this.

>          arc |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/2eccf9f517ab15d8d459b06195423fdfe3fba9fa |     

/home/test/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/6.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/test/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/6.3.0/crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
/home/test/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/6.3.0/crtbeginT.o: error adding symbols: Bad value
collect2: error: ld returned 1 exit status

I think this one would be fixed by Romain's patch
https://patchwork.ozlabs.org/patch/759755/.

>         m68k |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/e02fdd1d4abb06c6ebb9fb5f2cbf948a9e62016d |     

/tmp/cc6ITqke.o: In function `worker':
/home/peko/autobuild/instance-1/output/build/ltp-testsuite-20170116/lib/newlib_tests/test08.c:52: undefined reference to `pthread_barrier_wait'

Already fixed by https://git.buildroot.org/buildroot/commit/?id=362d185b309a1634901d4cb35bc1778d58e2015a.

>        sparc |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/fa5072b35b9de0aa3dc7f4ef4dc654121f7ed992 |     

../include/tst_atomic.h:135:3: error: #error Your compiler does not provide __sync_add_and_fetch and LTP implementation is missing for your architecture.

Romain proposed to exclude Sparc, but I believe a better patch that
uses BR2_TOOLCHAIN_HAS_SYNC_xyz should be used instead.

>         m68k |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/5a5a214f72f5babc7abb9629046b5037758bed7f |     
>         m68k |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/3e0bbf41e339e62422463773bf07945f048a9501 |     

Both also fixed by https://git.buildroot.org/buildroot/commit/?id=362d185b309a1634901d4cb35bc1778d58e2015a.

>         mips | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/d1ee618f8eb8846af0b9f4654ea0b81c81ed8ed3 |     

Ignore.

>  powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/aca8eb763c5a3990a98583127fdbc4658c278891 |     
>          arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/ec67ffdef74b9a61d0491e71f8cb2f8f0b6daa50 |     

Both (and other build issues on mpir) would be fixed by my patch series:

  https://patchwork.ozlabs.org/patch/759766/
  https://patchwork.ozlabs.org/patch/759765/
  https://patchwork.ozlabs.org/patch/759768/
  https://patchwork.ozlabs.org/patch/759767/

>          arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/b470cfba451ce9ba648e3a2f3ae08429db8bdee9 |     
>          arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/0cc6bde872c34311e10f9c725a64553f485efa1a |     

Fixed by https://git.buildroot.org/buildroot/commit/?id=4b72b54fd3b0074864e5ad36ec2fdcd30f4d58eb

>      aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/ee8676f4790c38493203726a5a3357b9bc594630 | ORPH

/home/dawncrow/buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/5.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ../ntpq/libntpq.a(libntpq_a-libntpq.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against external symbol `stderr@@GLIBC_2.17' can not be used when making a shared object; recompile with -fPIC
/home/dawncrow/buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/5.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ../ntpq/libntpq.a(libntpq_a-libntpq.o)(.text+0x304): unresolvable R_AARCH64_ADR_PREL_PG_HI21 relocation against symbol `stderr@@GLIBC_2.17'

Not sure what's going on here. Missing -fPIC apparently. It fails
similarly on lots of platforms:
http://autobuild.buildroot.net/?reason=ntp-4.2.8p10.

>       x86_64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/43b4acebe74e5546354b392c7618bfc7a2933867 |     

This would be fixed by https://patchwork.ozlabs.org/patch/758798/.

>       x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/ae006828c2562a5a35fa01871797996412ba3d12 |     

/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/math/special_functions/detail/erf_inv.hpp:46:10: note: use -std=gnu++11 or -fext-numeric-literals to enable more built-in suffixes
/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/math/special_functions/detail/erf_inv.hpp:47:10: error: unable to find numeric literal operator 'operator""Q'
          BOOST_MATH_BIG_CONSTANT(T, 64, -0.00836874819741736770379),

Gaah, some Boost stuff... Anyone ?

Bartosz, since you added pulseview, perhaps you could have a look ?

>     mips64el |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/e0e687bed0f962c0c7893971c342984d9aa99d80 |     

I believe this one has been fixed by
https://git.buildroot.org/buildroot/commit/?id=4860e05a63bf01156466a1a8007de38e2839501a.

>        sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/9f213406954be51dfcad76ebdce8b73850842180 |     

ERROR: detected a std::atomic implementation that fails for function pointers.
Please apply the patch corresponding to your Standard Library vendor, found in
  qtbase/config.tests/common/atomicfptr

Peter (Seiderer), could you have a look ?

>       x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/d846065c6909c06e1fe0444e224f89795b93b242 |     

/home/test/autobuild/run/instance-3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-ctng_locales-linux-gnu/4.8.2/../../../../x86_64-ctng_locales-linux-gnu/bin/ld: final link failed: Memory exhausted

Spurious issue on my autobuilder, it seems.

>      powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/13824f5c36475c3d371f8b6b8f35b82e1e6bd047 |     

Static linking issue, with zlib and intl.

>       xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/f10b5d0eb83b3fb1fe84ce63f6fba7f48488b769 | ORPH
>       xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/07d2160501dbfa5ecf91d38b32a6b8f7c4d7802a | ORPH
>          arc |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/b009b9767f1e8f41bd990575c29fe0f84146a54a | ORPH

Redefinition issues between <net/if_arp.h> and <linux/if_arp.h>. Anyone
to take a look ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
