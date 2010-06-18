From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Jun 2010 21:32:14 +0200
Subject: [Buildroot] [PATCH 03/10] iso9660: take into account the linux
	changes
In-Reply-To: <5392121addc957f0723cdb98f5afe89dccaeeb5e.1276454802.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 13 Jun 2010 20:50:07 +0200")
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<5392121addc957f0723cdb98f5afe89dccaeeb5e.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <877hlwb0ht.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  fs/iso9660/Config.in  |    4 ++--
 Thomas>  fs/iso9660/iso9660.mk |    6 +++---
 Thomas>  2 files changed, 5 insertions(+), 5 deletions(-)

 Thomas> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
 Thomas> index 7830581..5f7cdf4 100644
 Thomas> --- a/fs/iso9660/Config.in
 Thomas> +++ b/fs/iso9660/Config.in
 Thomas> @@ -1,7 +1,7 @@
 Thomas>  config BR2_TARGET_ROOTFS_ISO9660
 Thomas>  	bool "iso image"
 Thomas>  	depends on BR2_i386
 Thomas> -	depends on !BR2_KERNEL_none
 Thomas> +	depends on BR2_LINUX_KERNEL
 Thomas>  	select BR2_TARGET_ROOTFS_EXT2
 Thomas>  	select BR2_TARGET_GRUB
 Thomas>  	help
 Thomas> @@ -13,4 +13,4 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 Thomas>  	default "fs/iso9660/menu.lst"
 
 Thomas>  comment "iso image requires a Linux kernel to be built"
 Thomas> -	depends on BR2_i386 && BR2_KERNEL_none
 Thomas> +	depends on BR2_i386 && !BR2_LINUX_KERNEL

I know you're not the author of this, but any reason this shouldn't work
on x86-64 as well?

-- 
Bye, Peter Korsgaard
