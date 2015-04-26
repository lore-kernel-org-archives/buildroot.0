From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Apr 2015 12:27:55 +0300
Subject: [Buildroot] [PATCH 1/2] package/ccache: bump to version 3.2.1
In-Reply-To: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
References: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150426092755.GJ2258@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Karoly,
On Sun, Apr 26, 2015 at 11:21:01AM +0200, Karoly Kasza wrote:
> @@ -19,7 +19,7 @@ CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
>  # to use HOSTCC_NOCCACHE as the compiler. Instead, we take the easy
>  # path: tell ccache to use its internal copy of zlib, so that ccache
>  # has zero dependency besides the C library.
> -HOST_CCACHE_CONF_OPTS += ccache_cv_zlib_1_2_3=no
> +HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
>  
>  # Patch host-ccache as follows:
>  #  - Use BR_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
> @@ -34,11 +34,11 @@ HOST_CCACHE_CONF_OPTS += ccache_cv_zlib_1_2_3=no
>  #    the need to specify BR_CACHE_DIR when invoking ccache directly.
>  define HOST_CCACHE_PATCH_CONFIGURATION
>  	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
> -	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
> -	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/ccache.c
> +	sed -i 's,conf->compiler_check = x_strdup("mtime"),conf->compiler_check = x_strdup("none"),' $(@D)/conf.c
> +	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
>  endef

You are doing non trivial changes here and above. Please explain in a commit 
log what you are doing, and why this is needed as part of the version bump.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
