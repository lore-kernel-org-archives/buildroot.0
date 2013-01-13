From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 20:49:07 +0100
Subject: [Buildroot] [git commit] New package : GNU SASL Library - libgsasl
Message-ID: <20130113194912.6982F8018A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b7074cfa1c75b58249e1a65d940c4cc30f28f3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU SASL is an implementation of the Simple Authentication and Security
Layer framework and a few common SASL mechanisms.  SASL is used by network
servers (e.g., IMAP, SMTP) to request authentication from clients, and in
clients to authenticate against servers.

libgsasl will be used in future versions of libesmtp.

[Peter: Misc minor fixes]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/libgsasl/Config.in   |   11 +++++++++++
 package/libgsasl/libgsasl.mk |   14 ++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

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
index 0000000..5181386
--- /dev/null
+++ b/package/libgsasl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBGSASL
+	bool "libgsasl"
+	help
+	  Simple Authentication and Security Layer framework Library.
+	  GNU SASL is an implementation of the Simple Authentication and
+	  Security Layer framework and a few common SASL mechanisms.
+	  SASL is used by network servers (e.g., IMAP, SMTP) to request
+	  authentication from clients, and in clients to authenticate
+	  against servers.
+
+	  http://www.gnu.org/software/gsasl
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
new file mode 100644
index 0000000..8f9a510
--- /dev/null
+++ b/package/libgsasl/libgsasl.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libgsasl
+#
+#############################################################
+
+LIBGSASL_VERSION = 1.8.0
+LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
+LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
+LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
+LIBGSASL_INSTALL_STAGING = YES
+LIBGSAS_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
+
+$(eval $(autotools-package))
