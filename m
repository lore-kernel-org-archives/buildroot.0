From: Alvaro G. M. <alvaro.gamez@hazent.com>
Date: Sun, 4 Mar 2018 16:01:23 +0100
Subject: [Buildroot] host-lz4 bug on LTS 2017.02.10
In-Reply-To: <87muzqd40z.fsf@dell.be.48ers.dk>
References: <20180302113812.GA29093@salem.gmr.ssr.upm.es>
 <87r2p2d486.fsf@dell.be.48ers.dk> <87muzqd40z.fsf@dell.be.48ers.dk>
Message-ID: <20180304150122.GA1505@salem.gmr.ssr.upm.es>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi,

On Fri, Mar 02, 2018 at 02:02:20PM +0100, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> >>>>> "Alvaro" == Alvaro G M <alvaro.gamez@hazent.com> writes:
>  >> Hi,
>  >> I've tracked this issue compiling host-lz4. Offending commit is this one
>  >> (found via git bisect)
> 
>  >> 17cf7e511e6919d5b6744deb21770c2d0ea922a9
>  >> lz4: install programs as well as libraries
> 
>  >> I attach at the end the defconfig file that produced this log, using
>  >> Microblaze, but I've found that the same error happens on x86_64.
> 
>  > Please use 2017.02.11 instead. A backport of lz4-1.7.5 was missing on
>  > the 2017.02.x branch.
> 
> Ehh, sorry  - I haven't actually released 2017.02.11 yet ;)

Good, that explains why I didn't find it! :)
 
> The missing change from 2017.02.10 is here:
> 
> https://git.buildroot.net/buildroot/commit/?h=2017.02.x&id=c849300796b72b58a78514ada88d496f8cab8c70
> 
> It would be good if you could try applying this to your tree and then
> remove the 32bit support package and validate it works.
> 

I'm sorry to say that after cherry-picking that patch on top of 2017.02.10,
host-lz4 ceases to compile at all, either with libc6-dev:i386 or without it. 
The new error has got nothing to do with this, as far as I can tell.



make: Entering directory '/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP'
make -C /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/../buildroot O=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output BR2_EXTERNAL=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP PROJECT_NAME=TRP BR2_DEFCONFIG=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/defconfig defconfig
  GEN     /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/Makefile
#
# configuration written to /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/.config
#
make -C /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/../buildroot O=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output BR2_EXTERNAL=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP PROJECT_NAME=TRP BR2_DEFCONFIG=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/defconfig
/usr/bin/make -j1 O=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" silentoldconfig
  GEN     /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/Makefile
