From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jun 2015 01:13:37 +0200
Subject: [Buildroot] [PATCH 10/11 v2] package/simicsfs: use
 kernel-module helper
In-Reply-To: <ff85140be2f26f97ede134f21af7ce98d91d6ce1.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <ff85140be2f26f97ede134f21af7ce98d91d6ce1.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <557A1621.6040107@mind.be>
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
>  package/simicsfs/simicsfs.mk | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
> index 51987c5..91ed413 100644
> --- a/package/simicsfs/simicsfs.mk
> +++ b/package/simicsfs/simicsfs.mk
> @@ -8,14 +8,6 @@ SIMICSFS_VERSION = 1.18
>  SIMICSFS_SITE = http://download.simics.net/pub
>  SIMICSFS_LICENSE = GPLv2+
>  SIMICSFS_LICENSE_FILES = hostfs.h
> -SIMICSFS_DEPENDENCIES = linux
> -
> -define SIMICSFS_BUILD_CMDS
> -	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
> -endef
> -
> -define SIMICSFS_INSTALL_TARGET_CMDS
> -	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
> -endef
>  
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
