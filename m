From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Mar 2014 08:09:22 +0100
Subject: [Buildroot] [PATCH 2/6] Remove "dirs" dependencies
In-Reply-To: <1394540278-28740-3-git-send-email-fabio.porcedda@gmail.com>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <53200822.6080409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/14 13:17, Fabio Porcedda wrote:
> The package infrastructure add automatically the "dirs" dependency so
> remove it when the package infrastructure is being used.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  Makefile                 | 2 +-
>  package/uclibc/uclibc.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 665865b..30d56d0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -625,7 +625,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
>  toolchain-eclipse-register:
>  	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
>  
> -source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
> +source: $(TARGETS_SOURCE) $(HOST_SOURCE)
>  
>  external-deps:
>  	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index f0fb53a..020e218 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -542,7 +542,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
>  	$(UCLIBC_INSTALL_UTILS_STAGING)
>  endef
>  
> -uclibc-menuconfig: dirs uclibc-patch
> +uclibc-menuconfig: uclibc-patch
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
