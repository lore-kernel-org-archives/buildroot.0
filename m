From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 19:58:34 +0200
Subject: [Buildroot] [PATCH 1/2] cubieboard: defconfig for mainline
 kernel
In-Reply-To: <1368682467-12228-2-git-send-email-carlo.caione@gmail.com>
References: <1368682467-12228-1-git-send-email-carlo.caione@gmail.com>
 <1368682467-12228-2-git-send-email-carlo.caione@gmail.com>
Message-ID: <20130526195834.723ebf45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Caione,

On Thu, 16 May 2013 07:34:26 +0200, Carlo Caione wrote:

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> +BR2_LINUX_KERNEL_UBOOT_IMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-cubieboard"

You should specify a version for the Linux kernel. Otherwise, it will
automatically get bumped to the latest version, which is not what we
want for our defconfig: we want them to build a well-known version of
the various components such as the kernel, U-Boot, etc.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
