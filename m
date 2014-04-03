From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Apr 2014 23:45:05 +0200
Subject: [Buildroot] [PATCH 07/11] fmtools: Switch to 2.x series
In-Reply-To: <1396558881-29631-7-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-7-git-send-email-paul@crapouillou.net>
Message-ID: <20140403214504.GG17328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, Maarten, All,

On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
> From: Maarten ter Huurne <maarten@treewalker.org>
> 
> Specifically, bump version to 2.0.1.
> The 2.x series uses the V4L2 API instead of V4L.
> 
> Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
> Acked-By: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

v4l2 dates back to the 2.5.x Linux kernel, so it does not need to depend
on the _AT_LEAST_XXX headers. Heck, today, virtually all toolchains
available are made with headers at least 2.6.18, and we certainly never
support older toolchains anyway...

Regards,
Yann E. MORIN.

> ---
>  package/fmtools/Config.in  |  4 ++--
>  package/fmtools/fmtools.mk | 15 +++------------
>  2 files changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/package/fmtools/Config.in b/package/fmtools/Config.in
> index 1591618..182b517 100644
> --- a/package/fmtools/Config.in
> +++ b/package/fmtools/Config.in
> @@ -2,8 +2,8 @@ config BR2_PACKAGE_FMTOOLS
>  	bool "fmtools"
>  	help
>  	  fmtools is a pair of simple command-line utilities for
> -	  "video4linux" radio tuner cards under Linux. It includes
> +	  "video4linux2" radio tuner cards under Linux. It includes
>  	  fm for power control, tuning, and volume and fmscan for
>  	  scanning for stations.
>  
> -	  http://www.stanford.edu/~blp/fmtools/
> +	  http://benpfaff.org/fmtools/
> diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
> index 5f305b9..bacd73c 100644
> --- a/package/fmtools/fmtools.mk
> +++ b/package/fmtools/fmtools.mk
> @@ -4,18 +4,9 @@
>  #
>  ################################################################################
>  
> -FMTOOLS_VERSION = 1.0.2
> -FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
> +FMTOOLS_VERSION = 2.0.1
> +FMTOOLS_SITE = http://benpfaff.org/fmtools
>  FMTOOLS_LICENSE = GPLv2+
>  FMTOOLS_LICENSE_FILES = COPYING
>  
> -define FMTOOLS_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> -endef
> -
> -define FMTOOLS_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/fm $(TARGET_DIR)/usr/sbin/fm
> -	$(INSTALL) -D -m 0755 $(@D)/fmscan $(TARGET_DIR)/usr/sbin/fmscan
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(autotools-package))
> -- 
> 1.9.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
