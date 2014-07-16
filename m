From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Jul 2014 06:26:21 +0300
Subject: [Buildroot] [PATCH 3/5 v2] package/wget: use the new gettextize
	infra
In-Reply-To: <657e13ef2a1fa4267bc736842e99757364d735cd.1405463657.git.yann.morin.1998@free.fr>
References: <cover.1405463657.git.yann.morin.1998@free.fr>
 <657e13ef2a1fa4267bc736842e99757364d735cd.1405463657.git.yann.morin.1998@free.fr>
Message-ID: <20140716032621.GH2138@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Jul 16, 2014 at 12:37:22AM +0200, Yann E. MORIN wrote:
> Use the new gettextize infra we just added gettextize wget.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/wget/wget.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index 56ccfb5..b6a22b1 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -15,11 +15,7 @@ WGET_AUTORECONF = YES
>  
>  # Ugly kludge to fix autoreconf with old gettext infra
>  # We need to gettextize before autoreconf to upgrade

This comment can also be removed now, I believe.

baruch

> -WGET_DEPENDENCIES += host-gettext
> -define WGET_GETTEXTIZE
> -	cd $(@D) ; $(HOST_DIR)/usr/bin/gettextize -f
> -endef
> -WGET_PRE_CONFIGURE_HOOKS += WGET_GETTEXTIZE
> +WGET_GETTEXTIZE = YES
>  
>  # Prefer full-blown wget over busybox
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
