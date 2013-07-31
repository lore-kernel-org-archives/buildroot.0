From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 17:04:28 +0200
Subject: [Buildroot] [PATCH] Fix building initramfs kernel with appended
 dtb
In-Reply-To: <1375281113-18893-1-git-send-email-nford@westpond.com>
References: <1375281113-18893-1-git-send-email-nford@westpond.com>
Message-ID: <20130731170428.102c93a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathan Ford,

Humm, yes, maybe, but would it be possible to get a slightly more
verbose commit log that explains what is the problem and how you're
fixing it?

Thanks!

On Wed, 31 Jul 2013 10:31:53 -0400, Nathan Ford wrote:
> 
> Signed-off-by: Nathan Ford <nford@westpond.com>
> ---
>  linux/linux.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 17e9838..9d29d9d 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -311,7 +311,8 @@ endif
>  $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
>  	@$(call MESSAGE,"Rebuilding kernel with initramfs")
>  	# Build the kernel.
> -	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_TARGET)
> +	$(LINUX_APPEND_DTB)
>  	# Copy the kernel image to its final destination
>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
>  	# If there is a .ub file copy it to the final destination



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
