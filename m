From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 19:56:43 +0000 (UTC)
Subject: [Buildroot] [Bug 7568] musl buildroot-toolchain does not put
 libgcc_s.so.1 into place
In-Reply-To: <bug-7568-163@https.bugs.busybox.net/>
References: <bug-7568-163@https.bugs.busybox.net/>
Message-ID: <20141109195643.74D33B3BA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7568

--- Comment #4 from Alexander Clouter <alex+buildroot@digriz.org.uk> 2014-11-09 19:56:43 UTC ---
For reference, my full (current) config is:

BR2_mipsel=y
BR2_mips_32r2=y
BR2_DL_DIR="$(CONFIG_DIR)/../dl"
BR2_CCACHE=y
BR2_CCACHE_DIR="$(CONFIG_DIR)/../ccache"
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
# BR2_UCLIBC_INSTALL_UTILS is not set
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C"
BR2_TARGET_GENERIC_HOSTNAME="bratwurst"
BR2_TARGET_GENERIC_ISSUE="Welcome to BRatWuRsT"
BR2_INIT_NONE=y
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_ROOTFS_OVERLAY="$(CONFIG_DIR)/../overlay"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(BRATWURST_BOARD_DIR)/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BRATWURST_BOARD_DIR)/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BRATWURST_BOARD_DIR)/linux.config"
BR2_LINUX_KERNEL_VMLINUZ=y
BR2_PACKAGE_DNSMASQ=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS=y
BR2_PACKAGE_PPPD=y
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_ROOTFS_JFFS2_FLASH_64=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_EXTERNAL_NFTABLES=y
BR2_PACKAGE_LINUX_ATM=y

Had the problem before adding EXTERNAL_NFTABLES/LINUX_ATM, so I doubt this is
causing a problem, but if you need to, you can get those hooks at
https://github.com/jimdigriz/bratwurst

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
