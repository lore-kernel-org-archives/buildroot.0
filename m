From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 10 Oct 2018 01:08:50 +0300
Subject: [Buildroot] [PATCH 2/4] webkitgtk: enable package for aarch64
In-Reply-To: <20181009220852.4309-1-aperez@igalia.com>
References: <20181009220852.4309-1-aperez@igalia.com>
Message-ID: <20181009220852.4309-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

64-bit ARM is well supported, particularly in little-endian
configurations, where JavaScriptCore JIT can be enabled as well.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
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
-- 
2.19.1
