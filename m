From: Julian Scheel <julian@jusst.de>
Date: Fri, 22 Apr 2016 09:18:11 +0200
Subject: [Buildroot] [PATCH] qemu: Add support for arm
Message-ID: <1461309491-16223-1-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build and operation was successfully tested to Tegra K1 arm platform.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
 package/qemu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 082b5ee..ea6b946 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
 	# Only tested on these architectures
 	default y if BR2_aarch64 || BR2_i386 || BR2_mips || BR2_mipsel \
-		|| BR2_x86_64
+		|| BR2_x86_64 || BR2_arm
 
 comment "QEMU requires a toolchain with wchar, threads"
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
-- 
2.8.0
