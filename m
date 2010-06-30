From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Jun 2010 13:59:14 +0300
Subject: [Buildroot] [PATCH] Fixed LINUX26_IMAGE_PATH
In-Reply-To: <1277894627-4586-1-git-send-email-henuxd@gmail.com>
References: <1277894627-4586-1-git-send-email-henuxd@gmail.com>
Message-ID: <20100630105914.GC23534@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heri,

On Wed, Jun 30, 2010 at 01:43:47PM +0300, Henri H?kkinen wrote:
> Kernel image is actually located in boot/images/ rather than in boot/

This depends on architecture. ARM put its images in boot/. Which architecture 
is yours?

baruch

> ---
>  linux/linux.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 593a1b4..355276e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -42,7 +42,7 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
>  LINUX26_IMAGE_NAME=vmlinux.bin
>  endif
>  
> -LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
> +LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
>  
>  # Download
>  $(LINUX26_DIR)/.stamp_downloaded:

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
