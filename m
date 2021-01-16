From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 13:42:11 +0100
Subject: [Buildroot] [git commit] configs/snps_archs38_hsdk_defconfig: use
 hard-float
Message-ID: <20210116150346.DA116875DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32113c8a25c0f4c1b666dac96b7cdff649873b3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hard-float support is pretty stable, so make that default for HSDK
boards.

The hard-float setting is a bit convulated since current ARC gcc lacks
--with-fpu - so this is done with BR2_TARGET_OPTIMIZATION

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
[yann.morin.1998 at free.fr: split off into its own commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/snps_archs38_hsdk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 8dceb3450b..69d0b1936b 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -3,6 +3,7 @@ BR2_archs38_full=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
 BR2_PACKAGE_GLIBC_UTILS=y
+BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
 BR2_SYSTEM_DHCP="eth0"
