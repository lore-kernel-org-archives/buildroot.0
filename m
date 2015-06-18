From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Jun 2015 17:58:34 +0200
Subject: [Buildroot] [PATCH 1/1] package: indentation cleanup
In-Reply-To: <1434607821-10560-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1434607821-10560-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <5582EAAA.2050902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/18/15 08:10, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Verified that it's whitespace-only and that the fixes are correct.

 Regards,
 Arnout

> ---
>  package/ejabberd/ejabberd.mk   | 2 +-
>  package/libxmlrpc/libxmlrpc.mk | 2 +-
>  package/odhcp6c/odhcp6c.mk     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
> index 07ce78e..650dc0e 100644
> --- a/package/ejabberd/ejabberd.mk
> +++ b/package/ejabberd/ejabberd.mk
> @@ -40,7 +40,7 @@ endef
>  EJABBERD_POST_INSTALL_TARGET_HOOKS += EJABBERD_FIX_EJABBERDCTL
>  
>  define EJABBERD_USERS
> -ejabberd -1 ejabberd -1 * /var/lib/ejabberd /bin/sh - ejabberd daemon
> +	ejabberd -1 ejabberd -1 * /var/lib/ejabberd /bin/sh - ejabberd daemon
>  endef
>  
>  define EJABBERD_INSTALL_INIT_SYSV
> diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
> index c3788d6..7d11205 100644
> --- a/package/libxmlrpc/libxmlrpc.mk
> +++ b/package/libxmlrpc/libxmlrpc.mk
> @@ -16,7 +16,7 @@ LIBXMLRPC_MAKE = $(MAKE1)
>  
>  # Using autoconf, not automake, so we cannot use AUTORECONF = YES.
>  define LIBXMLRPC_RUN_AUTOCONF
> -       cd $(@D); $(HOST_DIR)/usr/bin/autoconf
> +	cd $(@D); $(HOST_DIR)/usr/bin/autoconf
>  endef
>  
>  LIBXMLRPC_PRE_CONFIGURE_HOOKS += LIBXMLRPC_RUN_AUTOCONF
> diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
> index 8102c26..47944f1 100644
> --- a/package/odhcp6c/odhcp6c.mk
> +++ b/package/odhcp6c/odhcp6c.mk
> @@ -10,7 +10,7 @@ ODHCP6C_LICENSE = GPLv2
>  ODHCP6C_LICENSE_FILES = COPYING
>  
>  define ODHCP6C_INSTALL_SCRIPT
> -        $(INSTALL) -m 0755 -D $(@D)/odhcp6c-example-script.sh \
> +	$(INSTALL) -m 0755 -D $(@D)/odhcp6c-example-script.sh \
>  		$(TARGET_DIR)/usr/sbin/odhcp6c-update
>  endef
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
