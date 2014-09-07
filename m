From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Sep 2014 10:09:18 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140907063013.1CB98101499@stock.ovh.net>
References: <20140907063013.1CB98101499@stock.ovh.net>
Message-ID: <20140907100918.6b017a09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Sep 2014 08:30:12 +0200 (CEST), Thomas Petazzoni wrote:

> Build statistics for 2014-09-06
> ===============================
> 
>         success : 144
>        failures : 37 
>        timeouts : 0  
>           TOTAL : 181

That's really great: we now build about 180-200 configurations each
day. Definitely a really good thing! With Peter moving to the
autobuild-run script, maybe he'll be able to run multiple instances of
the build logic on each machine, which would allow to build even more
configurations each day.


> Detail of failures
> ===================
> 
>       i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/ca098ae672956cf50d808fcff83bf4956bf4e31d/

vfork() issue, being fixed.

>        arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/5aeb3a9f067faf6687051643bf49a0b619cb4c3b/
>        arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/c8be1d63dbc4143955c665a090f0606f20d75127/
>        arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/ffbc880af29a0308bef4964bdc6b01b4604d7f56/
>        arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/c79533249d3eb08e6c46579b8da8a315305c058c/

Fixed.

>        arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/fe75ffe3734dae9190259b06ef2debed9fadc3d3/

Atomic intrinsic issue. To be fixed.

>    powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/2be62c58fbed40eed8fc8e8453336190cb1083d1/

Fixed.

>      nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/a87e5bd299a1dcfbd5fdc0232736c779b938c7fe/
>      nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/4853f7fa4ebfaa3f778c3f36fdcdd9a03e77dfca/

error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-Werror=cpp]

Maybe we should turn warning into warnings :)

>       bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/9e3b165543f69edcd2ea99e03a3da8c5d42c52ba/

Crazy C++ issue.

>    powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/a7f95353f5592a9399c542d8d56c3ca040f8a61a/

e_start_main.c:478:42: error: 'PT_GETSIGINFO' undeclared (first use in this function)
                               r = ptrace(PT_GETSIGINFO, child, NULL, &sig);

Gustavo, maybe?

> microblazeel |                       ftop-1.0 | NOK | http://autobuild.buildroot.net/results/e9d55202ebbd7595bde48e2a471fbf33c85a239b/
>     x86_64 |                       ftop-1.0 | NOK | http://autobuild.buildroot.net/results/c93f0e8f10e4e905276ce5a9eb96cdebb4294d8d/
>   mips64el |                       ftop-1.0 | NOK | http://autobuild.buildroot.net/results/517175ba8df3a3c354c2a21413b438cc73c9dc64/

Download issues, ignore.

>        arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/fcfde09a8c0121192dc550c72d55b1dd277ec6bc/
>       i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/ebee75bfb89f6b8cdd2bf555ad947e36057dbf0e/

intmax_t issue.

>       sh4a |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a6d967056de06bd07dc69f4fc1ec9b0f1e1d3927/

ncurses not available on Nathaniel's build machine. Discussion on-going
on whether we should make ncurses-dev a mandatory dependency of
Buildroot, or add the appropriate host-ncurses dependencies.

>        arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/ea4703de4285f557b52921f13f44f0d0ee6ddb2c/
>        arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/91ed7072347b980129b56c8ba291a87d078814c7/
>        arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/0240160f9ebfa35d3f5b5b0d64814a521bd9bec4/
>        arm |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/99dbab7726f362b2a5a9c840426abea80340567b/
>       i686 |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/4899f4e6d0ad58fe5bd5e46a311179f08c6a5b2a/
>     x86_64 |            host-nodejs-0.10.31 | NOK | http://autobuild.buildroot.net/results/802134ceb92d82d2d4ef6a81c67ad1c98696663a/

Fixed.

>        arm |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/a01c5f90e9dd8c5134a326db6ba9db3a7b5e6d91/

Fixed.

>        arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/24e94a6cea3d79ac3dab6c0baca615ddaeb9e04a/
>        arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/0f96c0f86f9fb733b531dcd5ed98e29a9bad3745/

Same ncurses issue on Nathaniel's autobuilder.

>    powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/8422492ff88761d81e54172a5ec6950e8ff847ce/
>    powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/5d3611f42f879947083635eeec705841da04b83f/

./.libs/libjq.a(builtin.o): In function `f_y1':
builtin.c:(.text+0x2b2c): undefined reference to `y1'
./.libs/libjq.a(builtin.o): In function `f_y0':
builtin.c:(.text+0x2be0): undefined reference to `y0'
./.libs/libjq.a(builtin.o): In function `f_j1':
builtin.c:(.text+0x31a4): undefined reference to `j1'
./.libs/libjq.a(builtin.o): In function `f_j0':
builtin.c:(.text+0x3258): undefined reference to `j0'
collect2: error: ld returned 1 exit status

>       bfin |              libmatroska-1.3.0 | NOK | http://autobuild.buildroot.net/results/12e752330b30adb5078acd72a548cc172fa9ecb8/

Fixed.

>     mipsel |                 libnspr-4.10.6 | NOK | http://autobuild.buildroot.net/results/7e06a73a31069faba96658ab7f0181018c4a0a8e/

/home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/../../../../mipsel-ctng-linux-uclibc/bin/ld: /home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/crtbeginT.o: relocation R_MIPS_HI16 against `a local symbol' can not be used when making a shared object; recompile with -fPIC
/home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/crtbeginT.o: could not read symbols: Bad value
collect2: error: ld returned 1 exit status
make[4]: *** [libnspr4.so] Error 1
make[4]: Leaving directory `/home/test/autobuild/instance-2/out

fPIC issue apparently. Vicente, maybe?

>     x86_64 |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/42153224cc0edd1a4976e8d1237f01feaed6ab2c/

host-perl problem.

>   mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/357ab3aef1a1989e42a9ea4cc3b605bcb827b606/

error: 'SYS_getdents64' undeclared (first use in this function)

Too old toolchain to build Python3 on MIPS64. I need to blacklist this toolchain.

>   mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2ab5ab179dab9e1a47092b066f97d48c75ab935b/

Lots of crazy errors. Vicente?

>        sh4 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/5bab4c127047275a640c1d55ed54316e960e5af0/

Another ncurses issue on Nathaniel's chroot.

>      nios2 |                 upmpdcli-0.8.0 | NOK | http://autobuild.buildroot.net/results/a193527b34c7b8c458904a7f1b5f88d236bd8261/

checking for UpnpInit in -lupnp... no
configure: error: libupnp not found
make: *** [/home/buildroot/instance-0/output/build/upmpdcli-0.8.0/.stamp_configured] Error 1
make: Leaving directory `/home/buildroot/instance-0/buildroot'

>        arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/31ac17cc64328bbb6531a45b071c1d0429520e2d/
>     x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/da11f76cacfd05999700c38d40628b526622ff6d/

Don't know what changed in webkit to cause this build failure:

  GEN      stamp-webkitmarshal.cpp
/bin/bash: ./DerivedSources/webkit/webkitmarshal.cpp: No such file or directory
  GEN      DerivedSources/webkit/webkitenumtypes.cpp
  GEN      stamp-webkitenumtypes.h
  GEN      stamp-webkitmarshal.h
  GEN      DerivedSources/WebCore/InternalSettingsGenerated.idl
/bin/bash: ./DerivedSources/webkit/webkitmarshal.h: No such file or directory

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
