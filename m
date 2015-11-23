From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:07 +0100
Subject: [Buildroot] [PATCH 37/51] arch/xtensa: add macro to install
	legal-info
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <59be0db1ac31ea0c4102b63eece9c5e450c7a274.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arch.mk.xtensa | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 2843333..3001538 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -26,3 +26,16 @@ ARCH_XTENSA_OVERLAY_TAR = $(call qstrip,$(BR2_XTENSA_OVERLAY_DIR))/xtensa_$(ARCH
 define arch-xtensa-overlay-extract
 	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(1) --strip-components=1 $(2)
 endef
+
+################################################################################
+# arch-xtensa-overlay-legal-info -- install the overlay archive to the legal-info
+# output.
+#
+# argumet 1 is the path to the directory in which to copy the overlay
+#
+# Example:
+#   $(call arch-xtensa-overlay-legal-info,/path/to/redist/dir/)
+################################################################################
+define arch-xtensa-overlay-legal-info
+	$(call hardlink-copy,$(ARCH_XTENSA_OVERLAY_TAR),$(1))
+endef
-- 
1.9.1
