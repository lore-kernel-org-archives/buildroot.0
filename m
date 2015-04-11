From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 07:51:15 -0300
Subject: [Buildroot] [PATCH 3/3] inconsolata: new package
In-Reply-To: <1428749475-898-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428749475-898-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428749475-898-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                    |  1 +
 package/inconsolata/Config.in        |  7 +++++++
 package/inconsolata/inconsolata.hash |  2 ++
 package/inconsolata/inconsolata.mk   | 19 +++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/inconsolata/Config.in
 create mode 100644 package/inconsolata/inconsolata.hash
 create mode 100644 package/inconsolata/inconsolata.mk

diff --git a/package/Config.in b/package/Config.in
index 5147ceb..4be75dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -182,6 +182,7 @@ comment "Fonts"
 	source "package/bitstream-vera/Config.in"
 	source "package/dejavu/Config.in"
 	source "package/ghostscript-fonts/Config.in"
+	source "package/inconsolata/Config.in"
 	source "package/liberation/Config.in"
 
 comment "Icons"
diff --git a/package/inconsolata/Config.in b/package/inconsolata/Config.in
new file mode 100644
index 0000000..de6b388
--- /dev/null
+++ b/package/inconsolata/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_INCONSOLATA
+	bool "inconsolata"
+	help
+	  Inconsolata is a monospace font, designed for code listings
+	  and the like.
+
+	  http://www.google.com/fonts/specimen/Inconsolata
diff --git a/package/inconsolata/inconsolata.hash b/package/inconsolata/inconsolata.hash
new file mode 100644
index 0000000..49ea958
--- /dev/null
+++ b/package/inconsolata/inconsolata.hash
@@ -0,0 +1,2 @@
+# From http://snapshot.debian.org/archive/debian/20091207T044352Z/pool/main/t/ttf-inconsolata/ttf-inconsolata_001.010-2.dsc
+sha256	ecf8ba44911fcb3c9683aef1ca2b3cfbafa119a3e93c682f448850e1ae08ce93	ttf-inconsolata_001.010.orig.tar.gz
diff --git a/package/inconsolata/inconsolata.mk b/package/inconsolata/inconsolata.mk
new file mode 100644
index 0000000..2f53b98
--- /dev/null
+++ b/package/inconsolata/inconsolata.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# inconsolata
+#
+################################################################################
+
+INCONSOLATA_VERSION = 001.010
+INCONSOLATA_SITE = http://snapshot.debian.org/archive/debian/20090524T155154Z/pool/main/t/ttf-inconsolata
+INCONSOLATA_SOURCE = ttf-inconsolata_$(INCONSOLATA_VERSION).orig.tar.gz
+INCONSOLATA_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/inconsolata
+INCONSOLATA_LICENSE = OFLv1.0
+INCONSOLATA_LICENSE_FILES = OFL.txt
+
+define INCONSOLATA_INSTALL_TARGET_CMDS
+	mkdir -p $(INCONSOLATA_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/*.otf $(INCONSOLATA_TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.0.5
