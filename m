From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Mar 2021 21:51:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.16.2
In-Reply-To: <20210329184934.14690-1-petr.vorel@gmail.com>
References: <20210329184934.14690-1-petr.vorel@gmail.com>
Message-ID: <20210330195156.GA24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2021-03-29 20:49 +0200, Petr Vorel spake thusly:
> It requires libqmi >= 1.28.0
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

> ---
> Hi,
> 
> RFC: should I add also --enable-plugin-qcom-soc ?
> (there is qcom-db410c-firmware package)

Maybe you could enable the plugin if the package is enabled:

    ifeq ($(BR2_PACKAGE_QCOM_DB410_FIRMWARE),y)
    MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc
    else
    MODEM_MANAGER_CONF_OPTS += --disable-plugin-qcom-soc
    endif

Regards,
Yann E. MORIN.

> Kind regards,
> Petr
> 
> Tested:
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed
> 
>                              andes-nds32 [ 1/45]: FAILED
>                              arm-aarch64 [ 2/45]: OK
>                    bootlin-aarch64-glibc [ 3/45]: OK
>                bootlin-arcle-hs38-uclibc [ 4/45]: OK
>                     bootlin-armv5-uclibc [ 5/45]: OK
>                      bootlin-armv7-glibc [ 6/45]: OK
>                    bootlin-armv7m-uclibc [ 7/45]: SKIPPED
>                       bootlin-armv7-musl [ 8/45]: OK
>              bootlin-microblazeel-uclibc [ 9/45]: OK
>                    bootlin-mipsel-uclibc [10/45]: OK
>                 bootlin-mipsel32r6-glibc [11/45]: OK
>                 bootlin-m68k-5208-uclibc [12/45]: SKIPPED
>                bootlin-m68k-68040-uclibc [13/45]: OK
>                      bootlin-nios2-glibc [14/45]: OK
>                  bootlin-openrisc-uclibc [15/45]: OK
>            bootlin-powerpc-e500mc-uclibc [16/45]: OK
>         bootlin-powerpc64le-power8-glibc [17/45]: OK
>                    bootlin-riscv32-glibc [18/45]: OK
>                    bootlin-riscv64-glibc [19/45]: OK
>                     bootlin-riscv64-musl [20/45]: OK
>                       bootlin-sh4-uclibc [21/45]: OK
>                     bootlin-sparc-uclibc [22/45]: OK
>                    bootlin-sparc64-glibc [23/45]: OK
>                    bootlin-xtensa-uclibc [24/45]: OK
>                     bootlin-x86-64-glibc [25/45]: OK
>                      bootlin-x86-64-musl [26/45]: OK
>                    bootlin-x86-64-uclibc [27/45]: OK
>                             br-arm-basic [28/45]: SKIPPED
>                     br-arm-full-nothread [29/45]: SKIPPED
>                       br-arm-full-static [30/45]: OK
>                 br-i386-pentium-mmx-musl [31/45]: OK
>                    br-i386-pentium4-full [32/45]: OK
>                       br-mips64-n64-full [33/45]: OK
>                  br-mips64r6-el-hf-glibc [34/45]: OK
>                br-powerpc-603e-basic-cpp [35/45]: SKIPPED
>                br-powerpc64-power7-glibc [36/45]: OK
>                        linaro-aarch64-be [37/45]: OK
>                           linaro-aarch64 [38/45]: OK
>                               linaro-arm [39/45]: OK
>                      sourcery-arm-armv4t [40/45]: OK
>                             sourcery-arm [41/45]: OK
>                      sourcery-arm-thumb2 [42/45]: OK
>                            sourcery-mips [43/45]: OK
>                          sourcery-mips64 [44/45]: OK
>                           sourcery-nios2 [45/45]: OK
> 
>  package/modem-manager/modem-manager.hash | 2 +-
>  package/modem-manager/modem-manager.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index 81a08295f7..3f272acef3 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  fe1a26ba51b4bda7abd09ad4dadedd87d8b8154809fc9d88e94f75fdfff19295  ModemManager-1.14.8.tar.xz
> +sha256  efa9a963499e0885f3f163096d433334143c4937545134ecd682e0157fa591e3  ModemManager-1.16.2.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 47d4eed823..2cc45d266b 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MODEM_MANAGER_VERSION = 1.14.8
> +MODEM_MANAGER_VERSION = 1.16.2
>  MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
