From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:49:54 +0200
Subject: [Buildroot] [git commit] arch/xtensa: add macro to extract the
	overlay
Message-ID: <20170326135524.89E81803EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8eba8e144c52922f6ad94e5c4580f12fe0b2cdb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arch.mk.xtensa | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 7c8beb1..2843333 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -13,3 +13,16 @@
 ################################################################################
 ARCH_XTENSA_CORE_NAME = $(call qstrip,$(BR2_XTENSA_CORE_NAME))
 ARCH_XTENSA_OVERLAY_TAR = $(call qstrip,$(BR2_XTENSA_OVERLAY_DIR))/xtensa_$(ARCH_XTENSA_CORE_NAME).tar
+
+################################################################################
+# arch-xtensa-overlay-extract -- extract an extensa overlay
+#
+# argument 1 is the path in which to extract
+# argument 2 is the component to extract, one of: gcc, binutils, gdb
+#
+# Example:
+#   $(call arch-xtensa-overlay-extract,/path/to/overlay.tar,$(@D),gcc)
+################################################################################
+define arch-xtensa-overlay-extract
+	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(1) --strip-components=1 $(2)
+endef
