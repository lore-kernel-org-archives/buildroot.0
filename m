From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 23 May 2014 00:30:55 +0200
Subject: [Buildroot] [PATCH 2 of 2] fs/tar: use qstrip to clean up build
 output
In-Reply-To: <cda34eac2826e87dffc2.1400762141@argentina>
References: <patchbomb.1400762139@argentina>
 <cda34eac2826e87dffc2.1400762141@argentina>
Message-ID: <537E7A9F.4050207@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 22/05/2014 14:35, Thomas De Schampheleire a ?crit :
> When using the tar filesystem method, the build output shows at the end:
> 
> echo " tar -c""f <br>/output/images/rootfs.tar -C <br>/output/target ." >>
>                                     <br>/output/build/_fakeroot.fs
> 
> The inner set of quotes can be easily removed by properly stripping the tar
> options (coming from the buildroot configuration).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Romain Naour <romain.naour@openwide.fr>

Thanks
Romain

> 
> ---
>  fs/tar/tar.mk |  2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
> --- a/fs/tar/tar.mk
> +++ b/fs/tar/tar.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TAR_OPTS := $(BR2_TARGET_ROOTFS_TAR_OPTIONS)
> +TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
>  
>  define ROOTFS_TAR_CMD
>   tar -c$(TAR_OPTS)f $@ -C $(TARGET_DIR) .
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
