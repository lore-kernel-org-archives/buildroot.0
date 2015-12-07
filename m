From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  7 Dec 2015 22:14:44 +0100
Subject: [Buildroot] [PATCH v1] edid-decode: new package
Message-ID: <1449522884-8290-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in                  |  1 +
 package/edid-decode/Config.in      |  6 ++++++
 package/edid-decode/edid-decode.mk | 20 ++++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/edid-decode/Config.in
 create mode 100644 package/edid-decode/edid-decode.mk

diff --git a/package/Config.in b/package/Config.in
index 38436e2..07461e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -338,6 +338,7 @@ endif
 	source "package/dtv-scan-tables/Config.in"
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
+	source "package/edid-decode/Config.in"
 	source "package/eeprog/Config.in"
 	source "package/eudev/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/edid-decode/Config.in b/package/edid-decode/Config.in
new file mode 100644
index 0000000..64297b4
--- /dev/null
+++ b/package/edid-decode/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_EDID_DECODE
+	bool "edid-decode"
+	help
+	  Decode EDID data in human-readable format.
+
+	  http://cgit.freedesktop.org/xorg/app/edid-decode/
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
new file mode 100644
index 0000000..da6a1d1
--- /dev/null
+++ b/package/edid-decode/edid-decode.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# edid-decode
+#
+################################################################################
+
+EDID_DECODE_VERSION = 681153145d5e05ee15032ea792e967cda06e7622
+EDID_DECODE_SITE = git://anongit.freedesktop.org/git/xorg/app/edid-decode.git
+EDID_DECODE_LICENSE = MIT
+EDID_DECODE_LICENSE_FILES = edid-decode.c
+
+define EDID_DECODE_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" edid-decode
+endef
+
+define EDID_DECODE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
