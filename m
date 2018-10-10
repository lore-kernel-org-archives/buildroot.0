From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:21:53 +0200
Subject: [Buildroot] [git commit] webkitgtk: enable package for aarch64
Message-ID: <20181010192125.07A207FCE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9151e83458efc542dc18ca38710fc92eb8564ac6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

64-bit ARM is well supported, particularly in little-endian
configurations, where JavaScriptCore JIT can be enabled as well.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 6933248bd6..85a3af81bf 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	bool
 	# ARM needs BLX, so v5t+, BE completely untested so disabled
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
+	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
 	# Disabled on MIPS big endian due to sigbus
 	default y if BR2_mipsel || BR2_mips64el
@@ -15,6 +16,8 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
 	bool
 	# ARM needs NEON for JIT.
 	default y if BR2_ARM_CPU_HAS_NEON
+	# AArch64 is supported upstream but not well tested on big-endian mode.
+	default y if BR2_aarch64
 	# i386 & x86_64 don't have any special requirements.
 	default y if BR2_i386
 	default y if BR2_x86_64
