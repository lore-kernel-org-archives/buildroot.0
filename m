From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 3 Aug 2016 22:10:16 +0200
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <20160730232322.4eca1a53@free-electrons.com>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
Message-ID: <CA+TH9V=SEgH611feP7Qu1qp=fLg6hOuoDFx0jx4puBkjMywDLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas, All

2016-07-30 23:23 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> We've got lots of failures, so your need is definitely needed to fix
> some of them. Waldemar, Maxime (Hadjinlian and Ripard), Olivier
> (Schonken and Singla), Gustavo, Romain, Alexey, Vlad, Yann, Frank,
> Angelo, Fabrice, Bernd, Julien, Dagg, Vicente, Baruch, Peter, please
> look below, there are lots of things for you! :-)
>
> Thanks for your participation!
>
> On Sat, 30 Jul 2016 08:30:32 +0200 (CEST), Thomas Petazzoni wrote:
>
> >         bfin |                acpica-20160527 | NOK |
> http://autobuild.buildroot.net/results/1852c55f115fd16a986b678521da332c8b1b42cd/
> >         bfin |                acpica-20160527 | NOK |
> http://autobuild.buildroot.net/results/d5999ae91a1f4dee3d01a0bbc3d8a4c5939ad175/
>
> Waldemar, this is an issue with the Blackfin internal toolchain. Could
> you have a look?
>
> bfin-buildroot-linux-uclibc/bin/ld: LINKER BUG: .rofixup section size
> mismatch
>
> >         bfin |                 acpitool-0.5.1 | NOK |
> http://autobuild.buildroot.net/results/8949521b9997ae9db107657d271ddafacb9f3a56/
>
> hidden symbol `___udivsi3'
>
> Another issue in the Blackfin internal toolchain. Waldemar, I believe
> you're already working on it, right?
>
> >         bfin |                 alsa-lib-1.1.1 | NOK |
> http://autobuild.buildroot.net/results/8544ce58d75820666579db93a25ca5656a8efa8e/
>
> undefined reference to `__emutls_get_address'
>
> Again with the Blackfin internal toolchain.
>
> >         bfin |            argp-standalone-1.3 | NOK |
> http://autobuild.buildroot.net/results/17232204249aeb04150ac43a2424aa26a6b6c807/
>
> LINKER BUG: .rofixup section size mismatch
>
> Same bug as acpica.
>
> >         bfin |                    assimp-v3.2 | NOK |
> http://autobuild.buildroot.net/results/c2c1c04c5b323393c06daed60fc89e1e3589ba0f/
>
> hidden symbol `___udivsi3'
>
> Same bug as acpitool.
>
> >         m68k |                    assimp-v3.2 | NOK |
> http://autobuild.buildroot.net/results/bb7a107d1ca6e8713e6ccffe6c61c43b777fb962/
> >         m68k |                    assimp-v3.2 | NOK |
> http://autobuild.buildroot.net/results/63898c00929b4546279bda52148b218f847714ed/
>
> Toolchain problem. Waldemar?
>
> >         bfin |                audiofile-0.3.6 | NOK |
> http://autobuild.buildroot.net/results/ca7f844bb1664c4d408b9187785c37de2d0e5ffa/
> >         bfin |                audiofile-0.3.6 | NOK |
> http://autobuild.buildroot.net/results/879ac63cc337c14e4a70b194de3b112341e5e918/
>
> Still the same Blackfin toolchain issue.
>
> >       xtensa |                   autofs-5.1.2 | NOK |
> http://autobuild.buildroot.net/results/2646def5210473d961a2472293e631d64b338b40/
> >     mips64el |                   autofs-5.1.2 | NOK |
> http://autobuild.buildroot.net/results/969420c1e3b3ef7d56f9755b017ae7a38155020c/
> >          arm |                   autofs-5.1.2 | NOK |
> http://autobuild.buildroot.net/results/237e3b75b6300807449d0c0177ba489f8ffcc706/
> >      aarch64 |                   autofs-5.1.2 | NOK |
> http://autobuild.buildroot.net/results/25ab0037d848bb592e97b3f5bdd34504623f0d0e/
> >          sh4 |                   autofs-5.1.2 | NOK |
> http://autobuild.buildroot.net/results/691d3de2446e1fc034c6ff7a71d3731f7e52a00e/
> >         i686 |                   autofs-5.1.2 | NOK |
> http://autobuild.buildroot.net/results/65b156e06b1076aaacd27c85ba790f61ef390347/
> >      aarch64 |                   autofs-5.1.2 | NOK |
> http://autobuild.buildroot.net/results/d380bbcc216c969522b677c788fb99f41c952b2f/
> >       xtensa |                   autofs-5.1.2 | NOK |
> http://autobuild.buildroot.net/results/dc3519092268982a245acfd2c2a5f3eb742bf806/
>
> Fails to check that /proc is mounted, on build systems where /proc is
> not mounted. We should add an autoconf cache variable to force the fact
> that /proc will be available on the target.
>
> I've committed a fix for this problem:
>
> https://git.buildroot.org/buildroot/commit/?id=9a9b637d04185f9a5b4c73d663b726d3ce2da43b
> .
>
> >       x86_64 |                   babeld-1.7.1 | NOK |
> http://autobuild.buildroot.net/results/05062e5e38f28bd2fe585e7a7b8b170e0c517772/
> >       x86_64 |                   babeld-1.7.1 | NOK |
> http://autobuild.buildroot.net/results/6989e0bd404e89b5ddcf5bd4a988dd5784136667/
> >       x86_64 |                   babeld-1.7.1 | NOK |
> http://autobuild.buildroot.net/results/c27bfc1b7628ce2fbff746767d518547e7b5e46a/
>
> musl build issue. Maxime, can you have a look?
>
> >          arm |                    bdwgc-7.4.2 | NOK |
> http://autobuild.buildroot.net/results/aa83fae5c248ea192ea12101640b3420e68653b3/
>
> checking for pthread_self in -lpthread... yes
> configure: error: "Pthreads not supported by the GC on this platform."
> make: ***
> [/home/peko/autobuild/instance-0/output/build/bdwgc-7.4.2/.stamp_configured]
> Error 1
>
> Waldemar, I though you had fixed this issue. Is this just that I need
> to rebuild the toolchain?
>
> >         bfin |                 bellagio-0.9.3 | NOK |
> http://autobuild.buildroot.net/results/b420fdfddbf86822a6d9d3975b6befe7f91b938f/
>
> I guess this is the usual C++ problem.
>
> > microblazeel |              bluez_utils-4.101 | NOK |
> http://autobuild.buildroot.net/results/871c93da958e5014a9f77212bec89047d4ada6f3/
> > microblazeel |              bluez_utils-4.101 | NOK |
> http://autobuild.buildroot.net/results/06998c35e0aae47f03f82b150c6824e06e768550/
> > microblazeel |              bluez_utils-4.101 | NOK |
> http://autobuild.buildroot.net/results/d8987371bef51567afbd60674b9aa36bb1399481/
>
> BFD (GNU Binutils) 2.25.1 assertion fail elf32-microblaze.c:1491
>
> Romain, would you have the time to see if binutils 2.26 still has the
> issue, and see what is the proper approach (exclude bluez_utils from
> Microblaze, backport a patch, etc.) ?
>
> >         m68k |                   boost-1.61.0 | NOK |
> http://autobuild.buildroot.net/results/c0a8b73901956b393bebe7df3b7af26ade26fcbf/
>
> /tmp/ccYJjr0Y.s: Fatal error: Tried to convert PC relative branch to
> absolute jump
>
> Waldemar?
>
> >          arm |                   cairo-1.14.6 | NOK |
> http://autobuild.buildroot.net/results/3d8dc45e41a043d2c2c26bfb26c3617499fbe671/
>
> ld.real: cannot find -latomic
>
> That's with Cortex-M4. I guess the logic that says when libatomic is
> available and when it is not needs to be changed to take into account
> Cortex-M4. I'll take this on my TODO-list.
>
> >         m68k |                   cairo-1.14.6 | NOK |
> http://autobuild.buildroot.net/results/318e01406e3e92eb589ee5b2231c671a4dbb6da4/
> >         m68k |                   cairo-1.14.6 | NOK |
> http://autobuild.buildroot.net/results/93880f94a97591febba025df2e143de6e078c1d0/
> >         m68k |                   cairo-1.14.6 | NOK |
> http://autobuild.buildroot.net/results/bb8d47336c3117684cf03dd07d9d016a1bc080ff/
>
> Other -latomic issues. I'll have a look, possibly with Waldemar.
>
> > microblazeel |                 cifs-utils-6.5 | NOK |
> http://autobuild.buildroot.net/results/a5848753eb0e2b0ddf55e226c45b85fd3a1c84f3/
>
> Romain, same issue as bluez_utils. Try with binutils 2.26 ?
>
> >         m68k |                  clapack-3.2.1 | NOK |
> http://autobuild.buildroot.net/results/d24a2e9b35c98a10585cd28b3306a09c49163296/
>
> /tmp/ccZmKjwJ.s: Assembler messages:
> /tmp/ccZmKjwJ.s:20945: Error: value -34522 out of range
> /tmp/ccZmKjwJ.s:21278: Error: value -35272 out of range
> /tmp/ccZmKjwJ.s:21919: Error: value -45560 out of range
> /tmp/ccZmKjwJ.s:21920: Error: value -45584 out of range
> /tmp/ccZmKjwJ.s:21936: Error: value -45904 out of range
>
> >         i586 |                   connman-1.33 | NOK |
> http://autobuild.buildroot.net/results/3f23bc42083f2eb039b71e282406ad8f934a9392/
>
> error: redefinition of 'struct ethhdr'
>
> >       x86_64 |                   connman-1.33 | NOK |
> http://autobuild.buildroot.net/results/c13a85d02cf9b2a29d0e590ab650c4cbc06eb44d/
>
> Ditto. Musl build issue.
>
> Gustavo, you are the one regularly bumping connman. Could you have a look?
>
> >         i586 |                     cups-2.1.4 | NOK |
> http://autobuild.buildroot.net/results/f75edbe38f5e719a983f705a427aa8987ea0710d/
>
> adminutil.o: In function `get_cupsd_conf':
> /home/peko/autobuild/instance-2/output/build/cups-2.1.4/cups/adminutil.c:2242:
> undefined reference to `__stack_chk_fail_local'
>
> Seems like a SSP issue.
>
> Olivier, could you have a look ?
>
> >      powerpc |                    dante-1.4.1 | NOK |
> http://autobuild.buildroot.net/results/08b1eb3b723a0bacc961b9bebd2e77f751b0ccb9/
> >      powerpc |                    dante-1.4.1 | NOK |
> http://autobuild.buildroot.net/results/ef6fdc3d14f632e78b17566070eef5f00e94b677/
>
> error: unrecognized command line option '-mfloatprs=double'
>
> Gustavo, could you give some insight about this issue, since it's PowerPC
> stuff ?
>
> >          arc |                    dante-1.4.1 | NOK |
> http://autobuild.buildroot.net/results/964cb9bc434c8634db76c875b877317d77956982/
>
> arc-buildroot-linux-uclibc-gcc.br_real: error: 2: No such file or directory
> arc-buildroot-linux-uclibc-gcc.br_real: error: 2: No such file or directory
>
> Not sure what's going on here. Alexey? Vlad?
>
> >     mips64el | dtv-scan-tables-0c92e5e5d35... | NOK |
> http://autobuild.buildroot.net/results/2aef6e3f7e6b4f403e3b978229f9d92e8df685cb/
> >         i686 | dtv-scan-tables-0c92e5e5d35... | NOK |
> http://autobuild.buildroot.net/results/facc228a501e5ffc898078103eaf0c9f4dc70bfe/
> >      powerpc | dtv-scan-tables-0c92e5e5d35... | NOK |
> http://autobuild.buildroot.net/results/20fd76d2256eee81837f7e9bbaefbe79d7645ae9/
> >      powerpc | dtv-scan-tables-0c92e5e5d35... | NOK |
> http://autobuild.buildroot.net/results/6c39e827c58e1969b26eefd74a64c7e3d20026a3/
>
> Corrupted tarball. Yann, can we enable hash checking for Git-fetched
> packages?
>
> >     mips64el | edid-decode-681153145d5e05e... | NOK |
> http://autobuild.buildroot.net/results/0f7e5495aec809754b496173a316b8eb19ba302e/
>
> Weird corrupted tarball issue that occurs only on Yann's machine.
>
> >     mips64el |                   fio-fio-2.13 | NOK |
> http://autobuild.buildroot.net/results/b42489021b16a90adb3d389645be089fc6eb7740/
>
> Same.
>
> >          arm |                   fio-fio-2.13 | NOK |
> http://autobuild.buildroot.net/results/895043d6b167871706c7615d9020650b78da1844/
>
> fatal error: You must enable NEON instructions (e.g. -mfloat-abi=softfp
> -mfpu=neon) to use these intrinsics.
>
> Gustavo, you did the last bump of this package. Could you have a look?
>
> >       xtensa |                    fwup-v0.8.0 | NOK |
> http://autobuild.buildroot.net/results/ce3793c79d5dc4e296d645c75f22e121f35030d3/
> >         i686 |                    fwup-v0.8.0 | NOK |
> http://autobuild.buildroot.net/results/0c5ffec5438f766dade951a64ebfa1b734a3c0aa/
>
> checking for cfg_searchpath in -lconfuse... no
> configure: error: Could not find libconfuse v2.8 or later
> make: ***
> [/home/dawncrow/buildroot-test/scripts/instance-0/output/build/fwup-v0.8.0/.stamp_configured]
> Error 1
>
> Frank, can you have a look please?
>
> >          arm |                host-gdb-7.10.1 | NOK |
> http://autobuild.buildroot.net/results/3b82c44ee853fab0e0c63881f0705bb659412917/
> >          arm |                host-gdb-7.10.1 | NOK |
> http://autobuild.buildroot.net/results/dafbb93ab38a4285ce42436219d552cceb14828b/
>
> Waldemar, these are GDB Simulator build issues it seems.
>
> >          arm |              host-mono-4.4.1.0 | NOK |
> http://autobuild.buildroot.net/results/ed15afa208f5c6874b86a30570af59d785820060/


The error is

"Mono requires /proc to be mounted."

Something strange with the autobuilder? As today, five days are passed
withouth errors. Probably resolved?


>
>
> Angelo, this is mono stuff, could you investigate?
>
> >          arm | host-mxsldr-2793a657ab7a224... | NOK |
> http://autobuild.buildroot.net/results/71b980282a4a2d3fc4f237596ce8ebf4c780a3a0/
>
> Yann's machine weird issue.
>
> >          arm |              host-mysql-5.1.73 | NOK |
> http://autobuild.buildroot.net/results/ba29a7417b12a2ccc90261ba133ded69d8b246e1/
> >         sh4a |              host-mysql-5.1.73 | NOK |
> http://autobuild.buildroot.net/results/6cc190a5f96473b84f24b96aae5c6256509b4d3c/
> >          arc |              host-mysql-5.1.73 | NOK |
> http://autobuild.buildroot.net/results/98957edbd282cf0f4f3b243d338e084732fb805e/
> >       x86_64 |              host-mysql-5.1.73 | NOK |
> http://autobuild.buildroot.net/results/a5f7a05fcf5f457d2457637bbd6226260a0bd142/
>
> checking for ps... /bin/ps
> checking how to check if pid exists... configure: error: Could not find
> the right ps and/or grep switches. Which OS is this?  See the Installation
> chapter in the Reference Manual.
> make[1]: ***
> [/home/buildroot/autobuild/run/instance-3/output/build/host-mysql-5.1.73/.stamp_configured]
> Error 1
>
> It is checking the host ps, which is wrong. Could someone have a look?
>
> >      aarch64 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/b68215479b2c995df88af96292682012ff6ac08c/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/264c6b6fa7f5377b1752c05e8322f8e9609ebe63/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/03a9ebc7fc76e3656f7f0721cf966a95c54104b3/
> >          arc |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/0d1b59d0cbf3a3093ab0a72a0422be4207b78ef9/
> >          arc |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/1e5655d32ef20b7cbcdedd4e3345458b8a8a9657/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/64be5cbf27b7f2743e76c5981b62303c86a7df6a/
> >        nios2 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/c8eec6eabd9356bc865fce1ae846fac9a6134245/
> >         sh4a |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/fc1c14ea8b677f0bb025ceab31cb368851645302/
> >       x86_64 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/eb81171c622a9bc06f00203236ecd4ba7d1ae8c4/
> >      sparc64 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/70483024ac04894f4502f59e706959879996d2ac/
> >       xtensa |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/5ad29fa8f8e640ef1dd32641e9578826787bfc10/
> >       x86_64 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/22760e7801f1c052470fc12a13ba09af58fc62f7/
> >         i686 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/868e8afeee86ceec50841889d190aafb1a43451a/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/ce0426f1697be884f310db9df6d11f8c4be3bcb6/
> >       x86_64 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/ecf842d1fd672fcbc47bdb7584aeefee5db0a087/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/486b5b62bd3198d0811e15e724a55f73d886fa83/
> >        sparc |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/372810dcfffc8bf42107ad40694846e13ea5a192/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/8a5c6b4d43a5188edd2f2428349ef2d0c23efa47/
> >       xtensa |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/c9997db80f2f15fe0251dfe7292697e5933adc06/
> >        nios2 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/a518a20f9b1b096237e90a9a1bfd19c9854f3352/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/a305e4765f6dd9a7c2945549c58103358b222b63/
> > microblazeel |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/fa5b97a5140f6f5bcaf55b809ae52d18c607e420/
> >         mips |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/1ec78504fc2a8d2924d40069ea8466f6ea4b0a31/
> >         sh4a |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/5abd2390e2a22bae9a10cd929a27040ae77dd52e/
> >       xtensa |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/3efd422fb8fb8f4306a5908135cd68bff7df6c3c/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/0cac6ae7a66be4832fbd84337575cb4fb2fda028/
> >      sparc64 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/4ec7f895ae65f07e34a334ca1f070b6d8e67e60e/
> >      aarch64 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/91e7bc52603734506035a4494b858c1448d2d3cb/
> >         i686 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/1078ba2023998261e4e5d4011b8c849aaea12afa/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/3f5008a535acc35b1e9349f96eacb736e8fb1594/
> >       xtensa |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/8249d084b178f9456aa2979ec7e5cee116634e5f/
> >        sparc |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/f9c9f29acb08e7c1a9f947116bf94562bbf59d84/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/fedad22adeed242307d15561a177455398d3e10e/
> >          sh4 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/596dcb5efaf6b20296602e7d044605ed63b7a58b/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/be82a6d5c1a6725496839e73bc0818f495e4a6b3/
> >         i686 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/542248975cbc0a0bea119111c5ff1bf3118fa0f3/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/d6295bbf66b2055df12df705f546acf1334de00c/
> >         i686 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/139f29e486415c7804f2d3cb685159467bf688ec/
> >      sparc64 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/ccc2efa78ae1db2264a709764d166d09ca0b2cce/
> >         i586 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/a46f6a79fc52af110d45eec88fd527b4acb83d0e/
> >         m68k |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/d31706789d01b7d9e3251bbaa835303f2cf01d43/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/92fd298c62ad11c5e693d5a248acf4ea133f2c25/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/f1728e52815eff4269357020811480bb452d6bae/
> >         i686 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/67c8037f296aa16b2d01220cd004c80690230fa0/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/d16ce00bcf867da35f5babc31a272c4e18568e88/
> >     mips64el |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/b8b5af65c564eb09527c75f64e2925432b803e7b/
> >         bfin |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/5fddb19c17cfc77849748c47e91bddbacbf02f72/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/d78d34db2f39945843f45590cd89df7540e8c1ab/
> >         i686 |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/92432bf8cd98b75f4b41fc4cec24202c6c324ff5/
> >       xtensa |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/f0b4e36fb6da9bd596f27ae0e585fb665a7e8833/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/bd7dd071390cba36daa6b93e28a02b6abbb43292/
> >         mips |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/097df1d1c52651a9bd5328e2e551beecb1cd0b09/
> >          arc |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/904ddac78e708cd86cb4cfc4151d42f0af12b324/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/19c33bf9c08588e2a8bf05dcc99b875eb9517d61/
> >          arm |  host-python-setuptools-18.7.1 | NOK |
> http://autobuild.buildroot.net/results/66979e7fd2bdbad4bce11854e278e3c0a2b26a72/
>
> This was all caused by the -I -> -isystem change, which I have reverted
> for now.
>
> >          arm |            igd2-for-linux-v1.1 | NOK |
> http://autobuild.buildroot.net/results/b618f60cd4c43ff30eb17fe73cb8d60a1e155e9b/
>
> Forgets to link with -lpthread, since libupnp uses it. Fabrice, could
> you have a look?
>
> >          arm | inotify-tools-1df9af4d6cd0f... | NOK |
> http://autobuild.buildroot.net/results/abcaf70523863a4cd096a1b063be2e742355849f/
>
> inotifywait.c: In function 'output_event_csv':
> inotifywait.c:126:5: error: this 'if' clause does not guard...
> [-Werror=misleading-indentation]
>      if (filename != NULL)
>
> gcc 6.x build issue. Bernd, you are the last person who bumped this
> package. Could you investigate?
>
> >         m68k |                   iozone-3_446 | NOK |
> http://autobuild.buildroot.net/results/e5bbb80c81f4f170cf48d375e016e87a296ff754/
>
> iozone_linux-noaio.o: In function `count_burst':
> iozone.c:(.text+0x8ec6): undefined reference to `pthread_barrier_wait'
> iozone_linux-noaio.o: In function `throughput_test':
> iozone.c:(.text+0x1cbe4): undefined reference to
> `pthread_barrierattr_setpshared'
> iozone.c:(.text+0x1cbea): undefined reference to `pthread_barrier_init'
> iozone.c:(.text+0x24952): undefined reference to `pthread_barrier_destroy'
> collect2: error: ld returned 1 exit status
>
> Needs NPTL maybe. Waldemar?
>
> > microblazeel |                 iproute2-4.5.0 | NOK |
> http://autobuild.buildroot.net/results/118c92055daca52d9b10d764835c0d0c0b24fdc2/
>
> cannot find -lpthread
>
> Not sure what happens here :-/
>
> >         i686 | kmsxx-a706f157b86e906968080... | NOK |
> http://autobuild.buildroot.net/results/0e576ec01bbbf68a05216f4459a8a0613c39c141/
>
> Seems like there is a dependency on recent enough kernel headers. But
> there are also some wrong casts being done in the code.
>
> Maxime (Ripard), could you have a look?
>
> >       x86_64 |               lbreakout2-2.6.4 | NOK |
> http://autobuild.buildroot.net/results/b0573be43645c70aeb08fed0b4d732382b0c62ad/
>
> The code is built with gcc, but it uses a C++ library, so there are some
> weird issues.
>
> Julien, you contributed this package. Could you have a look?
>
> >          arm | libamcodec-6f9b99182f94be14... | NOK |
> http://autobuild.buildroot.net/results/d86947203330ec0b3f9395123d8dc04ec4667229/
>
> Dagg, could you have a look?
>
> >          arc |                libcap-ng-0.7.7 | NOK |
> http://autobuild.buildroot.net/results/5430b902d900943a34c1888e7e410bd5df367bc2/
>
> /tmp/ccGvdupB.s: Assembler messages:
> /tmp/ccGvdupB.s:575: Error: @dtpoff is not a complex relocation.
> /tmp/ccGvdupB.s:575: Error: extra comma
> /tmp/ccGvdupB.s:575: Error: syntax error
> /tmp/ccGvdupB.s:585: Error: @dtpoff is not a complex relocation.
> /tmp/ccGvdupB.s:585: Error: extra comma
> /tmp/ccGvdupB.s:585: Error: syntax error
>
> Alexey, Vlad, this one is for you?
>
>
> >        nios2 |                libdvdnav-5.0.3 | NOK |
> http://autobuild.buildroot.net/results/d5b30d6b5463928ded1a1c1f1f5345a726f6ffaf/
> >        nios2 |                libdvdnav-5.0.3 | NOK |
> http://autobuild.buildroot.net/results/917041c7165093f44a5d3b4a5ba56a3d1b59e456/
> >        nios2 |                libdvdnav-5.0.3 | NOK |
> http://autobuild.buildroot.net/results/dcfc53b6fc25210cf70a1abf0e24b85f0d971101/
> >        nios2 |                libdvdnav-5.0.3 | NOK |
> http://autobuild.buildroot.net/results/79109d06183efa17f6f68c1ea78cbd9927c5c46e/
>
> Hum, I believe we might have an issue with the recent changes in the
> thread options in uClibc. Seems like the toolchain was built without
> thread support?
>
> >         sh4a | libg7221-dbfc29d4806ecdace5... | NOK |
> http://autobuild.buildroot.net/results/32e0531599a28f3a23915733fa3240b7b13af9e7/
> > microblazeel | libg7221-dbfc29d4806ecdace5... | NOK |
> http://autobuild.buildroot.net/results/8b2a33f949228b876b0004dc68f2cc06e87b24d6/
> >         m68k | libg7221-dbfc29d4806ecdace5... | NOK |
> http://autobuild.buildroot.net/results/3ea089251b5a0dac39569c5fed500717667aec5c/
>
> Corrupted tarball.
>
> > microblazeel |                libglib2-2.48.1 | NOK |
> http://autobuild.buildroot.net/results/51c3fcb30647d93bfadb0c5f6f7b43c81462db08/
>
> checking for ngettext in -lintl... no
> configure: error:
> *** You must have either have gettext support in your C library, or use the
> *** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html
>
> Gustavo, could you have a look?
>
> >          arm |              libsidplay2-2.1.1 | NOK |
> http://autobuild.buildroot.net/results/8907e367345ac8ec16f118eb550810b4e758f0c3/
>
> xsid.cpp:101:1: error: narrowing conversion of ''\200'' from 'char' to
> 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>  };
>  ^
> xsid.cpp:101:1: error: narrowing conversion of ''\224'' from 'char' to
> 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\251'' from 'char' to
> 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\274'' from 'char' to
> 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\316'' from 'char' to
> 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\341'' from 'char' to
> 'int8_t {aka signed char}' inside { } [-Wnarrowing]
> xsid.cpp:101:1: error: narrowing conversion of ''\362'' from 'char' to
> 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>
> Bernd, this is your package.
>
> >      powerpc |                  libunwind-1.1 | NOK |
> http://autobuild.buildroot.net/results/8e708404d99ce04a9b183868010504aa226a54ad/
> >      powerpc |                  libunwind-1.1 | NOK |
> http://autobuild.buildroot.net/results/7fab869ea5bdbd5ca7a701e8fdfa31b0c154101a/
>
> ../include/libunwind-ppc32.h:182:9: error: unknown type name 'ucontext_t'
>  typedef ucontext_t unw_tdep_context_t;
>
> Gustavo ?
>
> >          arc |            libvncserver-0.9.10 | NOK |
> http://autobuild.buildroot.net/results/a563b484c9d123a711f1c92513cfc14c23bbc038/
>
> Another ARC toolchain issue. Alexey, Vlad?
>
> >          arm |                   libvpx-1.4.0 | NOK |
> http://autobuild.buildroot.net/results/39e39de374414ffa07b6dc5f25c39dfb47cc8ad4/
>
> ./vpx_mem/vpx_mem.h:17:19: fatal error: lddk.h: No such file or directory
>
> Bernd ?
>
> >          arc |                linux-pam-1.2.1 | NOK |
> http://autobuild.buildroot.net/results/2c3aa54a14dbb561d56d8a48b6b9904f4cd1be12/
> >          arc |                linux-pam-1.2.1 | NOK |
> http://autobuild.buildroot.net/results/e9510c9443619d059770f85eb9755700e864a0c9/
>
> BFD (GNU Binutils) 2.26.51.20160702 assertion fail elf32-arc.c:1587
>
> Alexey, Vlad?
>
> >         i686 |               lirc-tools-0.9.4 | NOK |
> http://autobuild.buildroot.net/results/e66cdb2ee1cc1f987e2ccc8d8cc465243a499754/
> >         sh4a |               lirc-tools-0.9.4 | NOK |
> http://autobuild.buildroot.net/results/6b01d5987fb95cb1653c3b52e3ef86b33a3c39de/
> >         i686 |               lirc-tools-0.9.4 | NOK |
> http://autobuild.buildroot.net/results/ffe99f41354c6f12e05c4bd887cdeecd5868ae2f/
> >         i686 |               lirc-tools-0.9.4 | NOK |
> http://autobuild.buildroot.net/results/7b13f46e4a6e26ca56f2d88ee806025271285793/
>
> undefined reference to `clock_gettime'
>
> Gustavo, could you have a look?
>
> > microblazeel |                  lvm2-2.02.161 | NOK |
> http://autobuild.buildroot.net/results/2897a2fa72b98736333fe0c2fa9da802ba982e32/
> > microblazeel |                  lvm2-2.02.161 | NOK |
> http://autobuild.buildroot.net/results/e260a992d4ca29a55e356b81d81d44bdafb7fe14/
>
> Yet another:
>
>    BFD (GNU Binutils) 2.25.1 assertion fail elf32-microblaze.c:1491
>
> Romain ?
>
> >          arm |                 mongodb-r3.3.4 | NOK |
> http://autobuild.buildroot.net/results/c3c30c982a82138875cec450ab06322bee90329e/
> >         i686 |                 mongodb-r3.3.4 | NOK |
> http://autobuild.buildroot.net/results/8aa7508ffccb5a7b5be69b8b7f86ef53c91e0be3/
>
> This was a fall-out of the -isystem patch I believe: host-python was
> built without zlib support. It should be ignored.
>
> >       x86_64 |                   mono-4.4.1.0 | NOK |
> http://autobuild.buildroot.net/results/5c5b7cbed06600042d66b04589f565bf32b1a69d/
>
> Angelo ?
>
> >          arc |                     mosh-1.2.5 | NOK |
> http://autobuild.buildroot.net/results/d81e817f45331c90ed7aa7f114628a2ebe343979/
> >          arc |                     mosh-1.2.5 | NOK |
> http://autobuild.buildroot.net/results/8997fdf95be140123be183e860e6948a21ed038a/
>
> Some more ARC toolchain issues: BFD (GNU Binutils) 2.26.51.20160702
> assertion fail elf32-arc.c:2267.
>
> Alexey, Vlad :)
>
> >         m68k |                   multicat-2.1 | NOK |
> http://autobuild.buildroot.net/results/0f5ed287f1756fbec710454e9c694202c3206dbe/
>
> aggregartp.c: In function 'main':
> aggregartp.c:344:40: error: 'POLLRDHUP' undeclared (first use in this
> function)
>      pfd[0].events = POLLIN | POLLERR | POLLRDHUP | POLLHUP;
>
> Waldemar ?
>
> >          arm |                    ncurses-5.9 | NOK |
> http://autobuild.buildroot.net/results/5bb34ff490c70eea5e4fb497e5228ca1319fffdc/
> >          arm |                    ncurses-5.9 | NOK |
> http://autobuild.buildroot.net/results/8ba1410ed3ffb4954ccc4b7c3996d1839d677bef/
> >         m68k |                    ncurses-5.9 | NOK |
> http://autobuild.buildroot.net/results/26ee52ad549b7ef75c9ce4b2eae94f9312cea775/
>
> noMMU issue, on both ARM and m68k. Waldemar ?
>
> >       x86_64 |                netplug-1.2.9.2 | NOK |
> http://autobuild.buildroot.net/results/4492a8bf476443a525bd0321a7883c5b5fda69bb/
> >          arm |                netplug-1.2.9.2 | NOK |
> http://autobuild.buildroot.net/results/30d8e55cd155ba95a56b33e11d7726f8f42c15ff/
>
> netplug.h:77:5: error: unknown type name 'time_t'
>
> musl related issue.
>
> >          arm |              ntfs-3g-2016.2.22 | NOK |
> http://autobuild.buildroot.net/results/f26bf9bebec41c21f8220c0407b1d9f82fb01cd6/
>
> fusermount.c: In function 'count_fuse_fs':
> fusermount.c:172:24: error: '_PATH_MOUNTED' undeclared (first use in this
> function)
>      const char *mtab = _PATH_MOUNTED;
>
> Vicente, you are the last one who bumped this package. Can you have a look?
>
> >          arm | openblas-f04af36ad0e85b64f1... | NOK |
> http://autobuild.buildroot.net/results/0c18ee04ed721166338fddfc5ee175273c153454/
> >          arm | openblas-f04af36ad0e85b64f1... | NOK |
> http://autobuild.buildroot.net/results/0e6d1c976857799679a2e3581172f9ed1599e497/
> >         mips | openblas-f04af36ad0e85b64f1... | NOK |
> http://autobuild.buildroot.net/results/29a43ea8e733d1fbf91fdc0697a0e020c408efd6/
>
> Vicente, this package is also for you :-)
>
> >          sh4 |                  opencv3-3.1.0 | NOK |
> http://autobuild.buildroot.net/results/fd03ec064fb6f2c22b8a965243922483ff995f5a/
>
> /tmp/ccowJkHs.s: Assembler messages:
> /tmp/ccowJkHs.s:19767: Error: pcrel too far
>
> Toolchain issue. Romain, do you remember this one?
>
> >        sparc |                 openmpi-1.10.2 | NOK |
> http://autobuild.buildroot.net/results/e9402204edb86b3315ce55b47f6262df1d27a45a/
>
> checking if have Sparc v8+/v9 support... no
> configure: WARNING: Sparc v8 target is not supported in this release of
> Open MPI.
> configure: WARNING: You must specify the target architecture v8plus to
> compile
> configure: WARNING: Open MPI in 32 bit mode on Sparc processors (see the
> README).
> configure: error: Can not continue.
>
> Waldemar ?
>
> >         i586 |                  openssh-7.2p2 | NOK |
> http://autobuild.buildroot.net/results/0c9ab174856373c082fe2ccf698f3a755fab01b2/
>
> ssh.o: In function `main_sigchld_handler':
> ssh.c:(.text+0x13d): undefined reference to `__stack_chk_fail_local'
> ssh.o: In function `process_config_files.part.1':
> ssh.c:(.text+0x65d): undefined reference to `__stack_chk_fail_local'
> ssh.o: In function `resolve_host.constprop.6':
> ssh.c:(.text+0xc16): undefined reference to `__stack_chk_fail_local'
> ssh.o: In function `ssh_session2_setup':
> ssh.c:(.text+0xdaf): undefined reference to `__stack_chk_fail_local'
>
> SSP issue.
>
> >         m68k |                 openssl-1.0.2h | NOK |
> http://autobuild.buildroot.net/results/455fd0f274bfa4bbd786bcd6740ecf960e47c1bd/
>
> m68k toolchain issue. Waldemar ?
>
> >          arm |                openswan-2.6.46 | NOK |
> http://autobuild.buildroot.net/results/70da34c1528b51e92e9e60788f83733d70b33353/
>
> In file included from
> /home/buildroot/autobuild/run/instance-2/output/build/openswan-2.6.46/lib/libopenswan/constants.c:1361:0:
> /home/buildroot/autobuild/run/instance-2/output/build/openswan-2.6.46/include/arpa/nameser.h:58:23:
> fatal error: sys/cdefs.h: No such file or directory
>  #include <sys/cdefs.h>
>
> musl issue. Bernd, or Gustavo, you are the last ones who bumped this
> package, could you have a look?
>
> >          arm |                 oprofile-1.1.0 | NOK |
> http://autobuild.buildroot.net/results/68aee16358e074d3089125e0eb29d651fc8cf657/
>
> Seems like a gcc 6.x issue:
>
> op_bfd.cpp:538:47: error: cannot convert 'std::ostream {aka
> std::basic_ostream<char>}' to 'const bool' in initialization
>   bool const verbose = cverb << (vbfd & vlevel1);
>                                                ^
> op_bfd.cpp:546:7: error: in argument to unary !
>   if (!verbose)
>        ^~~~~~~
>
> >       xtensa |                     owfs-3.1p1 | NOK |
> http://autobuild.buildroot.net/results/b02b8586a160d6963b9621e3ad582ffed9fedf64/
> >       xtensa |                     owfs-3.1p1 | NOK |
> http://autobuild.buildroot.net/results/e7a222bdd5736bf81c7fe872f61778d6207fe15b/
>
> Arnout, you added owfs. Can you have a look?
>
> >         m68k |                      php-7.0.9 | NOK |
> http://autobuild.buildroot.net/results/d1471227151e87d2e690a1bd9209c491b2feec8b/
>
> Toolchain issue:
>
> /tmp/cc3GcxVi.s: Assembler messages:
> /tmp/cc3GcxVi.s: Fatal error: Tried to convert PC relative branch to
> absolute jump
>
> Waldemar ?
>
> >          arm |                      php-7.0.9 | NOK |
> http://autobuild.buildroot.net/results/36e3f5b3f313b60237a180886c810ec7bb35fb50/
> >         bfin |                      php-7.0.9 | NOK |
> http://autobuild.buildroot.net/results/1e825f30b8fe25704573e25082528bcf339796ad/
> >         bfin |                      php-7.0.9 | NOK |
> http://autobuild.buildroot.net/results/b2b1b527e8e4b7c0db01b2a984badc0d550dbd69/
>
> sapi/phpdbg/phpdbg_prompt.o: In function `phpdbg_load_module_or_extension':
> phpdbg_prompt.c:(.text+0x2b64): undefined reference to `DL_LOAD'
> phpdbg_prompt.c:(.text+0x2b78): undefined reference to `GET_DL_ERROR'
> phpdbg_prompt.c:(.text+0x2ba4): undefined reference to `DL_FETCH_SYMBOL'
> phpdbg_prompt.c:(.text+0x2bb8): undefined reference to `DL_FETCH_SYMBOL'
> phpdbg_prompt.c:(.text+0x2cf8): undefined reference to `DL_UNLOAD'
>
> Vicente, Gustavo, a proposal? If you don't make a proposal, I'll mark
> PHP as !BR2_STATIC_LIBS.
>
>
> >       mipsel | qt5webkit-b889f460280ad98c8... | NOK |
> http://autobuild.buildroot.net/results/590dc4e933ef95646ddcd6c64f9c0307863d3df5/
>
> Vicente, this is some MIPS stuff for you :)
>
> >         bfin | rtmpdump-a107cef9b392616dff... | NOK |
> http://autobuild.buildroot.net/results/a3e54e42a4eeacab6a4aab8e898adcfeab8ef870/
> >          arm | rtmpdump-a107cef9b392616dff... | NOK |
> http://autobuild.buildroot.net/results/995ce016d737feb84896dfa2751b14562603ff06/
> >        nios2 | rtmpdump-a107cef9b392616dff... | NOK |
> http://autobuild.buildroot.net/results/fbef4bb7c02692995bc8b2faf75cd092bcbd7a2c/
>
> Corrupted archive, ignore.
>
> >       x86_64 |              shellinabox-v2.19 | NOK |
> http://autobuild.buildroot.net/results/1847cab964957da3c9bf4911a5ad3602b3c82431/
>
> shellinabox/launcher.c:1559:36: error: 'TTYDEF_IFLAG' undeclared (first
> use in this function)
>    tt.c_iflag                    =  TTYDEF_IFLAG & ~ISTRIP;
>                                     ^
> musl build issue.
>
> Olivier (Singla), you contributed this package, could you have a look?
>
> >         bfin |                   snmppp-3.3.5 | NOK |
> http://autobuild.buildroot.net/results/12d3a46aa770f8444a274e8b98688e3577817121/
> >         bfin |                   snmppp-3.3.5 | NOK |
> http://autobuild.buildroot.net/results/c4cf65e1a4732bef1c8198f986a9daceca175da3/
>
> Usual C++ Bfin problem. For Waldemar :)
>
> >      powerpc |                    strace-4.12 | NOK |
> http://autobuild.buildroot.net/results/252a04855f0e92efb2770d887d9ce6cb63bc6461/
> >       xtensa |                    strace-4.12 | NOK |
> http://autobuild.buildroot.net/results/2e8f7052cb3f4ca6a7ebcf506ea5a6cf04ffc736/
>
> btrfs.c:68:8: error: redefinition of 'struct btrfs_ioctl_defrag_range_args'
>  struct btrfs_ioctl_defrag_range_args {
>
> Baruch, you are the last one who bumped strace, could you have a look?
>
> >          arm |                    systemd-231 | NOK |
> http://autobuild.buildroot.net/results/a93692358ff820d0dabb75b94936572922aed7c5/
>
> src/import/export-raw.c: In function 'reflink_snapshot':
> src/import/export-raw.c:271:26: error: 'O_TMPFILE' undeclared (first use
> in this function)
>          new_fd = open(d, O_TMPFILE|O_CLOEXEC|O_NOCTTY|O_RDWR, 0600);
>                           ^
>
> I thought we had resolved the O_TMPFILE issue. Yann, Maxime ?
>
> >          arm |          systemd-bootchart-230 | NOK |
> http://autobuild.buildroot.net/results/2d8a82cca83d1e5e281711951a056819aba39e9f/
>
> DocBook issue. We should disable the documentation related stuff. Yann,
> Maxime ?
>
> >       mipsel |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/c82c16d550f012f16058400b755e8c1e521c257e/
> >         mips |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/5eb8acec7aa4e5a73047e16b678457b300df7c95/
> >        nios2 |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/ce7c4bbf5ad2b23571ad65b82909c100f9448ac8/
> >       x86_64 |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/5c1faecae14790bc5a6c8c53e777a2ca4f5790a2/
> >     mips64el |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/6c433c77a1b04a1d733d78e4f916dfa59ff26662/
> >          arm |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/cb0bf5702fb41ef9319bbb3a080626c9c7d68fe7/
> >        sparc |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/ed70e23e6337d3a3b9917b2ac9e6357e31545c2a/
> >          arm |                target-finalize | NOK |
> http://autobuild.buildroot.net/results/0f67e7646039426b38b3fa1777c39b813560fa9f/
>
> All resolved in the tinycbor package, by commit
>
> https://git.buildroot.org/buildroot/commit/?id=04c9be519de922cda3e20a00be2fad39b265d398
> .
>
> >         bfin |                tinycbor-v0.3.1 | NOK |
> http://autobuild.buildroot.net/results/a5ead567b57b90815e3c2ed320c1937cebaa3882/
>
> Anonymous union issue. Already reported to Fabrice.
>
> >      powerpc |              transmission-2.92 | NOK |
> http://autobuild.buildroot.net/results/12184cde82a405eb41356ce88918b2f28bc5c237/
>
> net.c:40:24: fatal error: libutp/utp.h: No such file or directory
>
> Bernd ?
>
> > microblazeel | triggerhappy-7e5abc69f21567... | NOK |
> http://autobuild.buildroot.net/results/4dbb88b8d0fd83f3a44d0daff6a7fffebd235317/
> >       xtensa | triggerhappy-7e5abc69f21567... | NOK |
> http://autobuild.buildroot.net/results/86b6577acffdb27cbb4015fd00e9295df7de9409/
> >          arm | triggerhappy-7e5abc69f21567... | NOK |
> http://autobuild.buildroot.net/results/06e1e3ee4ff9e2b883fd2ad45c0a3229b1212fae/
> >      powerpc | triggerhappy-7e5abc69f21567... | NOK |
> http://autobuild.buildroot.net/results/9855efe0ce46ce62bd488a96a185cd0cd2479734/
> > microblazeel | triggerhappy-7e5abc69f21567... | NOK |
> http://autobuild.buildroot.net/results/96748cbceef475afc2a22a2a87dfdddfbf620f9a/
>
> evtable_SW.inc:17:1: error: array index in initializer exceeds array bounds
>  EV_MAP(SW_PEN_INSERTED),
>  ^
>
> Peter, you contributed this package, so your turn to look into this :-)
>
> >          arm |                   trinity-v1.6 | NOK |
> http://autobuild.buildroot.net/results/84f226e02a47325773dc560ce7bc67922eef8dc3/
>
> musl build issue. Vicente, you added this package. Could you have a look?
>
> >       x86_64 | tvheadend-8e637f9f903f6d820... | NOK |
> http://autobuild.buildroot.net/results/d2a497dcd1bb1200c07fe3c0a7136b5dade16e3e/
> >          arc | tvheadend-8e637f9f903f6d820... | NOK |
> http://autobuild.buildroot.net/results/7bd61f799b3ab60fa98b1823152018f5ec69639c/
> >          arm | tvheadend-8e637f9f903f6d820... | NOK |
> http://autobuild.buildroot.net/results/31b583e5708ee6e17fe8b6d6e646b1a59568e5b5/
>
> These are fallout from the -isystem patch, ignore.
>
> >         bfin |                 wavemon-v0.8.0 | NOK |
> http://autobuild.buildroot.net/results/d81b199c74cb4251f0b0eb975f66cb5016eb464c/
>
> iw_scan.c: In function 'scan_result_init':
> iw_scan.c:378: warning: implicit declaration of function
> 'pthread_mutexattr_setrobust'
> iw_scan.c:378: error: 'PTHREAD_MUTEX_ROBUST' undeclared (first use in this
> function)
> iw_scan.c:378: error: (Each undeclared identifier is reported only once
> iw_scan.c:378: error: for each function it appears in.)
>
> NPTL needed, maybe? Waldemar?
>
> >          arm |    webrtc-audio-processing-0.3 | NOK |
> http://autobuild.buildroot.net/results/4933082cd7cc5781404c77ccef5c2b9333c5f714/
>
> signal_processing/complex_bit_reverse_arm.S:33: Error: shifts in CMP/MOV
> instructions are only supported in unified syntax -- `mov r1,r3,asl r1'
> signal_processing/complex_bit_reverse_arm.S:34: Error: instruction not
> supported in Thumb16 mode -- `subs r6,r1,#1'
>
> Doesn't like Thumb-2 only build, should probably be disabled.
>
> >     mips64el |     xserver_xorg-server-1.18.4 | NOK |
> http://autobuild.buildroot.net/results/349fb43101d4e780203baea1dac7ff4189bc28bb/
>
> Bernd, this one is for you. I know you already sent a patch for this,
> which I didn't like. Do you think you will have some time to rework
> this patch?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160803/61e7d30a/attachment-0001.html>
