From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:07:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-06-29
In-Reply-To: <20150630063014.44429100A75@stock.ovh.net>
References: <20150630063014.44429100A75@stock.ovh.net>
Message-ID: <20150630140738.526d72b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Even if we're not in the "debug" month, let's try to keep the number of
failures to a reasonable level.

Gustavo, Luca, Romain, Yann, Alexey, Bartosz, Vicente, Fran?ois, J?rg,
please look below for some issues in your area of interest/expertise.
Thanks!

On Tue, 30 Jun 2015 08:30:14 +0200 (CEST), Thomas Petazzoni wrote:

>          arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/381dd179b05e71ae868b07dd4a73eb53a6ff4129/

In file included from wesside-ng.c:63:0:
include/ethernet.h:392:23: fatal error: sys/cdefs.h: No such file or directory
#include <sys/cdefs.h>

musl build problem.

>          arc |           binutils-arc-2014.12 | NOK | http://autobuild.buildroot.net/results/1fc2d68ade3dae813b13ca88448b30f2cb43c61e/

Fixed by http://git.buildroot.net/buildroot/commit/?id=89d4a209f5abf71194325a9b91ee561673d31e92.

>          arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/bf3c76738c453363bb1ed3ef228ae2877f569f3d/

  CCLD     collectd
libtool: link: cannot find the library `libavltree.la' or unhandled argument `libavltree.la'
make[4]: *** [collectd] Error 1

I don't know. Gustavo, you are the most active contributor on collectd.
Can you have a look?

>          arm |                      exim-4.85 | NOK | http://autobuild.buildroot.net/results/52ff76838e504e2fd472dbad755220952e19e007/

/home/buildroot/build/instance-0/output/host/usr/bin/arm-linux-gcc -o exim_dbmbuild
/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/4.9.2/../../../../arm-buildroot-linux-musleabihf/bin/ld: cannot find -lnsl
collect2: error: ld returned 1 exit status
make[2]: *** [exim_dbmbuild] Error 1

Musl does not provide a libnsl stub it seems. Luca, as our exim guy,
can you have a look?

>          arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/f5c2b5177ca187ec598a07b2e4254d6161177452/

<command-line>:0:0: note: this is the location of the previous definition
f2fs_io_parse.c:16:23: fatal error: sys/queue.h: No such file or directory
 #include <sys/queue.h>

Another musl issue. Gustavo, can you have a look?

>          arc |   host-gdb-arc-2015.06-rc1-gdb | NOK | http://autobuild.buildroot.net/results/2b27a4a64c0b225ae479ecfccf7a97f5ea95598c/

The infamous static/shared issue when building gdb. Romain, I thought
we had fixed this problem. Did we miss a patch?

>         i686 |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/1c546c07572231c3554470c2d4b62b37067b12ec/
>      powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/c9c1721f53edb06b4ca8ee3e48f970e9cdf0b2b7/
>          arm |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/6abe7b66794db51d0f369f708a6c7bb8962ad9c4/
>          arm |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/d8bf25ca45172b8f657a09bb88027ad1eaf4ed6a/
>          arm |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/928fc9092699f7833a0c21ff73301be816b78eeb/
>         i686 |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/20135e1fd3f8a5d22e7dcc213ec0434a366ea696/
>          arm |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/173c9dbed6422a3cc4f9d1f998bc25ce2e9538c7/
>       x86_64 |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/5d77e5693a55a65046c9de2d0cb324d4fac0e80e/
>      powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/5f0382bf460d304e69d5507fcd3562af5759b9ae/
>      powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/1913e2fdefcb3de7e40c1be01498714825c0a955/
>     mips64el |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/d51e8b24a49806b94217fe65468ca7d721e07fb9/
>      powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/6dbab3ec8b0866580480519fade355eb6645ba69/
>     mips64el |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/d0e1d6950275399b07ea4c3f62f6e5393399763f/
>       x86_64 |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/b48b4fe02c33d30f31a6a60a024e9150bccc4beb/
>     mips64el |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/9cace538f454a6368b41c473b54ff1f547ba73ab/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=c2a3d1f8d6b5cbfb5ff225d26dcaeea986ebae39
I believe.

>      powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9147a478f8a2c77461c72a40af5c3f3779bfbe56/

sigsegv.h:118:9: error: unknown type name 'ucontext_t'
 typedef ucontext_t *stackoverflow_context_t;

Some PowerPC person to have a look?

>          arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/4a7b07857cdab6d750a11e4a854eee7b975eff81/

musl build issue. Yann, did you intend to look at libtirpc with musl?

>          arc |                  lvm2-2.02.121 | NOK | http://autobuild.buildroot.net/results/9888a7a30538c9851f4910c16674d8dbb8edeb8f/

BFD (GNU Binutils) 2.23.2 assertion fail elf32-arc.c:3018

Alexey, this seems like a toolchain issue. Can you have a look?

>          sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/c9a509453adb3eaa5ed0989ac41b9ba302c082d4/

Gaah, a SuperH4 build issue.

[ 92%] Building CXX object modules/video/CMakeFiles/opencv_video.dir/src/camshift.cpp.o
/tmp/cccYcKgA.s: Assembler messages:
/tmp/cccYcKgA.s:19880: Error: pcrel too far

Someone willing to report the bug to upstream gcc (and maybe try first
with gcc 4.9 or 5.1) ?

>          arc |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/91d2d49916b77e52ed4c57ca8e8462623c2bafe6/

