From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Apr 2014 22:18:22 +0200
Subject: [Buildroot] [PATCH 09/20] manual: update the virtual package
 section with the new infrastructure
In-Reply-To: <2f743c8ab39b1af88acc29db154220b0795889f1.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
 <2f743c8ab39b1af88acc29db154220b0795889f1.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <533F138E.3070702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/14 21:27, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  docs/manual/adding-packages-virtual.txt | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
> index 76f5794..e8820a0 100644
> --- a/docs/manual/adding-packages-virtual.txt
> +++ b/docs/manual/adding-packages-virtual.txt
> @@ -1,10 +1,10 @@
>  // -*- mode:doc; -*-
>  // vim: set syntax=asciidoc:
>  
> -[[virtual-package-tutorial]]
> +Infrastructure for virtual packages
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> -Virtual package tutorial
> -~~~~~~~~~~~~~~~~~~~~~~~~
> +[[virtual-package-tutorial]]
>  
>  In Buildroot, a virtual package is a package whose functionalities are
>  provided by one or more packages, referred to as 'providers'. The virtual
> @@ -16,6 +16,9 @@ The implementation of this API is different for the 'Allwinner Tech Sunxi' and
>  the 'Texas Instruments OMAP35xx' plaftorms. So +libgles+ will be a virtual
>  package and +sunxi-mali+ and +ti-gfx+ will be the providers.
>  
> ++virtual-package+ tutorial
> +^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
>  In the following example, we will explain how to add a new virtual package
>  ('something-virtual') and a provider for it ('some-provider').
>  
> @@ -42,7 +45,7 @@ providers.
>  Virtual package's +*.mk+ file
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> -The Makefile +package/something-virtual/something-virtual.mk+ should contain:
> +The +.mk+ for the virtual package should just evaluate the +virtual-package+ macro:
>  
>  ---------------------------
>  01: ################################################################################
> @@ -51,20 +54,11 @@ The Makefile +package/something-virtual/something-virtual.mk+ should contain:
>  04: #
>  05: ################################################################################
>  06:
> -07: SOMETHING_VIRTUAL_SOURCE =
> -08: SOMETHING_VIRTUAL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL))
> -09:
> -10: ifeq ($(BR2_PACKAGE_HAS_SOMETHING_VIRTUAL),y)
> -11: ifeq ($(SOMETHING_VIRTUAL_DEPENDENCIES),)
> -12: $(error No something-virtual implementation selected. Configuration error.)
> -13: endif
> -14: endif
> -15:
> -16: $(eval $(generic-package))
> +07: $(eval $(virtual-package))
>  ---------------------------
>  
> -The Makefile is quite small as it will only check if a provider for the
> -virtual package has been selected.
> +The ability to have target and host packages is also available, with the
> ++host-virtual-package+ macro.
>  
>  Provider's +Config.in+ file
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
