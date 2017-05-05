From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 May 2017 13:24:23 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-04
In-Reply-To: <20170505062802.8C0262097E@mail.free-electrons.com>
References: <20170505062802.8C0262097E@mail.free-electrons.com>
Message-ID: <20170505132423.3602e294@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Usual analysis of build results. Matt, Waldemar, Mario, Adam, Semyon,
Vicente, Bernd, Martin, Arnout, Peter, there are some issues/questions
for you below. Thanks!

On Fri,  5 May 2017 08:28:02 +0200 (CEST), Thomas Petazzoni wrote:

>          arm |              apache-legal-info | NOK | http://autobuild.buildroot.net/results/2564362d01139ca3bf3caa30509ae1c8c21239ef |     

This one looks really weird. The build was successful, but the
legal-info at the end of the build failed, because the Apache httpd
tarball has disappeared from the download folder. I don't really see
how this could be happening.

Matt, since this issue occurred on your autobuilder slave, could you
indicate if you have done some maintenance / manually removed some
downloaded files ?

A set of random files are removed from the dl/ folder by the
autobuild-run script, but this happens *before* the build, so I don't
see how it can lead to this situation.

>          arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/e14cadb290b0b86cac12c4bfb681eb6eee9e6dea |     

I have just deployed a new ARM/Cortex-M4 toolchain that uses binutils
2.28, so this issue will disappear.

> microblazeel | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/40743aff7e36f21625f2a8bb42d277f79ac1e0a7 |     

Fixed by rebuilding the Microblaze toolchain.

>          arc | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/b2977977d9484d861e6955677032bd929592e8ba |     

Fixed by using the Buildroot ARC toolchain instead of the Synopsys ARC
toolchain.

>          arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/c2b4d30eb4b619322088161774d9fc66beccda64 |     

Fixed by the new ARM/Cortex-M4 toolchain.

>         bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/b7e43a1cdcae5c5c177c35b5275c5b120fda5fa3 | ORPH
>         bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/31f73933a332fb613bbfde78735ed07707b2a83c | ORPH
>         bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/72f477e1ed17b70cfe05018d5140bfc71a3747ce | ORPH

Fixed by
https://git.buildroot.org/buildroot/commit/?id=33ad356ce5dacabe0d3dac89832ce264633793d3.

However, it's a bit sad that binutils is an orphaned package. Who
volunteers to be in the DEVELOPERS file for it?

>          arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/5296e9dccd5023d682d4cd763f15dc08609658d7 | ORPH
>          arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/fabece97746c622b1b852fbf17453682c99c5dd8 | ORPH
>          arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/477573158f2d9738d2fe11f84d0b72f456541b9a | ORPH

Fixed by the new ARM/Cortex-M4 toolchain.

Who wants to be in the DEVELOPERS file for busybox ?

>         mips |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5eab7fb2e78c2bcab9e2f4d9b57c044fb2df0f14 | ORPH
>     mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d7b17f0c31dd39a9fc46284c162dffcfc7a5dc44 | ORPH
>        sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f02e66b3c094b2c5136484f8c28585c7d4a60a40 | ORPH
>      powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6d8ec7d169c58be5d826e8dd3366752d1b5124e1 | ORPH
>       mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/e7c9eb6ac3fe477312c53564ee114d912adb83db | ORPH
>          arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fa7d3e77f4ac0aaee93eb3a31db07a4c5597985a | ORPH
>         sh4a |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c64dd245d12ffecf6465d2f6a3817d7e921bd467 | ORPH
>      powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8e615bf5becd6489320ab376abaa0576fbe0baff | ORPH
>     mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/9fa46ae09dcf0932803e7c52c87d2ebb56c27898 | ORPH
>          arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/23d717bf592f6574137d4e0b20abc830b58a0284 | ORPH
>          arc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1c4de1fbd19243165142086f1691a9d54101661b | ORPH
>        nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/82c1b525ac0449806bd20f6016f6be4fe2bb82fa | ORPH
>      powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d829d8150c977f7b245ef28f0ea0c4b0b3791e03 | ORPH
>         or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6580201099de318dbb8dc5fb9eed0ed7f941e8b9 | ORPH
>       x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/9fd1d166cd44eecef54aff1c32ec9b1bc98f8270 | ORPH
>         i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1017a7f44c955c7113266c3f45c8a5106345e0b2 | ORPH
>        sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/bd6cedaa97db38dddb0a54e81d611bd52694fed6 | ORPH
>          sh4 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0491b8ffc8c580c191e421567982851e3269d557 | ORPH
>         m68k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/eb3ed1638dfd2fb13eff65cff31982c8388a5f29 | ORPH
>         or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7df6b3bbf57d0a695d7c158387bbaa20aa579bab | ORPH

