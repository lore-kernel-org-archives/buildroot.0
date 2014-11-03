From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Nov 2014 22:02:54 +0100
Subject: [Buildroot] [PATCH 3/6] package/*/*.mk: Fix indent
In-Reply-To: <1414971595-9972-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414971595-9972-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414971595-9972-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <5457ED7E.7070705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/14 00:39, Maxime Hadjinlian wrote:
> Change LIBFOO_PERMISSIONS everywhere to be a space-separated list.
> As nothing was specified in the manual but all our lists are space
> separated, there is no reason that this one should be made an exception.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/busybox/busybox.mk | 4 ++--
>  package/nginx/nginx.mk     | 2 +-
>  package/sudo/sudo.mk       | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 0ceaab1..b320aed 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -50,8 +50,8 @@ BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
>  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
>  
>  define BUSYBOX_PERMISSIONS
> -	/bin/busybox			 f 4755	0 0 - - - - -
> -	/usr/share/udhcpc/default.script f 755  0 0 - - - - -
> +	/bin/busybox f 4755 0 0 - - - - -
> +	/usr/share/udhcpc/default.script f 755 0 0 - - - - -

 I don't like this change - the alignment really helps a lot in this case.

 However, it should be based on spaces, not tabs. tabwidth may be different for
different people so tabs are not suitable for alignment.


 The rest of the patch looks OK to me.


 Regards,
 Arnout


>  endef
>  
>  # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 5a65c52..55ae844 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -25,7 +25,7 @@ NGINX_CONF_OPTS = \
>  # So, we just need to create the directories used by nginx with the right
>  # ownership.
>  define NGINX_PERMISSIONS
> -	/var/lib/nginx	d	755	33	33	-	-	-	-	-
> +	/var/lib/nginx d 755 33 33 - - - - -
>  endef
>  
>  # disable external libatomic_ops because its detection fails.
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 283a40c..61635ec 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -29,7 +29,7 @@ endef
>  SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
>  
>  define SUDO_PERMISSIONS
> -	/usr/bin/sudo			 f 4755	0 0 - - - - -
> +	/usr/bin/sudo f 4755 0 0 - - - - -
>  endef
>  
>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
