From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:03 +0100
Subject: [Buildroot] [PATCH 33/51] arch/xtensa: add macro to extract the
	overlay
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <dc9044dddc7f1b2f0f1a1c7ab95899801d9178f6.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.9.1
