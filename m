From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 29 Apr 2019 16:52:31 +0200
Subject: [Buildroot] Using aarch64-linux-gnu_ilp32
In-Reply-To: <MN2PR18MB27031E657093E72F41969828BD390@MN2PR18MB2703.namprd18.prod.outlook.com>
References: <MN2PR18MB27031E657093E72F41969828BD390@MN2PR18MB2703.namprd18.prod.outlook.com>
Message-ID: <0a627ddf-43bc-7375-f68b-522cffd5f9c9@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Assaf, All,

Le 29/04/2019 ? 15:46, Assaf Hoffman a ?crit?:
> Hi,
> I'd like to use Buildroot in 32-bit ILP-32 mode while running in AARCH64.
> I used gcc-linaro-7.3.1-2018.05-rc1-x86_64_aarch64-linux-gnu_ilp32 downloaded from Linaro as custom external toolchain
> The build failed on misalignment between compiler mode ILP32 and source code mode (defined __LP64__) .
> Is there a way to configure Buildroot to 32-bit build?
> Thanks.

For now, Buildroot doesn't support building systems using ILP32 ABI for aarch64.

Back in 2015, some patches adding initial support for ILP32 was posted on the
mailing list but it required to use specific version (WIP) for each toolchain
components and no prebuilt toolchain was available. See the wiki [1].

Maybe you can resend the series using an external Linaro toolchain.
(Note: Linaro toolchains are superseded by ARM toolchain but there is no ILP32
anymore).

[1] https://www.elinux.org/Buildroot#Toolchain

Best regards,
Romain Naour

> 
>>>> busybox 1.29.3 Building
> PATH="/home/assaf/work/buildroot/buildroot-2019.02.1/output/host/bin:/home/assaf/work/buildroot/buildroot-2019.02.1/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  " CFLAGS_busybox="" /usr/bin/make  CC="/home/assaf/work/buildroot/buildroot-2019.02.1/output/host/bin/aarch64-linux-gnu_ilp32-gcc" ARCH=arm64 PREFIX="/home/assaf/work/buildroot/buildroot-2019.02.1/output/target" EXTRA_LDFLAGS="" CROSS_COMPILE="/home/assaf/work/buildroot/buildroot-2019.02.1/output/host/bin/aarch64-linux-gnu_ilp32-" CONFIG_PREFIX="/home/assaf/work/buildroot/buildroot-2019.02.1/output/target" SKIP_STRIP=y -C /home/assaf/work/buildroot/buildroot-2019.02.1/output/build/busybox-1.29.3
> make[1]: Entering directory `/home/assaf/work/buildroot/buildroot-2019.02.1/output/build/busybox-1.29.3'
>   CC      applets/applets.o
> In file included from /home/assaf/work/buildroot/buildroot-2019.02.1/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/features.h:452:0,
>                  from /home/assaf/work/buildroot/buildroot-2019.02.1/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
>                  from /home/assaf/work/buildroot/buildroot-2019.02.1/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/limits.h:26,
>                  from /home/hoffman/work/toolchains/gcc-linaro-7.3.1-2018.05-rc1-x86_64_aarch64-linux-gnu_ilp32/lib/gcc/aarch64-linux-gnu_ilp32/7.3.1/include-fixed/limits.h:194,
>                  from /home/hoffman/work/toolchains/gcc-linaro-7.3.1-2018.05-rc1-x86_64_aarch64-linux-gnu_ilp32/lib/gcc/aarch64-linux-gnu_ilp32/7.3.1/include-fixed/syslimits.h:7,
>                  from /home/hoffman/work/toolchains/gcc-linaro-7.3.1-2018.05-rc1-x86_64_aarch64-linux-gnu_ilp32/lib/gcc/aarch64-linux-gnu_ilp32/7.3.1/include-fixed/limits.h:34,
>                  from include/platform.h:153,
>                  from include/libbb.h:13,
>                  from include/busybox.h:8,
>                  from applets/applets.c:9:
> /home/assaf/work/buildroot/buildroot-2019.02.1/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/gnu/stubs.h:8:11: fatal error: gnu/stubs-lp64.h: No such file or directory
> # include <gnu/stubs-lp64.h>
>            ^~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [applets/applets.o] Error 1
> make[1]: *** [applets_dir] Error 2
> make[1]: Leaving directory `/home/assaf/work/buildroot/buildroot-2019.02.1/output/build/busybox-1.29.3'
> make: *** [/home/assaf/work/buildroot/buildroot-2019.02.1/output/build/busybox-1.29.3/.stamp_built] Error 2
> assaf at hoffman-OptiPlex-780:~/work/buildroot/buildroot-2019.02.1$
> 
> 
> ________________________________
> ________________________________
> Assaf Hoffman, Marvell Israel - Staff Field Application Engineer
> 6 Hamada Street
> Mordot HaCarmel Industrial Park
> Yokneam, 2069203, Israel
> Email: hoffman at marvell.com<mailto:hoffman@marvell.com>
> Office:  +972.4.9091203 - OnNet: 704.1203
> Fax:      +972.4.9091501
> Mobile: +972.54.4990584
> Web site: http://www.marvell.com
> 
> This message may contain confidential, proprietary or legally privileged information. The information is intended only for the use of the individual or entity named above. If the reader of this message is not the intended recipient, you are hereby notified that any dissemination, distribution or copying of this communication is strictly prohibited. If you have received this communication in error, please notify us immediately by telephone or by e-mail and delete the message from your computer.
> ________________________________
> ________________________________
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
