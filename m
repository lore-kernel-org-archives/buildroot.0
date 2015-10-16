From: Julian Scheel <julian@jusst.de>
Date: Fri, 16 Oct 2015 15:54:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/bitstream: new package
Message-ID: <1445003680-26003-1-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BiTStream is a set of headers to ease processing of mpeg ts streams. It is
used by dvblast.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
 package/Config.in              |  1 +
 package/bitstream/Config.in    |  8 ++++++++
 package/bitstream/bitstream.mk | 19 +++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/bitstream/Config.in
 create mode 100644 package/bitstream/bitstream.mk

diff --git a/package/Config.in b/package/Config.in
index 98dcd78..53a312c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -954,6 +954,7 @@ menu "Logging"
 endmenu
 
 menu "Multimedia"
+	source "package/bitstream/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
diff --git a/package/bitstream/Config.in b/package/bitstream/Config.in
new file mode 100644
index 0000000..3a7ad43
--- /dev/null
+++ b/package/bitstream/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BITSTREAM
+	bool "biTStream"
+	help
+	  biTStream is a set of C headers allowing a simpler access to
+	  binary structures such as specified by MPEG, DVB, IETF, SMPTE,
+	  IEEE, SCTE, etc.
+
+	  http://www.videolan.org/developers/bitstream.html
diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
new file mode 100644
index 0000000..cdca80f
--- /dev/null
+++ b/package/bitstream/bitstream.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# biTStream
+#
+################################################################################
+
+BITSTREAM_VERSION = 1.1
+BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
+BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
+BITSTREAM_LICENSE = MIT
+
+BITSTREAM_INSTALL_STAGING = YES
+BITSTREAM_INSTALL_TARGET = NO
+
+define BITSTREAM_INSTALL_STAGING_CMDS
+	(cd $(@D); $(MAKE) PREFIX=$(STAGING_DIR)/usr install)
+endef
+
+$(eval $(generic-package))
-- 
2.6.0
