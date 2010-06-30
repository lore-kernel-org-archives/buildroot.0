From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jun 2010 14:03:55 +0200
Subject: [Buildroot] [PATCH] Fixed LINUX26_IMAGE_PATH
In-Reply-To: <1277894627-4586-1-git-send-email-henuxd@gmail.com>
References: <1277894627-4586-1-git-send-email-henuxd@gmail.com>
Message-ID: <20100630140355.7fddbd22@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Henri,

I've seen your message on IRC, but you left too early for me to react
on your question.

On Wed, 30 Jun 2010 13:43:47 +0300
Henri H?kkinen <henuxd@gmail.com> wrote:

> Kernel image is actually located in boot/images/ rather than in boot/
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

This will break ARM/x86 and many other architectures. Instead, we
probably need something like:

ifeq ($(KERNEL_ARCH),avr32)
LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
else
LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
endif

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
