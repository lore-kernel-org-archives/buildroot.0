From: Sven Oliver Moll <buildroot@svol.li>
Date: Wed, 21 Oct 2020 12:34:00 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] Makefile: exclude DL_DIR from savedefconfig
Message-ID: <alpine.DEB.2.20.2010211133360.29285@defender.svolli.xa>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running "make savedefconfig" with DL_DIR set also saves that variable,
which is only useful in local context.

Signed-off-by: Sven Oliver Moll <buildroot@svol.li>
---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 384bfe3fe9..e7b3b7535b 100644
--- a/Makefile
+++ b/Makefile
@@ -1027,7 +1027,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
  	@$(COMMON_CONFIG_ENV) $< \
  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
  		$(CONFIG_CONFIG_IN)
-	@$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
+	@$(SED) '/BR2_DEFCONFIG=/d' -e '/BR2_DL_DIR=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)

  .PHONY: defconfig savedefconfig update-defconfig

-- 
2.20.1
