From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 7 Jun 2021 16:53:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: add
 BR2_PACKAGE_MTD_UBIHEALTHD option
In-Reply-To: <20210524143715.578572-1-luoxiaobing0926@gmail.com>
References: <20210524143715.578572-1-luoxiaobing0926@gmail.com>
Message-ID: <CAEyMn7ajLEagr6Rb04aKa=a8KKFr6w6mUKCj3yn5Azequos0Tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xiabing,


Am Mo., 24. Mai 2021 um 16:37 Uhr schrieb Xiaobing Luo
<luoxiaobing0926@gmail.com>:
>
> mtd-utils-2.1.2 add ubihealthd daemon
> package/mtd: add BR2_PACKAGE_MTD_UBIHEALTHD option
>
> Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
> ---
>  package/mtd/Config.in | 4 ++++
>  package/mtd/mtd.mk    | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index 590ca7f5ef..c7ad3b3cdc 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -137,6 +137,10 @@ config BR2_PACKAGE_MTD_UBIFORMAT
>         bool "ubiformat"
>         default y
>
> +config BR2_PACKAGE_MTD_UBIHEALTHD
> +       bool "ubihealthd"
> +       default y
> +
>  config BR2_PACKAGE_MTD_UBIMKVOL
>         bool "ubimkvol"
>         default y
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index c4fa56d260..121dfa554b 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -96,6 +96,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIATTACH)      += ubiattach
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBICRC32)                += ubicrc32
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIDETACH)       += ubidetach
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIFORMAT)       += ubiformat
> +MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIHEALTHD)      += ubihealthd

While testing the next branch I faced an issue with your change:

/usr/bin/install: cannot stat
'/home/hthiery/br-test-pkg/bootlin-armv5-uclibc/build/mtd-2.1.2/ubihealthd':
No such file or directory

This can easily reproduced by test-pkg:
# utils/test-pkg -p mtd
                    bootlin-armv5-uclibc [1/6]: FAILED
                     bootlin-armv7-glibc [2/6]: FAILED
                   bootlin-armv7m-uclibc [3/6]: FAILED
                     bootlin-x86-64-musl [4/6]: FAILED
                      br-arm-full-static [5/6]: FAILED
                            sourcery-arm [6/6]: FAILED
6 builds, 0 skipped, 6 build failed, 0 legal-info failed

Could you take a look at this?

-- 
Heiko

>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIMKVOL)                += ubimkvol
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBINFO)          += ubinfo
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBINIZE)         += ubinize
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
