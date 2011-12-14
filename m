From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 14 Dec 2011 01:26:51 +0100
Subject: [Buildroot] [PATCH 1/1] New package : libesmtp Library for sending
	email through SMTP.
Message-ID: <1323822411-12938-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This is a library that could be used to send emails through SMTP.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in            |    1 +
 package/libesmtp/Config.in   |    7 +++++++
 package/libesmtp/libesmtp.mk |   12 ++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/libesmtp/Config.in
 create mode 100644 package/libesmtp/libesmtp.mk

diff --git a/package/Config.in b/package/Config.in
index eb93b1c..b455408 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -327,6 +327,7 @@ source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
 source "package/libdnet/Config.in"
+source "package/libesmtp/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
new file mode 100644
index 0000000..698f52f
--- /dev/null
+++ b/package/libesmtp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBESMTP
+	bool "libesmtp"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Library for sending emails through SMTP.
+	  
+	  http://www.stafford.uklinux.net/libesmtp
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
new file mode 100644
index 0000000..8997465
--- /dev/null
+++ b/package/libesmtp/libesmtp.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libesmtp
+#
+#############################################################
+LIBESMTP_VERSION = 1.0.6
+LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
+LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
+LIBESMTP_DEPENDENCIES = openssl
+LIBESMTP_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.8
