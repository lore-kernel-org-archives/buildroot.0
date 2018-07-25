From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Jul 2018 17:46:59 +0300
Subject: [Buildroot] [PATCH 1/2] package/lvm2: bump version to 2.02.180
In-Reply-To: <20180725123703.12826-1-m.niestroj@grinn-global.com>
References: <20180725123703.12826-1-m.niestroj@grinn-global.com>
Message-ID: <20180725144659.quiepysrnblfmd3b@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcin,

On Wed, Jul 25, 2018 at 02:37:02PM +0200, Marcin Niestroj wrote:
> lvm2 starting from version 2.02.178 depends on libaio library.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/lvm2/Config.in | 3 +++
>  package/lvm2/lvm2.hash | 4 ++--
>  package/lvm2/lvm2.mk   | 6 +++---
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
> index 0dd6d53b4a..5f706982cd 100644
> --- a/package/lvm2/Config.in
> +++ b/package/lvm2/Config.in
> @@ -1,8 +1,10 @@
>  config BR2_PACKAGE_LVM2
>  	bool "lvm2 & device mapper"
> +	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS

This new dependency needs to be added to all lvm2 reverse dependencies, i.e., 
packages that select BR2_PACKAGE_LVM2, as well as their reverse dependencies.

>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # needs fork()
>  	depends on !BR2_STATIC_LIBS # It fails to build statically
> +	select BR2_PACKAGE_LIBAIO
>  	help
>  	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
>  	  LVM supports enterprise level volume management of disk and
> @@ -50,4 +52,5 @@ endif
>  
>  comment "lvm2 needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
>  	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
