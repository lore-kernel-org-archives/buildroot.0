From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Jul 2014 06:26:23 +0300
Subject: [Buildroot] [PATCH 3/3] wget: remove redundant gettextize run
In-Reply-To: <1405186024-8170-3-git-send-email-gustavo@zacarias.com.ar>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
 <1405186024-8170-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140713032623.GA2138@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Sat, Jul 12, 2014 at 02:27:04PM -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Please explain in the commit log that gettextize now runs unconditionally when 
enabling AUTORECONF.

baruch

> ---
>  package/wget/wget.mk | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index 56ccfb5..c546aba 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -13,14 +13,6 @@ WGET_LICENSE_FILES = COPYING
>  # patching gnulib .m4 file
>  WGET_AUTORECONF = YES
>  
> -# Ugly kludge to fix autoreconf with old gettext infra
> -# We need to gettextize before autoreconf to upgrade
> -WGET_DEPENDENCIES += host-gettext
> -define WGET_GETTEXTIZE
> -	cd $(@D) ; $(HOST_DIR)/usr/bin/gettextize -f
> -endef
> -WGET_PRE_CONFIGURE_HOOKS += WGET_GETTEXTIZE
> -
>  # Prefer full-blown wget over busybox
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  	WGET_DEPENDENCIES += busybox

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
