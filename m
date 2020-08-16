From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2020 22:43:04 +0200
Subject: [Buildroot] [PATCH 1/1] Revert "package/libnss: enable parallel
 building"
In-Reply-To: <20200816183125.1387426-1-fontaine.fabrice@gmail.com>
References: <20200816183125.1387426-1-fontaine.fabrice@gmail.com>
Message-ID: <20200816204304.GD24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-08-16 20:31 +0200, Fabrice Fontaine spake thusly:
> This reverts commit 31602d8aaabaa9f55048c3db7a1b1b2fb2d27ef2 as it seems
> that libnss still have parallel build issues.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/521aaf8b41686865ea86688ea6410418b422fd55
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnss/libnss.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index a5e4432f8c..b4bb09364c 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -69,12 +69,12 @@ endif
>  endif
>  
>  define LIBNSS_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss coreconf \
>  		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  		CHECKLOC= \
>  		$(LIBNSS_BUILD_VARS)
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
>  		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  		CHECKLOC= \
> @@ -127,12 +127,12 @@ HOST_LIBNSS_BUILD_VARS += USE_64=1
>  endif
>  
>  define HOST_LIBNSS_BUILD_CMDS
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
> +	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss coreconf \
>  		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  		CHECKLOC= \
>  		$(HOST_LIBNSS_BUILD_VARS)
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
> +	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
>  		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  		CHECKLOC= \
> -- 
> 2.27.0
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
