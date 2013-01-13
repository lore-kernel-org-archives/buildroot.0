From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 13 Jan 2013 19:58:43 +0100
Subject: [Buildroot] [PATCH 1/1 v4] New package : GNU SASL Library - libgsasl
Message-ID: <1358103523-30951-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


GNU SASL is an implementation of the Simple Authentication and Security Layer framework
and a few common SASL mechanisms.
SASL is used by network servers (e.g., IMAP, SMTP) to request authentication from clients,
and in clients to authenticate against servers.

libgsasl will be used in future versions of libesmtp.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 v2: Added more information in the help section of Config.in
 v3: Fix license information
 v4: Use the BR2_GNU_MIRROR

 package/Config.in            |  1 +
 package/libgsasl/Config.in   | 10 ++++++++++
 package/libgsasl/libgsasl.mk | 14 ++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/libgsasl/Config.in
 create mode 100644 package/libgsasl/libgsasl.mk

diff --git a/package/Config.in b/package/Config.in
index fcc2480..427b4db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -481,6 +481,7 @@ source "package/libdnet/Config.in"
 source "package/libesmtp/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libfcgi/Config.in"
+source "package/libgsasl/Config.in"
 source "package/libidn/Config.in"
 source "package/libiscsi/Config.in"
 source "package/liboauth/Config.in"
diff --git a/package/libgsasl/Config.in b/package/libgsasl/Config.in
new file mode 100644
index 0000000..b6fe02b
--- /dev/null
+++ b/package/libgsasl/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBGSASL
+	bool "libgsasl"
+	help
+	  Simple Authentication and Security Layer framework Library.
+	  GNU SASL is an implementation of the Simple Authentication and 
+	  Security Layer framework and a few common SASL mechanisms.
+	  SASL is used by network servers (e.g., IMAP, SMTP) to request 
+	  authentication from clients, and in clients to authenticate against servers.
+
+	  http://www.gnu.org/software/gsasl
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
new file mode 100644
index 0000000..785fab0
--- /dev/null
+++ b/package/libgsasl/libgsasl.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libgsasl
+#
+#############################################################
+LIBGSASL_VERSION = 1.8.0
+LIBGSASL_SOURCE = libgsasl-$(LIBGSASL_VERSION).tar.gz
+LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
+LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
+LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
+LIBGSASL_INSTALL_STAGING = YES
+LIBGSAS_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
+
+$(eval $(autotools-package))
\ No newline at end of file
-- 
1.8.0.1
