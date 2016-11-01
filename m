From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:04:43 +0100
Subject: [Buildroot] [PATCH 2/4] board/lego/ev3: Create images using
 genimage
In-Reply-To: <1477870346-4941-3-git-send-email-david@lechnology.com>
References: <1477870346-4941-1-git-send-email-david@lechnology.com>
 <1477870346-4941-3-git-send-email-david@lechnology.com>
Message-ID: <20161101160443.37928df7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 18:32:24 -0500, David Lechner wrote:
> This adds a script to create SD card and flash images for LEGO MINDSTORMS
> EV3 using the genimage tool.
> 
> The default kernel config had to be modifed to add support for squashfs
> and to add a ram disk.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

In addition to the comment made by Baruch about using a defconfig
fragment for Linux, I have another comment, see below.

>  # U-Boot
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
> +BR2_PACKAGE_HOST_GENIMAGE=y

This line probably need an additional comment above it, as it's not
U-Boot related.

But more importantly, since you're building a FAT filesystem image, you
also need:

BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_MTOOLS=y

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
