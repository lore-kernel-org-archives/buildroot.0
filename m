From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 12:12:17 +0100
Subject: [Buildroot] [PATCH 1/1] fs/cpio: add zstd as compression option
In-Reply-To: <20210110043831.22754-1-salvador.joseluis@gmail.com>
References: <20210110043831.22754-1-salvador.joseluis@gmail.com>
Message-ID: <20210110111217.GP3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jos?, all,

On 2021-01-10 05:38 +0100, Jos? Luis Salvador Rufo spake thusly:
> U-Boot mkimage zstd is available since v2020.10:
> https://gitlab.denx.de/u-boot/u-boot/-/commit/26073f9ed3ab0aaf3c2a2b433fecb30a95a067d6
> 
> Signed-off-by: Jos? Luis Salvador Rufo <salvador.joseluis@gmail.com>
> ---
>  fs/cpio/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
> index 83a7fa5824..c1151a2881 100644
> --- a/fs/cpio/Config.in
> +++ b/fs/cpio/Config.in
> @@ -51,6 +51,11 @@ config BR2_TARGET_ROOTFS_CPIO_XZ
>  	help
>  	  Do compress the cpio filesystem with xz.
>  
> +config BR2_TARGET_ROOTFS_CPIO_ZSTD
> +	bool "zstd"
> +	help
> +	  Do compress the cpio filesystem with zstd.

How is that expected to work? We do not have zstd support in the fs
infra: https://git.buildroot.org/buildroot/tree/fs/common.mk#n126

Regards,
Yann E. MORIN.

>  endchoice
>  
>  config BR2_TARGET_ROOTFS_CPIO_UIMAGE
> -- 
> 2.30.0
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
