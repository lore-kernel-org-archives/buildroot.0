From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 31 Aug 2017 21:17:16 -0300
Subject: [Buildroot] [PATCH 1/2] boot/grub: remove
References: <dcfdaefd6117d329079c5b6fbea1fbf00fe2094c.1504194830.git.yann.morin.1998@free.fr>
Message-ID: <59a8a70c74acb_4c3212b6eec928af@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I don't see this patch on patchwork.

On Thu, Aug 31, 2017 at 12:54 PM, Yann E. MORIN wrote:

[snip]
> ---
>  Config.in.legacy                              |     9 +
>  boot/Config.in                                |     1 -
>  boot/grub/Config.in                           |   200 -
>  boot/grub/grub.200-fix_mbr_handling.patch     |    13 -
>  boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |    36 -
>  boot/grub/grub.400-nic_update2.patch          | 47064 ------------------------
>  boot/grub/grub.hash                           |     3 -
>  boot/grub/grub.mk                             |   109 -
>  boot/grub/menu.lst                            |    16 -
>  boot/grub/splash.xpm.gz                       |   Bin 16466 -> 0 bytes
>  support/testing/tests/fs/test_iso9660.py      |    37 -

The update to .gitlab-ci.yml is missing.

>  11 files changed, 9 insertions(+), 47479 deletions(-)
[snip]
> +++ b/support/testing/tests/fs/test_iso9660.py
> @@ -85,43 +85,6 @@ BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
>          self.assertEqual(exit_code, 0)
>  
>  #
> -# Grub
> -#
> -
> -class TestIso9660GrubExternal(infra.basetest.BRTest):
> -    config = BASIC_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_ISO9660=y
> -# BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
> -BR2_TARGET_GRUB=y
> -BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> -""".format(infra.filepath("conf/grub-menu.lst"))

This file is not used by remaining test cases so it can be removed:
support/testing/conf/grub-menu.lst

Regards,
Ricardo
