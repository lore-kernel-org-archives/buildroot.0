From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 14 Dec 2011 16:04:07 +0100
Subject: [Buildroot] [PATCH v2 1/1] New package libesmtp : Library for
	sending emails through SMTP.
Message-ID: <1323875047-27039-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This is a library for sending email through SMTP.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in            |    1 +
 package/libesmtp/Config.in   |    6 ++++++
 package/libesmtp/libesmtp.mk |   11 +++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/libesmtp/Config.in
 create mode 100644 package/libesmtp/libesmtp.mk

diff --git a/package/Config.in b/package/Config.in
index eb93b1c..c9812af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -338,6 +338,7 @@ source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
 source "package/librsync/Config.in"
 source "package/libsoup/Config.in"
+source "package/libesmtp/Config.in"
 source "package/libupnp/Config.in"
 endmenu
 
diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
new file mode 100644
index 0000000..44debeb
--- /dev/null
+++ b/package/libesmtp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBESMTP
+	bool "libesmtp"
+	help
+	  Library for sending emails through SMTP.
+	  
+	  http://www.stafford.uklinux.net/libesmtp
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
new file mode 100644
index 0000000..63f3192
--- /dev/null
+++ b/package/libesmtp/libesmtp.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libesmtp
+#
+#############################################################
+LIBESMTP_VERSION = 1.0.6
+LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
+LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
+LIBESMTP_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.8
