From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 20:13:35 +0200
Subject: [Buildroot] [PATCH 5/5] buildroot: initramfs: Generate vmImage
 without builtin initramfs rootfs.
In-Reply-To: <1344330577-25159-5-git-send-email-sonic.adi@gmail.com>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-5-git-send-email-sonic.adi@gmail.com>
Message-ID: <20120811201335.09a3082e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 7 Aug 2012 17:09:37 +0800,
Sonic Zhang <sonic.adi@gmail.com> a ?crit :

> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> This is for developer's convenience when debugging via initramfs uImage.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

What is the problem being solved here? Could you expand a bit on the
"why" this is needed? When you make changes to the root filesystem and
do "make", the initramfs is regenerated, and the kernel image is
regenerated as well with the current Buildroot, so I'm not sure what
this patch is solving.

> +	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
> +		cp $(LINUX_IMAGE_PATH) $(KERNEL_ARCH_PATH)/boot/vmImage)

I'm confused. What is this vmImage thing that you are copying back into
the kernel tree here...

>  define LINUX_INSTALL_IMAGES_CMDS
>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> +	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
> +		cp $(KERNEL_ARCH_PATH)/boot/vmImage $(BINARIES_DIR))

and installing to output/images here?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
