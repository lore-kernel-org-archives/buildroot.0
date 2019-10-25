From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 25 Oct 2019 22:27:14 +0200
Subject: [Buildroot] [PATCH 1/1] libffi: prevent unsupported architectures
Message-ID: <20191025202714.24737-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable architectures unsupported by libffi: Andes nds32 and thumb-only Arm
(e.g. Cortex-M).

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libffi/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libffi/Config.in b/package/libffi/Config.in
index 6edf570baf..6875947a6a 100644
--- a/package/libffi/Config.in
+++ b/package/libffi/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBFFI
 	bool "libffi"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_nds32
+	depends on (!BR2_arm && !BR2_armeb) || BR2_ARM_CPU_HAS_ARM
 	help
 	  The libffi library provides a portable, high level
 	  programming interface to various calling conventions. This
-- 
2.23.0