BR2_DEFCONFIG='/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/defconfig' KCONFIG_AUTOCONFIG=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/buildroot-config/auto.conf KCONFIG_AUTOHEADER=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/buildroot-config/autoconf.h KCONFIG_TRISTATE=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/buildroot-config/tristate.config BR2_CONFIG=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/.config HOST_GCC_VERSION="7" BUILD_DIR=/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build SKIP_LEGACY= /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/buildroot-config/conf --silentoldconfig Config.in
[7m>>> host-lz4 v1.7.5 Building[27m
PATH="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/bin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/sbin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/bin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/sbin:/home/sslayer/bin:/home/sslayer/android-sdk-update-manager/platform-tools/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/EMPIRE-XCcel:/usr/local/ADS2013_06/bin:/home/sslayer/bin:/usr/NX/bin" PKG_CONFIG="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib/pkgconfig:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/share/pkgconfig" PATH="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/bin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/sbin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/bin:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/sbin:/home/sslayer/bin:/home/sslayer/android-sdk-update-manager/platform-tools/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/EMPIRE-XCcel:/usr/local/ADS2013_06/bin:/home/sslayer/bin:/usr/NX/bin" PKG_CONFIG="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib/pkgconfig:/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/share/pkgconfig" AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm" CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib" CPPFLAGS="-I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include" CFLAGS="-O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include" CXXFLAGS="-O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include" LDFLAGS="-L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/lib -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib" INTLTOOL_PERL=/usr/bin/perl /usr/bin/make -j17 -C /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/host-lz4-v1.7.5 all
make[3]: Nothing to be done for 'all'.
/usr/bin/gcc -O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include  -g -Wall -Wextra -Wundef -Wcast-qual -Wcast-align -Wshadow -Wswitch-enum -Wdeclaration-after-statement -Wstrict-prototypes -Wpointer-arith -Wstrict-aliasing=1 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -I../lib -DXXH_NAMESPACE=LZ4_  -c -o lz4cli.o lz4cli.c
/usr/bin/gcc -O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include  -g -Wall -Wextra -Wundef -Wcast-qual -Wcast-align -Wshadow -Wswitch-enum -Wdeclaration-after-statement -Wstrict-prototypes -Wpointer-arith -Wstrict-aliasing=1 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -I../lib -DXXH_NAMESPACE=LZ4_  -c -o bench.o bench.c
/usr/bin/gcc -O2 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include  -g -Wall -Wextra -Wundef -Wcast-qual -Wcast-align -Wshadow -Wswitch-enum -Wdeclaration-after-statement -Wstrict-prototypes -Wpointer-arith -Wstrict-aliasing=1 -I/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/include -I../lib -DXXH_NAMESPACE=LZ4_ -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/lib -L/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/host/usr/lib -DENABLE_LZ4C_LEGACY_OPTIONS ../lib/lz4.c ../lib/lz4frame.c ../lib/lz4hc.c ../lib/xxhash.c lz4io.c datagen.c lz4cli.c bench.c -o lz4c
lz4cli.c: In function ?usage_advanced?:
lz4cli.c:61:101: warning: implicit declaration of function ?LZ4_versionString?; did you mean ?LZ4_versionNumber?? [-Wimplicit-function-declaration]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                                                                                                     ^
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:131:13: note: in expansion of macro ?WELCOME_MESSAGE?
     DISPLAY(WELCOME_MESSAGE);
             ^~~~~~~~~~~~~~~
lz4cli.c:61:25: warning: format ?%s? expects argument of type ?char *?, but argument 5 has type ?int? [-Wformat=]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                         ^                                                                           ~~~~~~~~~~~~~~~~~~~
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:131:13: note: in expansion of macro ?WELCOME_MESSAGE?
     DISPLAY(WELCOME_MESSAGE);
             ^~~~~~~~~~~~~~~
bench.c: In function ?BMK_benchMem?:
bench.c:182:18: error: ?LZ4HC_CLEVEL_MIN? undeclared (first use in this function)
     if (cLevel < LZ4HC_CLEVEL_MIN) cfunctionId = 0; else cfunctionId = 1;
                  ^~~~~~~~~~~~~~~~
bench.c:182:18: note: each undeclared identifier is reported only once for each function it appears in
lz4cli.c: In function ?usage_longhelp?:
lz4cli.c:191:96: error: ?LZ4HC_CLEVEL_MAX? undeclared (first use in this function); did you mean ?_SC_LINE_MAX??
     DISPLAY( "-3 ... -%d => High compression; higher number == more compression but slower\n", LZ4HC_CLEVEL_MAX);
                                                                                                ^
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:191:96: note: each undeclared identifier is reported only once for each function it appears in
     DISPLAY( "-3 ... -%d => High compression; higher number == more compression but slower\n", LZ4HC_CLEVEL_MAX);
                                                                                                ^
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c: In function ?main?:
lz4cli.c:61:25: warning: format ?%s? expects argument of type ?char *?, but argument 5 has type ?int? [-Wformat=]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                         ^                                                                           ~~~~~~~~~~~~~~~~~~~
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:345:64: note: in expansion of macro ?WELCOME_MESSAGE?
                 if (!strcmp(argument,  "--version")) { DISPLAY(WELCOME_MESSAGE); return 0; }
                                                                ^~~~~~~~~~~~~~~
lz4cli.c:61:25: warning: format ?%s? expects argument of type ?char *?, but argument 5 has type ?int? [-Wformat=]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                         ^                                                                           ~~~~~~~~~~~~~~~~~~~
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:372:35: note: in expansion of macro ?WELCOME_MESSAGE?
                 case 'V': DISPLAY(WELCOME_MESSAGE); goto _cleanup;   /* Version */
                                   ^~~~~~~~~~~~~~~
lz4cli.c:61:25: warning: format ?%s? expects argument of type ?char *?, but argument 5 has type ?int? [-Wformat=]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                         ^                                                                           ~~~~~~~~~~~~~~~~~~~
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:500:5: note: in expansion of macro ?DISPLAYLEVEL?
     DISPLAYLEVEL(3, WELCOME_MESSAGE);
     ^~~~~~~~~~~~
lz4cli.c:500:21: note: in expansion of macro ?WELCOME_MESSAGE?
     DISPLAYLEVEL(3, WELCOME_MESSAGE);
                     ^~~~~~~~~~~~~~~
bench.c: In function ?BMK_benchCLevel?:
bench.c:399:76: error: ?LZ4_VERSION_STRING? undeclared (first use in this function); did you mean ?LZ4_VERSION_MINOR??
         DISPLAY("bench %s %s: input %u bytes, %u seconds, %u KB blocks\n", LZ4_VERSION_STRING, LZ4_GIT_COMMIT_STRING, (U32)benchedSize, g_nbSeconds, (U32)(g_blockSize>>10));
                                                                            ^
bench.c:85:46: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)         fprintf(stderr, __VA_ARGS__)
                                              ^~~~~~~~~~~
lz4cli.c:453:36: warning: this statement may fall through [-Wimplicit-fallthrough=]
                 case 'r': recursive=1;  /* without break */
                           ~~~~~~~~~^~
lz4cli.c:456:17: note: here
                 case 'm': multiple_inputs=1;
                 ^~~~
make[3]: *** [<builtin>: lz4cli.o] Error 1
make[3]: *** Waiting for unfinished jobs....
bench.c: In function ?BMK_benchFiles?:
bench.c:506:18: error: ?LZ4HC_CLEVEL_MAX? undeclared (first use in this function); did you mean ?_SC_LINE_MAX??
     if (cLevel > LZ4HC_CLEVEL_MAX) cLevel = LZ4HC_CLEVEL_MAX;
                  ^~~~~~~~~~~~~~~~
                  _SC_LINE_MAX
make[3]: *** [<builtin>: bench.o] Error 1
../lib/lz4frame.c: In function ?LZ4F_decompress?:
../lib/lz4frame.c:1082:29: warning: this statement may fall through [-Wimplicit-fallthrough=]
             dctxPtr->dStage = dstage_storeHeader;
             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
../lib/lz4frame.c:1085:9: note: here
         case dstage_storeHeader:
         ^~~~
../lib/lz4frame.c:1194:33: warning: this statement may fall through [-Wimplicit-fallthrough=]
                 dctxPtr->dStage = dstage_decodeCBlock;
                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
../lib/lz4frame.c:1198:9: note: here
         case dstage_decodeCBlock:
         ^~~~
lz4cli.c: In function ?usage_advanced?:
lz4cli.c:61:101: warning: implicit declaration of function ?LZ4_versionString?; did you mean ?LZ4_versionNumber?? [-Wimplicit-function-declaration]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                                                                                                     ^
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:131:13: note: in expansion of macro ?WELCOME_MESSAGE?
     DISPLAY(WELCOME_MESSAGE);
             ^~~~~~~~~~~~~~~
lz4cli.c:61:25: warning: format ?%s? expects argument of type ?char *?, but argument 5 has type ?int? [-Wformat=]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                         ^                                                                           ~~~~~~~~~~~~~~~~~~~
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:131:13: note: in expansion of macro ?WELCOME_MESSAGE?
     DISPLAY(WELCOME_MESSAGE);
             ^~~~~~~~~~~~~~~
lz4cli.c: In function ?usage_longhelp?:
lz4cli.c:191:96: error: ?LZ4HC_CLEVEL_MAX? undeclared (first use in this function); did you mean ?_SC_LINE_MAX??
     DISPLAY( "-3 ... -%d => High compression; higher number == more compression but slower\n", LZ4HC_CLEVEL_MAX);
                                                                                                ^
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:191:96: note: each undeclared identifier is reported only once for each function it appears in
     DISPLAY( "-3 ... -%d => High compression; higher number == more compression but slower\n", LZ4HC_CLEVEL_MAX);
                                                                                                ^
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c: In function ?main?:
lz4cli.c:61:25: warning: format ?%s? expects argument of type ?char *?, but argument 5 has type ?int? [-Wformat=]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                         ^                                                                           ~~~~~~~~~~~~~~~~~~~
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:345:64: note: in expansion of macro ?WELCOME_MESSAGE?
                 if (!strcmp(argument,  "--version")) { DISPLAY(WELCOME_MESSAGE); return 0; }
                                                                ^~~~~~~~~~~~~~~
lz4cli.c:61:25: warning: format ?%s? expects argument of type ?char *?, but argument 5 has type ?int? [-Wformat=]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                         ^                                                                           ~~~~~~~~~~~~~~~~~~~
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:372:35: note: in expansion of macro ?WELCOME_MESSAGE?
                 case 'V': DISPLAY(WELCOME_MESSAGE); goto _cleanup;   /* Version */
                                   ^~~~~~~~~~~~~~~
lz4cli.c:61:25: warning: format ?%s? expects argument of type ?char *?, but argument 5 has type ?int? [-Wformat=]
 #define WELCOME_MESSAGE "*** %s %i-bits v%s, by %s ***\n", COMPRESSOR_NAME, (int)(sizeof(void*)*8), LZ4_versionString(), AUTHOR
                         ^                                                                           ~~~~~~~~~~~~~~~~~~~
lz4cli.c:76:48: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)           fprintf(stderr, __VA_ARGS__)
                                                ^~~~~~~~~~~