The "old gcc" issue. If that doesn't get resolved today, I will revert
the bump to protobuf 3.2.0, so that we can be back to a working
situation.

Also, Mario, would you accept to be listed in the DEVELOPERS file for
the protobuf package ?

>          arm |          host-ti-cgt-pru-2.1.4 | NOK | http://autobuild.buildroot.net/results/01fccc880ae53a60e03eb1bf8236d5c02c28dada |     

chmod +x /accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/dl/ti_cgt_pru_2.1.4_linux_installer_x86.bin
chmod: changing permissions of '/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/dl/ti_cgt_pru_2.1.4_linux_installer_x86.bin': Operation not permitted

Matthew: this is a configuration issue on your autobuilder slave. It is
not normal that we are not allowed to set execution permissions. Could
you fix this?

>       x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/68c2fb80a57ed5a7b5ba2cddd91aaf7afcc3476b |     

This has been broken for too long on x86-64, I'll disable it.

>          arm |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/f92c7cbb26ee25ba709a2a6b0738189b835d4322 | ORPH
>       mipsel |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/b7ded5f81093790ea528738bc3734503576d1cb2 | ORPH
>        nios2 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/02b3f6bcb2743f529204160e5f1af95a7cf0ba51 | ORPH
>          arm |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/8ca091e02cdbcea1541e8c3d58372cec17705ade | ORPH
>       x86_64 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/c18967f936310680ed91e8dac6476a026d92dddc | ORPH
>       x86_64 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/f6e7a44a56270ebd869ac1e7f78b563c908c7b70 | ORPH
>       mipsel |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/4f0eb2af09c92ff4cd7448211ffda432754d4e60 | ORPH

Fixed by
https://git.buildroot.org/buildroot/commit/?id=4d11848a21d4424a04e8428c4cd3bd5e972aacdf.

Who wants to be in the DEVELOPERS file for this package ?

>     mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/98df2219b99c74f63d214dee5feb77925932f17d |   

Python/SWIG issue in SELinux.

Matthew? Adam?
  
>          arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/87093eb13d0396dc88f60386b2e1169b681f8f98 | ORPH

Should be fixed by the new ARM/Cortex-M4 toolchain.

>          arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/f9e82a87618bcdcd46d670697b5ac75836f7250d |     
>       x86_64 |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/cb0952483b580b053a585760e59d78d11f46fc60 |     

Fixed by disabling lttng-tools on musl/uclibc.

>         i686 |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/440e3b9fc22e508f413caa0f70d2dcd1f46b3d0d |     
>          arm |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/3eef12dbe07fb375e87b2b2898dcc5ef0c11e7a5 |     
>      powerpc |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/04bb96c527ecd062307b2c584da5a0654e26582b |     
>         i686 |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/ca41ced46684b8e982fe4480755d205b922b5cb3 |     
>         i586 |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/872e41cc58a73e0c6152d98eefe0850c6b18f114 |     

Fixed by https://git.buildroot.org/buildroot/commit/?id=63e1e113f27f54d417aca037fd0c7737288ccf83.

>          arc |                  lvm2-2.02.170 | NOK | http://autobuild.buildroot.net/results/259b18181df2af5228707677879c5aeb42e5a36e | ORPH

Fixed by switching to the Buildroot ARC toolchain instead of the Synopsys one.

>      powerpc |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/9624003b0528d33a66f28c6e9dcd48d9bc887363 | ORPH

/home/buildroot/autobuild/run/instance-0/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o): In function `_Unwind_Find_FDE':
/home/buildroot/autobuild/run/instance-0/output/build/host-gcc-final-5.4.0/build/powerpc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:465: undefined reference to `dl_iterate_phdr'

Waldemar, perhaps? I do remember discussing this dl_iterate_phdr()
issue, but I always forget the background.

>     mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/f62c6014a48970f97d718a8698009847ae4b4889 |     

Semyon, what is the status of your work on this package ?

Vicente, this is a very MIPS specific issue, perhaps you could give
some help here ?

>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3fa5b5af77d10e4576cda3a38cb418024aa58e22 |     

Bernd, could you look into this ?

>       mipsel |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/8fb9306200c7f49afb077e3745b11cb65d8bc9ec |     

Vicente, this error is a fallout from your commit
c10724093ae3058d0fb33699c4622a5160e15721 bumping mpv. Could you have a
look ?

>       x86_64 |                   nodejs-7.9.0 | NOK | http://autobuild.buildroot.net/results/0e4fb1a615ab9654ad2b4b1274a34583e02aa44e |     

Network issue while downloading the nodejs coffee script/express stuff.

