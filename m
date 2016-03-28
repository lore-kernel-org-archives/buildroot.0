From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 28 Mar 2016 18:31:24 +0200
Subject: [Buildroot] [PATCH 2/9 v2] linux: split overly-long dependency
 line for readability
In-Reply-To: <f410ef211f2fbdb6146e0492172311aa90a3e609.1457721607.git.yann.morin.1998@free.fr>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
 <f410ef211f2fbdb6146e0492172311aa90a3e609.1457721607.git.yann.morin.1998@free.fr>
Message-ID: <56F95C5C.3030109@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 11/03/2016 19:41, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> This is going to be useful to better understand the initramfs patch
> coming next.
> ---
>  linux/linux.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7e20255..ea90918 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -439,7 +439,10 @@ $(eval $(kconfig-package))
>  
>  # Support for rebuilding the kernel after the cpio archive has
>  # been generated in $(BINARIES_DIR)/rootfs.cpio.
> -$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
> +$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed
> +$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_images_installed
> +$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(BINARIES_DIR)/rootfs.cpio
> +$(LINUX_DIR)/.stamp_initramfs_rebuilt:

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  	@$(call MESSAGE,"Rebuilding kernel with initramfs")
>  	# Build the kernel.
>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
> 
