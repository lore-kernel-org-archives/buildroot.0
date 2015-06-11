From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jun 2015 00:44:58 +0200
Subject: [Buildroot] [PATCH 03/11 v2] package/lttng-modules: use
 kernel-module helper
In-Reply-To: <3df79bd7cb56afe371617a6cf8c028db13cc91e5.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <3df79bd7cb56afe371617a6cf8c028db13cc91e5.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <557A0F6A.3060109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/15 21:22, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/lttng-modules/lttng-modules.mk | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
> index 6833ad2..30c581e 100644
> --- a/package/lttng-modules/lttng-modules.mk
> +++ b/package/lttng-modules/lttng-modules.mk
> @@ -10,14 +10,5 @@ LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
>  LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
>  LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
>  
> -LTTNG_MODULES_DEPENDENCIES = linux
> -
> -define LTTNG_MODULES_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
> -endef
> -
> -define LTTNG_MODULES_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) modules_install
> -endef
> -
> +$(eval $(kernel-module))
>  $(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
