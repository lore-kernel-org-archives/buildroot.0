From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Aug 2015 22:45:46 +0200
Subject: [Buildroot] [PATCH 4/4 v2] package/linux-fusion: slight
 simplification
In-Reply-To: <96204099417c101327b357870e89386fe1757931.1440434894.git.yann.morin.1998@free.fr>
References: <cover.1440434894.git.yann.morin.1998@free.fr>
 <96204099417c101327b357870e89386fe1757931.1440434894.git.yann.morin.1998@free.fr>
Message-ID: <55DB827A.6070001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/2015 06:50 PM, Yann E. MORIN wrote:
> Using an intermediate variable to "store" LINUX_VERSION_PROBED is
> un-ncessary, because They are both recursively-expanded variables, and
  unnecessary          they

> the `make kernel-version` code will anyway be used in both places it is
> needed; storing in an intermediate variable will not make that a single
> expansion of the sub-shell.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/linux-fusion/linux-fusion.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
> index 21b6e42..5f9e44e 100644
> --- a/package/linux-fusion/linux-fusion.mk
> +++ b/package/linux-fusion/linux-fusion.mk
> @@ -17,17 +17,16 @@ ifeq ($(BR2_PACKAGE_LINUX_FUSION),y)
>  LINUX_NEEDS_MODULES = y
>  endif
>  
> -LINUX_FOR_FUSION = $(LINUX_VERSION_PROBED)
>  LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
>  
> -LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_FOR_FUSION)
> +LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_VERSION_PROBED)
>  LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX_DIR)
>  LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX_DIR)
>  
>  LINUX_FUSION_MAKE_OPTS += SYSROOT=$(TARGET_DIR)
>  LINUX_FUSION_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
>  LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
> -LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)/kernel
> +LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_VERSION_PROBED)/kernel
>  
>  define LINUX_FUSION_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
