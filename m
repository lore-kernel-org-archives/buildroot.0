From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 3 Jul 2016 10:31:19 +0200
Subject: [Buildroot] [PATCH 05/24 v2] system: systemd only really
 supports a R/W rootfs
In-Reply-To: <bc1119c9b182fbf253680375178dc4642a4ee149.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <bc1119c9b182fbf253680375178dc4642a4ee149.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <174d94b1-dc82-d060-fed9-749daf3214e3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> Supporting a R/O rootfs needs a bit more love to be fully operational.
> This will come in later patches...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  system/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 2d20230..4f9f270 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -94,6 +94,7 @@ config BR2_INIT_SYSTEMD
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
>  	select BR2_ROOTFS_MERGED_USR
>  	select BR2_PACKAGE_SYSTEMD
> +	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
>  
>  comment "systemd needs (e)glibc toolchain, headers >= 3.10"
>  	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
> 
