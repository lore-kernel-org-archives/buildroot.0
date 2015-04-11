From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 15:20:09 +0200
Subject: [Buildroot] [git commit] inconsolata: new package
Message-ID: <20150411132106.D8FD38079A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=365f6dacdf89e69898d30d5db7a971059cbc0f23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/inconsolata/Config.in        |    7 +++++++
 package/inconsolata/inconsolata.hash |    2 ++
 package/inconsolata/inconsolata.mk   |   19 +++++++++++++++++++
 4 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2c84c3f..248e18b 100644
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
