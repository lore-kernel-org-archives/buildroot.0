From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 06 Aug 2017 16:25:19 +0000
Subject: [Buildroot] [Bug 9926] systemd-resolved.service: Failed at step
 NAMESPACE (systemd 233)
In-Reply-To: <bug-9926-163@https.bugs.busybox.net/>
References: <bug-9926-163@https.bugs.busybox.net/>
Message-ID: <bug-9926-163-CGl7nF6IPr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9926

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|ASSIGNED                    |RESOLVED

--- Comment #5 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Mihcael, All,

I am not able to reproduce this issue with current master, with
the fiollowing defconfig (which enables the same set of systemd
options as those you listed):

    BR2_arm=y
    BR2_cortex_a9=y
    BR2_ARM_ENABLE_NEON=y
    BR2_ARM_ENABLE_VFP=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_SYSTEMD=y
    BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
    BR2_SYSTEM_DHCP="eth0"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
    BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
    BR2_LINUX_KERNEL_DTS_SUPPORT=y
    BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
    BR2_PACKAGE_SYSTEMD_VCONSOLE=y
    BR2_TARGET_ROOTFS_EXT2=y
    # BR2_TARGET_ROOTFS_TAR is not set

Note that master contains a full rework of the skeleton to
cope with systemd.

Could you please retry on your use-case to confirm that the
bug still exists (or not!) for you with current master?

In the meantime, I am closing it. Just re-open it if you can
reproduce, in which case please attach the complete defconfig
you are using:

    $ make BR2_DEFCONFIG=$(pwd)/defconfig savedefconfig
    $ cat defconfig

Thanks!

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
