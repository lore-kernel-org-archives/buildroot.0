From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 13:39:48 +0100
Subject: [Buildroot] [git commit] configs/snps_archs38_hsdk_defconfig:
 switch to glibc
Message-ID: <20210116150346.CFD6186FFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25daf4a7b950fddfa8c418a8bc65d09da4b00a73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are no longer actively working on uClibc, so make that default
for HSDK boards.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
[yann.morin.1998 at free.fr: drop enabling hard float]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/snps_archs38_hsdk_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index b8fd356360..8dceb3450b 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,6 +1,8 @@
 BR2_arcle=y
 BR2_archs38_full=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_GLIBC_UTILS=y
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
 BR2_SYSTEM_DHCP="eth0"
