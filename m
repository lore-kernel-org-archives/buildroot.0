From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Thu,  7 Mar 2013 11:49:23 +0100
Subject: [Buildroot] [PATCH] change default location for local.mk to
	$(CONFIG_DIR)
Message-ID: <1362653363-24915-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the previous default of $(TOPDIR) broke the philosophy of builds with O=
which try to keep all configuration files within the $(CONFIG_DIR)
subtree
---
 Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index a2c305f..c3a3e1a 100644
--- a/Config.in
+++ b/Config.in
@@ -429,7 +429,7 @@ config BR2_HAVE_DEVFILES
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
-	default "$(TOPDIR)/local.mk"
+	default "$(CONFIG_DIR)/local.mk"
 	help
 	  A package override file is a short makefile that contains
 	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR,
-- 
1.7.10.4
