From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 9 Aug 2016 10:27:53 -0300
Subject: [Buildroot] Analysis of build results for 2016-08-08
In-Reply-To: <20160809141535.4c9b8169@free-electrons.com>
References: <20160809063032.89898101A55@stock.ovh.net>
 <20160809141535.4c9b8169@free-electrons.com>
Message-ID: <CAAEAJfC2T8KDcoAO5nph6ahwtt9Wy55WkN50W0KEDaTJ73dUjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9 August 2016 at 09:15, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue,  9 Aug 2016 08:30:32 +0200 (CEST), Thomas Petazzoni wrote:
>
>>         bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/0818dfa5d339424bdf7192634bed7e133c065f70/
>
> Still the Blackfin/C++ issue. We're going to disable C++ support in the
> Blackfin toolchain.
>
>>          arc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/b8dc85b990472ec0e205cedc1aa0eee424b63e4f/
>
> This is being analyzed by the people at Synopsys.
>
>>         bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/b0af78629db06c3693c8bbf8ec3aedfea606b1f9/
>
> undefined reference to `__emutls_get_address'
>
> Waldemar, this one is not a C++ issue I believe, can you check this?
>
>>     mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3b56943afccc03e5920e941325f3e60824bb95a2/
>
> error: conflicting types for 'u64'
> error: conflicting types for 'get_file_size'
>
> Weird. Someone to have a look?
>
>>          arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/a36fa8415507551dd4cf8503754655d2504fd330/
>
> musl build issue.
>
>>          arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/19af091fc6b8c496b1ee5bcbe6c075eb369c230c/
>
> Conflicting CPU architectures 13/1
>
>>         m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/722a4fc268657620b805fdbeb0c62131df117d3d/
>
> Fixed by
> https://git.buildroot.org/buildroot/commit/?id=fd4f715268df5fbfc14e6ea8a54fd5de70b6a947.
>
>>         m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/ba10714bd28e1dc21d4df2be030e2cef37846d6b/
>
> /tmp/ccySQY3I.s: Assembler messages:
> /tmp/ccySQY3I.s:14834: Error: value -34500 out of range
> /tmp/ccySQY3I.s:15075: Error: value -35250 out of range
> /tmp/ccySQY3I.s:15528: Error: value -45542 out of range
> /tmp/ccySQY3I.s:15529: Error: value -45566 out of range
> /tmp/ccySQY3I.s:15539: Error: value -45886 out of range
>
> Waldemar ?
>
>>         i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/71177f73c16f3fcb0500f6cc04690a85e32bf73c/
>>       x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/1dc914af4db2c894d521af2bc9f7d77e88f0c38d/
>>         i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/72537d66f78a0bf354436766cdc39c644c6e74b6/
>
> musl issues.
>
>>        nios2 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/4bc5501b792a3e14754796d279f61b75cebe83a0/
>>          arc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/ed51aa9c5559607f7df58dbc16bffd696779c0ed/
>
> Those two ones are:
>
> nios2-linux-gcc.br_real: error: 2: No such file or directory
> nios2-linux-gcc.br_real: error: 2: No such file or directory
> nios2-linux-gcc.br_real: error: 2: No such file or directory
>
> arc-linux-gcc.br_real: error: 2: No such file or directory
> arc-linux-gcc.br_real: error: 2: No such file or directory
> arc-linux-gcc.br_real: error: 2: No such file or directory
>
> They are happening on two different machines. Not sure what's going on
> here :-/
>
>>      powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/313370bf05efe7fd87c281a97ecb6e06531a87ed/
>
> This last one would be fixed by applying
> https://patchwork.ozlabs.org/patch/656671/.
>
>>          arm |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ef579863ac7a4fb94827bfb7aeefdc5625b16676/
>
> Another: "Conflicting CPU architectures 13/1".
>
>>         m68k |                 flickcurl-1.26 | NOK | http://autobuild.buildroot.net/results/c18eeb955a69b5a621eef5574df397f8de60d187/
>
> Another "relocation truncated to fit: R_68K_GOT16O" for Waldemar :)
>
>>          arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/42f74ea254d5b3c1a2bca89913e805323bdf020b/
>
> Still the libintl/pthread issue.
>
>>      powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/2a935b7bcede2a12afdb836b7bc91a513825f39c/
>>      powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/fe0c97ee07354f831199f8d58e06e7bddccaba29/
>
> The infamous libaio problem...
>
>>          arm |                gst1-imx-0.12.2 | NOK | http://autobuild.buildroot.net/results/b460a770c8f4e992d29dde8fe37fc23a949937f2/
>
> error: 'V4L2_PIX_FMT_XRGB555X' undeclared (first use in this function)
>
> and other errors. We use kernel headers 4.7 since recently. Maybe
> there's something to fix here?
>
> Gary, can you have a look?
>
>>          arm |                host-efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/89bf12f8333d47af0cb5775c859e26f300af56cc/
>
> edje_cc: Critical. Unable to open temp file "(null)" for pre-processor.
>
> Romain? This looks like a transient error, but I'm not sure.
>
>>          arc | host-gcc-final-arc-2016.09-... | NOK | http://autobuild.buildroot.net/results/55592cb7c04687f3b73fae865bc5d745f1688f31/
>
> Investigated by the Synopsys people.
>
>> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c3f724afbf79434864be7901dadaf6d848edefea/
>
> make[4]: *** No rule to make target `../sim/microblaze/libsim.a', needed by `gdb'.  Stop.
> make[4]: *** Waiting for unfinished jobs....
>
> Yet another case of GDB Simulator build failure :-/ Waldemar ?
>
>>       xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3f5f885d5ccf84d634d9d483ff35a7757996cec4/
>
> ../dbus/sigsegv.c:110:20: error: 'NGREG' undeclared (first use in this function)
>      for(i = 0; i < NGREG; i++)
>
>>          arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b8570a3e597384fd48e50b000ee760ad12945fa9/
>
>  error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
>
> gcc 6.x issue?
>
>>         i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/461415e9b8de7ae4d8fcc2d11c6384be665b1f4e/
>
> musl header problem.
>
>>          arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/1f005c46b927fbeeffb11d843c2c3f18308bb5b9/
>
> Lots and lots of errors. Maxime, Yann, any idea?
>
>>          arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/fa48dfa0034dd75588132f342bfd44a87d440c93/
>>     mips64el |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/77a9365c1f6cc205ed11d614b331a6a809aef55d/
>
> Would be fixed by https://patchwork.ozlabs.org/patch/656893/.
>
>>         bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/01b7088a06e7310c8773e78e8be4f6e88da67357/
>
> Static linking against pthread.
>
>>      aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/afbb24414340307617e88f26d1e82be672baf317/
>
> error: conflicting types for 'khronos_uint64_t'
>
> Gustavo, could you have a look?
>
>>          arm |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/4f57a7a37da0ce6d14a368272d982b4874a54927/
>
> xsid.cpp:101:1: error: narrowing conversion of ''\200'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>  };
>  ^
> xsid.cpp:101:1: error: narrowing conversion of ''\224'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\251'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\274'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\316'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\341'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\362'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>
> gcc 6.x issue ?
>
> Bernd, you added this package, could you have a look?
>
>>          arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b1e40b3ec64cd98b535d83e89e5780c46680e095/
>
> Would be fixed by https://patchwork.ozlabs.org/patch/656693/.
>
>>          arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/832a9feb9561eae1239689a36c57bd0065f98e0d/
>
> base64.cpp:26:1: error: narrowing conversion of '-1' from 'int' to 'char' inside { } [-Wnarrowing]
>
> Another one.
>
>>         i586 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/5d56f998b5c5ab9e06cf048e6ec95b8671989cef/
>>          arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/15033e9cdb1ecb23c0228c306236aca64c01303c/
>
> Would both be fixed by https://patchwork.ozlabs.org/patch/656730/.
>
>>         i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/c8db62509f77906b3bad5b2d58c2c02f95edf104/
>>         sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/8545b910fe16e9fec038d2609a2071346b6cdb79/
>
> lircd.o: In function `schedule_repeat_timer(timespec*)':
> lircd.cpp:(.text+0x470): undefined reference to `clock_gettime'
> lircd.o: In function `dosigalrm(int)':
> lircd.cpp:(.text+0x24dd): undefined reference to `clock_gettime'
> lircd.o: In function `send_core(int, char*, char*, int)':
> lircd.cpp:(.text+0x295f): undefined reference to `clock_gettime'
>
> Need to link against librt.
>
>>       x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/576eccb104ff23e60bfa9d15ce5bf8cab064a64f/
>
> Would be fixed by https://patchwork.ozlabs.org/patch/655854/.
>
>>       x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/c32851d3497b296904793c7d9af20cc8eb655a27/
>
> error: assignment of read-only variable 'stdin'
>
> musl-related.
>
>>          arc | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/1f049e02d1f2f9e1b6ce85ed8bcf6c59976e8c17/
>
> Ignore.
>
>>       mipsel |                    mpd-0.19.17 | NOK | http://autobuild.buildroot.net/results/3605750023267e4cd35d98451bd283f9e70a6106/
>
> Static linking against OpenSSL ?
>
>>        sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/f607eed9a48c4ca00db43f9d2652e615b4bd7c93/
>>        sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/8e9c05b03e59b9b4d0b7b587e6ddc864acca28b1/
>>        sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/422c5eb3fac8c68e45c7087af8e0b06d25898f2e/
>
> Would all three be fixed by https://patchwork.ozlabs.org/patch/657017/.
>
>>         bfin |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/edfd56d95e1338ff0ec20ad92d740f4fd77aaecc/
>
> integck.c: In function 'parse_mount_options':
> integck.c:2889: error: 'MS_DIRSYNC' undeclared (first use in this function)
> integck.c:2889: error: (Each undeclared identifier is reported only once
> integck.c:2889: error: for each function it appears in.)
> integck.c:2899: error: 'MS_RELATIME' undeclared (first use in this function)
>
> This is with the old Blackfin toolchain.
>
>>       x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/ad1ee46fa0250e005eb9b1b30427e1db81f04264/
>>       x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/7912ec10153e158e1671dbcd8b530aff9c31cbde/
>
> Fixed by
> https://git.buildroot.org/buildroot/commit/?id=225e1681cc000d904e5e98a3fcff974aac4e8d71.
>
>>       x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/a4387751d8b17ef0ef86ae04bdd4f4e13c13978d/
>
> fusermount.c: In function 'count_fuse_fs':
> fusermount.c:172:24: error: '_PATH_MOUNTED' undeclared (first use in this function)
>      const char *mtab = _PATH_MOUNTED;
>
> musl issue, it seems.
>
>>         bfin |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/3df650e7a513f46cc948f350863414f43b5e3a89/
>
> multiple definition of `___GI_raise'
>
> Issue with the old Blackfin toolchain. It reminds me of something, but
> I can't remember if we had a solution or not.
>
>>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/bb51df385961d9f489e7a4f582cee8662e715897/
>>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/88362649ac5cd71918092a511a10f460535abb3e/
>>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/3047169caf157796854b9095d8ec1b9abd104260/
>
> Would be fixed by https://patchwork.ozlabs.org/patch/656508/.
>
>> microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/fc4084f8d1ff3fe98066c7cc051c2127bbe77ec5/
>
> ./.libs/libOpenIPMIpthread.so: undefined reference to `pthread_condattr_setclock'
>
> Needs NPTL dependency.
>
>>       x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/6b73c1d1bfd4b2f9db8c4b92747bcc2cd6f30a9e/
>
> fatal error: sys/cdefs.h: No such file or directory
>
> musl issue.
>
>>         bfin |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/b3529e5661c55c53074d85cb6bde28cb51b913ca/
>
> Fixed by disabling PHP support (I believe).
>
>>          arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/885f418cc26c6832a8a9abf703aecbeea8fbe550/
>
> Would be fixed by https://patchwork.ozlabs.org/patch/657181/.
>
>>     mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/f73a28583d56a29a419f4f861135dd7548e88e3b/
>
> Some crazy C++ error. Anyone to look into this?
>
>>       x86_64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/3dd54c594ee0521a10a057094e342500b4657cea/
>
> Same crazy C++ error.
>
>>      sparc64 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/bc4ceb53fff7b3f78e544c8fbeb7b549b7881dba/
>
> Project ERROR: libudev development package not found
> KMS disabled.
>  KMS support cannot be enabled due to functionality tests!
>  Turn on verbose messaging (-v) to ./configure to see the final report.
>  If you believe this message is in error you may use the continue
>  switch (-continue) to ./configure to continue.
>
> Hum, not sure here.
>
>>         i586 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/2285b15f0c89ecf7c37876987a24d30a96cc2c67/
>>          arm |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/176adc06dff2393ec32630bb2bb354fbff06eab1/
>
> Musl issue.
>
>>         bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/a1888998291b08bd32f8c968572620748921017a/
>>         bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/3c755158e94865312b42384f2a152f30b4a28c7d/
>
> Blackfin C++ problem.
>
>> microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/2a27e11ac01d4a9de01fb684b1f28c07c7fe6830/
>
> squeezelite.h:248:121: error: 'PTHREAD_PRIO_INHERIT' undeclared (first use in this function)
>
>>         m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/095642dd43a708bb3283ab6150c016344df3f84d/
>
> Ditto. Priority inheritance mutexes are only available for NPTL, it seems.
>
>>          arc |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/5deb954dbaa436c335ebe873e53ac03685e83e1e/
>
> For some reason, it's using the host compiler :-/
>
>>      sparc64 |             supertuxkart-0.9.2 | NOK | http://autobuild.buildroot.net/results/7ae73f52589693a082a85967d77fc03a86f172bd/
>
> as_callfunc_x64_gcc.cpp:162:82: error: unknown register name '%r15' in 'asm'
>
> Seems like it's using some x86_64 code on Sparc64. Ezequiel, could you
> have a look?
>

Same report in Debian:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=830748

Seems angelscript build is not clever enough, and I'm guessing
this issue will happen on other non-x86 arches. Maybe cross-building
is completely broken?
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