parallel build issue it seems. Gustavo, maybe?

>          arm | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/993622312239fe56946fdde4d3dfec73786393e5/

 error: no matching function for call to 'pv::prop::Double::Double(const QString&, int, const char [1], std::nullptr_t, std::nullptr_t, const Getter&, const Setter&)'

Bartosz, do you have an idea?

> microblazeel |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/3361f1ff493fa96b9dd6b7f896c2ec229661ba54/
>         i686 |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/f12af085e4a8b148e550b6f37fd07b27f6e36927/
>          arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/0e51b1350de547b907db2e9b938f72e5b00aa265/
>          arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/940211b60542134adc71b20fbff856d6655398ba/
>          arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/59de4d5ae3a20b1b9940c061c3d630931c09b1bc/
>         sh4a |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/9dd68a889299ee4ca09ceea2aeb11c0a26972e1d/
> microblazeel |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/f1a7341681e0a438e64ea26a1823b073ba6012a5/
>         i686 |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/894d7a61cca9f74f5aac44240a017800c02a3a4a/
>       xtensa |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/9952aaf1616d72ee09e9bd0a2b2051618d5f8b11/
>          arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/708c651274744a2352de212ab38648c87c47430c/
>      powerpc |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/9d3a31b810ac3160a0b91d50b8c720e2c227b48d/
>         sh4a |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/c572a58b62e51898fc03d8c9f5862ddae9cf9ad3/
>          arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/6d792ce3f540a6fe2933dd14d1b6c3313b15e1e7/
>         mips |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/956f75e34d3939206deebd02332863d8b4096d92/
>      powerpc |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/7f89f83b3f6b05f41e56a59f75ee46b1f634c5c8/

All fixed by
http://git.buildroot.net/buildroot/commit/?id=84f6eb9fe3467abbd94a6b481ae5106679d61e24.

>     mips64el |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/3ca5c9191f3b294ea3e2df0a170ca5bdcc50d276/

fatal error: gnu/lib-names-n64_soft.h: No such file or directory

>         mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/239facce606cc1a57eab061f3aef0a54e393704c/

fatal error: gnu/lib-names-o32_soft.h: No such file or directory

Vicente, those are MIPS specific issues it seems. Can you have a look?

>          arm | sunxi-mali-d343311efc8db166... | NOK | http://autobuild.buildroot.net/results/a152beb56cdc4591868e14cce9a60e51cbfb0abc/
>          arm | sunxi-mali-d343311efc8db166... | NOK | http://autobuild.buildroot.net/results/0150a807c77113483402b5c7e15c519165547f1e/

Fran?ois, these are caused by your latest libump related fixes I
believe. Can you have a look?

>          arm |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/4f758978f6820ecceaad57385f3c104011180c4d/

Fixed by http://git.buildroot.net/buildroot/commit/?id=49565a282ad6a9f6f04a184407ce04f9c4772e9c.

>          arm |              transmission-2.84 | NOK | http://autobuild.buildroot.net/results/4564fdb2ca8618336ab015ca92071d4f842ab70a/

musl build problem:

In file included from upnpcommands.h:10:0,
                 from miniupnpc.c:90:
upnpreplyparse.h:14:23: fatal error: sys/queue.h: No such file or directory
 #include <sys/queue.h>


>       xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d831d0f0cf0b5e5823cb3131b6ebb5281035945a/
>       xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/5cf4e62cfe5dc59169f3a551b5b52c7533af3c33/
>       xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/8024fd18c20c79bfb561020b1d3bf37f175e970b/
>          arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/7182395fec9dea4cc6c8540630e2a61055169fa7/
>       xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/4610f643868ed06f3e0482263a39a62d9ff9a464/
>          arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/ace1dfb8abd27224e14743f5a043ee5828f70965/
>          arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/dfc75458b042fe5adc8fa9f42e63bed4c060cec6/
>          arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/3e91415b2849aca461c4fa37652aee9f579b3be0/
>          arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/2a7dc82d890f029c6806d610f20cebe211bd3455/
>       xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/83814a85caf9925d7d73b4a06e719b2de0e03968/
>          arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/9e055fb438ebd1dde53ddaf861dd7f0c56bf7c22/
>       xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/78cc2efdd3a50b9c07452d42998eb98196866a94/
>          arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/b424794e2f5e9a4dfd8d4dbdd3d7f5216f646a65/
>          arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/22e3cacb1892dd9bc79ebb7a846ced340f5af6e2/
>          arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/bf88aa69008ea752325c83af921f1807047bef50/

Should all be fixed by:

http://git.buildroot.net/buildroot/commit/?id=e6b339dc8db6418de12e2eb437ba21c1679cb8ca

>      powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/85b22a5f0edeea31ab8a3f283f4eea69c6c1ce89/

src/closefrom.cpp: In function 'int libclf_closefrom(int)':
src/closefrom.cpp:179:17: error: 'OPEN_MAX' was not declared in this scope
make[1]: *** [src/closefrom.o] Error 1
make[1]: *** Waiting for unfinished jobs....

J?rg, can you have a look?

>          arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/e76c5cb755f90d8bef83f370ee681fbb35a8a4ba/

socket_base.cpp: In member function 'void zmq::socket_base_t::event_connected(std::string&, int)':
socket_base.cpp:1157:1: error: Internal consistency failure: cfi row mismatch [-Werror]
 }

Seems to be an ARC toolchain issue. Alexey, can you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
