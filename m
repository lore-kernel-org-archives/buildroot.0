From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2013 08:07:47 +0200
Subject: [Buildroot] [PATCH] busybox: don't disable static option
In-Reply-To: <516BC3BC.5040100@fh-kl.de>
References: <516BC3BC.5040100@fh-kl.de>
Message-ID: <516E3C33.6050505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/04/13 11:09, Patrick Ziegler wrote:
> Don't change the busybox STATIC option if buildroots PREFER_STATIC_LIB option
> is not set. Not to prefer static linking doesn't imply prefer dynamic linking
> for all packages.
>
> Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/busybox/busybox.mk |    4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 900896f..985203c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -106,10 +106,6 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
>   define BUSYBOX_PREFER_STATIC
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(BUSYBOX_BUILD_CONFIG))
>   endef
> -else
> -define BUSYBOX_PREFER_STATIC
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_STATIC,$(BUSYBOX_BUILD_CONFIG))
> -endef
>   endif
>
>   # Disable usage of inetd if netkit-base package is selected
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
