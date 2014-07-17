From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Jul 2014 01:23:16 +0200
Subject: [Buildroot] [PATCH 1 of 3 v2] uclibc: rename SETUP_DOT_CONFIG
	to FIXUP_DOT_CONFIG
In-Reply-To: <9634175cf29d7c48d2a6.1405449815@localhost>
References: <patchbomb.1405449814@localhost>
 <9634175cf29d7c48d2a6.1405449815@localhost>
Message-ID: <53C85AE4.2000205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/07/14 20:43, Thomas De Schampheleire wrote:
> In a subsequent patch, the behavior of UCLIBC_SETUP_DOT_CONFIG will change
> so that it only applies fixups to the (already copied) configuration file.
> This patch renames this function to UCLIBC_FIXUP_DOT_CONFIG to better match
> the future behavior.
> 
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> ---
> v2: update commit message (ThomasP)
> 
>  package/uclibc/uclibc.mk |  4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff -r c7afd4612342 -r 9634175cf29d package/uclibc/uclibc.mk
> --- a/package/uclibc/uclibc.mk	Tue Jul 01 19:39:16 2014 +0200
> +++ b/package/uclibc/uclibc.mk	Wed Jul 02 21:31:07 2014 +0200
> @@ -393,7 +393,7 @@
>  	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
>  	HOSTCC="$(HOSTCC)"
>  
> -define UCLIBC_SETUP_DOT_CONFIG
> +define UCLIBC_FIXUP_DOT_CONFIG
>  	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
>  	$(call KCONFIG_SET_OPT,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D)/.config)
>  	$(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH),$(@D)/.config)
> @@ -433,7 +433,7 @@
>  endef
>  
>  define UCLIBC_CONFIGURE_CMDS
> -	$(UCLIBC_SETUP_DOT_CONFIG)
> +	$(UCLIBC_FIXUP_DOT_CONFIG)
>  	$(MAKE1) -C $(UCLIBC_DIR) \
>  		$(UCLIBC_MAKE_FLAGS) \
>  		PREFIX=$(STAGING_DIR) \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