Martin, do you have an idea what we can do about this ? Should we stop
testing coffee script/express in the autobuilders ?

>        sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/01b7e6157d891905e6cd18a29651688eb0c78fc7 |     

ERROR: architecture for "/usr/lib/libopenblas_sparcp-r0.2.19.dev.so" is "Sparc v8+", should be "Sparc"

So in the end, another package that builds a Sparc file for Sparc v8+
even if we're building for Sparc classic. To be investigated.

Cc'ing Arnout on this one.

>          arm |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/b749b252f63945f278358dcd76b6e9c55214ccd8 |     
>         i686 |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/92e68defe746eb4852b3a45bb27af2282d3f4c7e |     

error: 'vector' in namespace 'std' does not name a template type

Happens in the Qt backend. Peter, perhaps you have an idea ?

>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c6e29c120900cbbc54c1c7fde48217609375dabc | ORPH
>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/61089d8e6651054fa1ed60aad4dbfde5535cda01 | ORPH

Needs -latomic.

>          arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/79900b22c190e883b6d9a3075e1286ec95840ae1 |     

Fixed by
https://git.buildroot.org/buildroot/commit/?id=40c5fff46629ac4f0f55165f9c3594980a4700ef.

>         or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b42dcc8f27a1dd5a77224c1603a1e45605e851af | ORPH
>         or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4ba65792c2bfe75f3c7a57e1dfa7162969e7b2ba | ORPH

Waldemar, should we simply disable qt on or1k ?

>          arm |           qt5declarative-5.8.0 | NOK | http://autobuild.buildroot.net/results/64a198397736db12b73c1f693dbe1c47d73b53da |     

logo.h:52:11: error: 'GLfloat' does not name a type
     const GLfloat *constData() const { return m_data.constData(); }

Peter, an idea ?

There's no OpenGL backend enabled in this configuration.

> microblazeel |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/e25627bdad5caeca653481c18a172f498d32c36f | ORPH
>          arc |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/73170906b5b42ff14c3e444aef0d34fa86729afa | ORPH
>          arm |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/c9048915eccd4be0b2ed709999f53d697bf66900 | ORPH
>       xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/7efbf3508cb4b02b510066be806778317539db75 | ORPH

Issue between uClibc-ng headers and Linux kernel headers 4.11.
Waldemar, I reported the issue on the uClibc mailing list yesterday.

> microblazeel |               rapidjson-v1.1.0 | NOK | http://autobuild.buildroot.net/results/c69b791f944610438daaaa53e1030fe8c78ea3c0 |     
>          arm |               rapidjson-v1.1.0 | NOK | http://autobuild.buildroot.net/results/ac989c119e4ea90b8318795fe9cf8c3e9395a354 |     

Needs C++ support, fixed in
https://git.buildroot.org/buildroot/commit/?id=ab56ce15c1802f41259718e6d36e35790fd8cb0a.

>          arm |                 tinyxml2-4.0.1 | NOK | http://autobuild.buildroot.net/results/5fb0ec2d93fdaa6cb47807488c5db45a67a50b91 |     
>         m68k |                 tinyxml2-4.0.1 | NOK | http://autobuild.buildroot.net/results/c5922dd689fccf74d128f597609418eb43ffebec |     
>         m68k |                 tinyxml2-4.0.1 | NOK | http://autobuild.buildroot.net/results/0247ce0474fb5df8913f8ff12028d992e408964d |     
>          arm |                 tinyxml2-4.0.1 | NOK | http://autobuild.buildroot.net/results/23394eea5f8ef5a1e7993ee84902b37b463ba091 |     

Static linking issue, fixed in
https://git.buildroot.org/buildroot/commit/?id=a598a7109c3b518898f38b433f865801d1c1163f.

>          arm |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/de2da398744b5e2b4ba88641c9ee99426e6f2f28 |     

Fixed in the autobuilder infrastructure.

>       x86_64 | toolchain-external-custom-l... | NOK | http://autobuild.buildroot.net/results/5890a96c4f8324839981ce950241b1c442e80827 | ORPH

This is another instance of legal-info failing on Matthew autobuilder
instance, because the tarball has disappeared.

Matthew, are you doing something funky like sharing the download
folders between the different instances ?

>        nios2 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/75e0655935f438a3d483ee02e8cbc764c48d6652 | ORPH
>       mipsel |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/fb609f6b55cebfd9a970d1253c07a62e883f5984 | ORPH
>     mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/082f2e93ae7f4ff23167e89eda9fa0db6cb8185b | ORPH

Fixed by
https://git.buildroot.org/buildroot/commit/?id=f4891c398e599f18bbf41eb33885930431f5e1c8.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
