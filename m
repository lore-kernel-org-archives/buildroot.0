From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 26 Jun 2015 10:17:32 +0200
Subject: [Buildroot] [PATCH 31/51] sunxi-mali: bump version
In-Reply-To: <20141101233620.7d89911f@free-electrons.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-31-git-send-email-maxime.hadjinlian@gmail.com>
 <20141101233620.7d89911f@free-electrons.com>
Message-ID: <CAB0FRss0hkQT-Q32GCb=k-pSvAqXhim7U7BXuYfH4mtxN75uNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-11-01 23:36 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Maxime Hadjinlian,
>
> On Sun, 26 Oct 2014 19:45:37 +0100, Maxime Hadjinlian wrote:
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>  package/sunxi-mali/sunxi-mali.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
>> index c6900c8..5e2e78c 100644
>> --- a/package/sunxi-mali/sunxi-mali.mk
>> +++ b/package/sunxi-mali/sunxi-mali.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -SUNXI_MALI_VERSION = c2491fe952354ba44538064e534ed7c731cedb1e
>> +SUNXI_MALI_VERSION = d343311efc8db166d8371b28494f0f27b6a58724
>>  SUNXI_MALI_SITE = $(call github,linux-sunxi,sunxi-mali,$(SUNXI_MALI_VERSION))
>>
>>  SUNXI_MALI_INSTALL_STAGING = YES
>
> This breaks the build of sunxi-mali:
>
> make[2]: entrant dans le r?pertoire ? /home/thomas/projets/buildroot/output/build/sunxi-mali-d343311efc8db166d8371b28494f0f27b6a58724/test ?
> /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -lm -ldl -lpthread -o test test.c -lEGL -lGLESv2
> /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.9.2/../../../../arm-linux-gnueabihf/bin/ld: warning: libUMP.so.3, needed by /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libEGL.so, not found (try using -rpath or -rpath-link)
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libEGL.so: undefined reference to `ump_close'
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libEGL.so: undefined reference to `ump_mapped_pointer_get'
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libEGL.so: undefined reference to `ump_secure_id_get'
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libEGL.so: undefined reference to `ump_mapped_pointer_release'
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libEGL.so: undefined reference to `ump_reference_add'
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libEGL.so: undefined reference to `ump_size_get'
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libEGL.so: undefined reference to `ump_reference_release'
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libEGL.so: undefined reference to `ump_open'
> collect2: error: ld returned 1 exit status
> make[2]: *** [test] Erreur 1
> make[2]: quittant le r?pertoire ? /home/thomas/projets/buildroot/output/build/sunxi-mali-d343311efc8db166d8371b28494f0f27b6a58724/test ?
> make[1]: *** [test] Erreur 2
> make[1]: quittant le r?pertoire ? /home/thomas/projets/buildroot/output/build/sunxi-mali-d343311efc8db166d8371b28494f0f27b6a58724 ?
> make: *** [/home/thomas/projets/buildroot/output/build/sunxi-mali-d343311efc8db166d8371b28494f0f27b6a58724/.stamp_staging_installed] Erreur 2
>
> Tested with the following defconfig:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_EABIHF=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_SUNXI_TOOLS=y
> BR2_PACKAGE_SUNXI_MALI=y
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_PACKAGE_HOST_SUNXI_TOOLS=y
>
> With your sunxi-mali, sunxi-mali-prop and sunxi-tools bump patches
> applied.
>
> Can you have a look?
>

Solved by http://patchwork.ozlabs.org/patch/488638/

Fran?ois

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