lz4cli.c:500:5: note: in expansion of macro ?DISPLAYLEVEL?
     DISPLAYLEVEL(3, WELCOME_MESSAGE);
     ^~~~~~~~~~~~
lz4cli.c:500:21: note: in expansion of macro ?WELCOME_MESSAGE?
     DISPLAYLEVEL(3, WELCOME_MESSAGE);
                     ^~~~~~~~~~~~~~~
lz4cli.c:453:36: warning: this statement may fall through [-Wimplicit-fallthrough=]
                 case 'r': recursive=1;  /* without break */
                           ~~~~~~~~~^~
lz4cli.c:456:17: note: here
                 case 'm': multiple_inputs=1;
                 ^~~~
bench.c: In function ?BMK_benchMem?:
bench.c:182:18: error: ?LZ4HC_CLEVEL_MIN? undeclared (first use in this function)
     if (cLevel < LZ4HC_CLEVEL_MIN) cfunctionId = 0; else cfunctionId = 1;
                  ^~~~~~~~~~~~~~~~
bench.c:182:18: note: each undeclared identifier is reported only once for each function it appears in
bench.c: In function ?BMK_benchCLevel?:
bench.c:399:76: error: ?LZ4_VERSION_STRING? undeclared (first use in this function); did you mean ?LZ4_VERSION_MINOR??
         DISPLAY("bench %s %s: input %u bytes, %u seconds, %u KB blocks\n", LZ4_VERSION_STRING, LZ4_GIT_COMMIT_STRING, (U32)benchedSize, g_nbSeconds, (U32)(g_blockSize>>10));
                                                                            ^
bench.c:85:46: note: in definition of macro ?DISPLAY?
 #define DISPLAY(...)         fprintf(stderr, __VA_ARGS__)
                                              ^~~~~~~~~~~
bench.c: In function ?BMK_benchFiles?:
bench.c:506:18: error: ?LZ4HC_CLEVEL_MAX? undeclared (first use in this function); did you mean ?_SC_LINE_MAX??
     if (cLevel > LZ4HC_CLEVEL_MAX) cLevel = LZ4HC_CLEVEL_MAX;
                  ^~~~~~~~~~~~~~~~
                  _SC_LINE_MAX
make[3]: *** [Makefile:86: lz4c] Error 1
make[2]: *** [Makefile:62: all] Error 2
make[1]: *** [package/pkg-generic.mk:219: /home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP/output/build/host-lz4-v1.7.5/.stamp_built] Error 2
make: *** [../common.mk:42: default] Error 2
make: Leaving directory '/home/sslayer/Proyectos/ART/tmp/buildroot-external-skeleton/TRP'


-- 
Alvaro G. M.
