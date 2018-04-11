From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 09:10:04 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.16
In-Reply-To: <c92f59e6efd59c9f887a81c2007d7d2962d45064.1523421916.git.baruch@tkos.co.il>
References: <c92f59e6efd59c9f887a81c2007d7d2962d45064.1523421916.git.baruch@tkos.co.il>
Message-ID: <20180411091004.6486eda3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Apr 2018 07:45:16 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Add a patch for fixing static build.
> 
> Add license information about the newly introduced libbtrfsutil.
> 
> Disable the libbtrfsutil python binding. It does not cross compile
> nicely.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks for this update. One question below.

> -BTRFS_PROGS_VERSION = 4.15.1
> +BTRFS_PROGS_VERSION = 4.16
>  BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
>  BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
>  BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
> -BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd
> -BTRFS_PROGS_LICENSE = GPL-2.0
> -BTRFS_PROGS_LICENSE_FILES = COPYING
> +BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
> +BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-3.0+ (libbtrfsutil)

Does this means that using the btrfs utilities now requires having a
LGPLv3 library on the target ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
