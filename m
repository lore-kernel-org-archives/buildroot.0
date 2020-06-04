From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 04 Jun 2020 21:41:53 +0300
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Change from FTP to HTTP for
 official releases
In-Reply-To: <20200604182420.37049-1-troglobit@gmail.com>
References: <20200604182420.37049-1-troglobit@gmail.com>
Message-ID: <87sgfa65ce.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joachim,

On Thu, Jun 04 2020, Joachim Nilsson wrote:
> The HTTP URL seems to be more reliable and quicker for download than FTP.
> FTP may also be a blocked protocol on some sites and in CI/CD setups.
>
> Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 1d50e72846..ede14fe234 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -33,7 +33,7 @@ UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
>  UBOOT_SITE_METHOD = svn
>  else
>  # Handle stable official U-Boot versions
> -UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
> +UBOOT_SITE = http://ftp.denx.de/pub/u-boot

This URL redirects to https. Better use https directly.

baruch

>  UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
>  endif

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
