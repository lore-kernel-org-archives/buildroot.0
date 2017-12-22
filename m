From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Dec 2017 14:38:06 +0100
Subject: [Buildroot] [PATCH 1/2] cryptsetup: bump to version 2.0.0
In-Reply-To: <81e71fbdb42aa4e00f16de0225eb5a0b6b17a79d.1513944202.git.baruch@tkos.co.il>
References: <81e71fbdb42aa4e00f16de0225eb5a0b6b17a79d.1513944202.git.baruch@tkos.co.il>
Message-ID: <20171222143806.0d98a845@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Dec 2017 14:03:21 +0200, Baruch Siach wrote:
> Add the now mandatory json-c depencecy. Propagate to reverse

dependency


> diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
> index d24f7b0af6c7..dcf56f1e405d 100644
> --- a/package/cryptsetup/Config.in
> +++ b/package/cryptsetup/Config.in
> @@ -3,10 +3,12 @@ config BR2_PACKAGE_CRYPTSETUP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
>  	depends on BR2_USE_MMU # lvm2
>  	depends on !BR2_STATIC_LIBS # lvm2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c

You forgot to propagate to the Config.in comment.


> diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
> index 62e1f3e42f5b..dec132ddd3e0 100644
> --- a/package/luksmeta/Config.in
> +++ b/package/luksmeta/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LUKSMETA
>  	depends on BR2_USE_MMU # cryptsetup -> lvm2
>  	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
>  	depends on !BR2_TOOLCHAIN_USES_MUSL # cryptsetup -> lvm2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c

Ditto.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
