From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 19:53:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: add
 BR2_PACKAGE_MTD_UBIHEALTHD option
In-Reply-To: <20210524143715.578572-1-luoxiaobing0926@gmail.com>
References: <20210524143715.578572-1-luoxiaobing0926@gmail.com>
Message-ID: <20210524175324.GL3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xiaobing, All,

On 2021-05-24 14:37 +0000, Xiaobing Luo spake thusly:
> mtd-utils-2.1.2 add ubihealthd daemon
> package/mtd: add BR2_PACKAGE_MTD_UBIHEALTHD option

Spurious repetition of the commit title; I've dropped that.

> Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

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
>  	bool "ubiformat"
>  	default y
>  
> +config BR2_PACKAGE_MTD_UBIHEALTHD
> +	bool "ubihealthd"
> +	default y
> +
>  config BR2_PACKAGE_MTD_UBIMKVOL
>  	bool "ubimkvol"
>  	default y
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index c4fa56d260..121dfa554b 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -96,6 +96,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIATTACH)	+= ubiattach
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBICRC32)		+= ubicrc32
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIDETACH)	+= ubidetach
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIFORMAT)	+= ubiformat
> +MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIHEALTHD)	+= ubihealthd
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIMKVOL)		+= ubimkvol
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBINFO)		+= ubinfo
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_UBINIZE)		+= ubinize
> -- 
> 2.25.1
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
