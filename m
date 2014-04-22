From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 22 Apr 2014 02:25:01 +0200
Subject: [Buildroot] [PATCH 1/1] qdecoder : new package
Message-ID: <1398126301-23000-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qDecoder is a powerful CGI library.
Features:
   Supports parsing a request encoded by GET/POST method
   Supports parsing multipart/form-data encoding.(in-memory and direct disk)
   Supports COOKIE handling.
   Supports Session management.
   Supports FastCGI
   
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in            |  1 +
 package/qdecoder/Config.in   |  7 +++++++
 package/qdecoder/qdecoder.mk | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/qdecoder/Config.in
 create mode 100644 package/qdecoder/qdecoder.mk

diff --git a/package/Config.in b/package/Config.in
index abfc3cc..998f990 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -765,6 +765,7 @@ source "package/nss-mdns/Config.in"
 source "package/omniorb/Config.in"
 source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
+source "package/qdecoder/Config.in"
 source "package/rtmpdump/Config.in"
 source "package/slirp/Config.in"
 source "package/snmppp/Config.in"
diff --git a/package/qdecoder/Config.in b/package/qdecoder/Config.in
new file mode 100644
index 0000000..2bd2a2f
--- /dev/null
+++ b/package/qdecoder/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QDECODER
+	bool "qdecoder"
+	help
+	  qDecoder is a simple and powerful CGI library
+	  for the C/C++ programming language.
+
+	  http://www.qdecoder.org/wiki/qdecoder
diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
new file mode 100644
index 0000000..94372d8
--- /dev/null
+++ b/package/qdecoder/qdecoder.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# qdecoder
+#
+################################################################################
+
+QDECODER_VERSION = r12.0.5
+QDECODER_SITE = $(call github,wolkykim,qdecoder,$(QDECODER_VERSION))
+QDECODER_LICENSE = GPL
+QDECODER_LICENSE_FILES = COPYING
+
+QDECODER_INSTALL_STAGING = YES
+
+QDECODER_CONF_OPT = \
+	--prefix=$(STAGING_DIR)/usr \
+	--libdir=$(STAGING_DIR)/usr/lib
+
+$(eval $(autotools-package))
-- 
1.9.2
