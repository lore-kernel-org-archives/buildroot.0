From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jun 2015 01:04:28 +0200
Subject: [Buildroot] [PATCH 08/11 v2] package/on2-8170-modules: use
 kernel-module helper
In-Reply-To: <a0a6da880beb6b888e98944f68388c3049093797.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <a0a6da880beb6b888e98944f68388c3049093797.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <557A13FC.3020008@mind.be>
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
>  package/on2-8170-modules/on2-8170-modules.mk | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
> index 209bcb5..b40ed86 100644
> --- a/package/on2-8170-modules/on2-8170-modules.mk
> +++ b/package/on2-8170-modules/on2-8170-modules.mk
> @@ -7,17 +7,8 @@
>  ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
>  ON2_8170_MODULES_SITE = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
>  
> -ON2_8170_MODULES_DEPENDENCIES = linux
> -
>  ON2_8170_MODULES_LICENSE = GPLv2+
>  #There is no license file
>  
> -define ON2_8170_MODULES_BUILD_CMDS
> -	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D)
> -endef
> -
> -define ON2_8170_MODULES_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) modules_install
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
