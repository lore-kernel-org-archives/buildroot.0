From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 07:51:14 -0300
Subject: [Buildroot] [PATCH 2/3] bitstream-vera: new package
In-Reply-To: <1428749475-898-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428749475-898-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428749475-898-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                          |  1 +
 package/bitstream-vera/Config.in           |  6 ++++++
 package/bitstream-vera/bitstream-vera.hash |  2 ++
 package/bitstream-vera/bitstream-vera.mk   | 19 +++++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/bitstream-vera/Config.in
 create mode 100644 package/bitstream-vera/bitstream-vera.hash
 create mode 100644 package/bitstream-vera/bitstream-vera.mk

diff --git a/package/Config.in b/package/Config.in
index f791f5b..5147ceb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -179,6 +179,7 @@ endmenu
 menu "Fonts, icons, sounds and themes"
 
 comment "Fonts"
+	source "package/bitstream-vera/Config.in"
 	source "package/dejavu/Config.in"
 	source "package/ghostscript-fonts/Config.in"
 	source "package/liberation/Config.in"
diff --git a/package/bitstream-vera/Config.in b/package/bitstream-vera/Config.in
new file mode 100644
index 0000000..034f115
--- /dev/null
+++ b/package/bitstream-vera/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_BITSTREAM_VERA
+	bool "Bitstream Vera"
+	help
+	  Bitstream Vera font family.
+
+	  https://www.gnome.org/fonts/
diff --git a/package/bitstream-vera/bitstream-vera.hash b/package/bitstream-vera/bitstream-vera.hash
new file mode 100644
index 0000000..e18b38b
--- /dev/null
+++ b/package/bitstream-vera/bitstream-vera.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.tar.bz2.sha256sum
+sha256	db5b27df7bbb318036ebdb75acd3e98f1bd6eb6608fb70a67d478cd243d178dc	ttf-bitstream-vera-1.10.tar.bz2
diff --git a/package/bitstream-vera/bitstream-vera.mk b/package/bitstream-vera/bitstream-vera.mk
new file mode 100644
index 0000000..f487d63
--- /dev/null
+++ b/package/bitstream-vera/bitstream-vera.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# bitstream-vera
+#
+################################################################################
+
+BITSTREAM_VERA_VERSION = 1.10
+BITSTREAM_VERA_SITE = http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/$(BITSTREAM_VERA_VERSION)
+BITSTREAM_VERA_SOURCE = ttf-bitstream-vera-$(BITSTREAM_VERA_VERSION).tar.bz2
+BITSTREAM_VERA_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/ttf-bitstream-vera
+BITSTREAM_VERA_LICENSE = BitstreamVera
+BITSTREAM_VERA_LICENSE_FILES = COPYRIGHT.TXT
+
+define BITSTREAM_VERA_INSTALL_TARGET_CMDS
+	mkdir -p $(BITSTREAM_VERA_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/*.ttf $(BITSTREAM_VERA_TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.0.5
