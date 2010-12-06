From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 6 Dec 2010 01:56:01 -0500
Subject: [Buildroot] [PATCH] improved initramfs and iso target support
In-Reply-To: <ea18b2e06d4eccbe63653f6186d7e6e15b7b9178.1291585241.git.smiley73@users.sourceforge.net>
References: <ea18b2e06d4eccbe63653f6186d7e6e15b7b9178.1291585241.git.smiley73@users.sourceforge.net>
Message-ID: <201012060156.04137.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, December 05, 2010 16:40:51 heiko at zuerker.org wrote:
> A small initramfs is now supported in order to initialize the system (like
> initrd). New options to create a bootable CD with optional support for a
> minimal initramfs, isolinux boot loader and zisofs have been added.
> 
> The iso filesystem doesn't need the ext2 image anymore, but the old
> functionality is still available.

please word wrap your changelog

> +menu "initramfs options"
> +depends on BR2_TARGET_DO_INITRAMFS
> +
> +choice
> +	prompt "initramfs type"
> +	default BR2_TARGET_ROOTFS_INITRAMFS
> +	depends on BR2_TARGET_DO_INITRAMFS
> +	help
> +	  Select compressor for ext2 filesystem of the root filesystem

initramfs is not ext2 by definition, but ignoring that, this is not selecting 
compression.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101206/4a412c99/attachment.pgp>
