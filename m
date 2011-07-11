From: Daniel Mack <zonque@gmail.com>
Date: Mon, 11 Jul 2011 15:34:27 +0200
Subject: [Buildroot] [PATCH 2/2] Add new package gnutls
In-Reply-To: <1310391267-19364-1-git-send-email-zonque@gmail.com>
References: <1310391267-19364-1-git-send-email-zonque@gmail.com>
Message-ID: <1310391267-19364-2-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/Config.in        |    1 +
 package/gnutls/Config.in |    8 ++++++++
 package/gnutls/gnutls.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/gnutls/Config.in
 create mode 100644 package/gnutls/gnutls.mk

diff --git a/package/Config.in b/package/Config.in
index b06c669..60cf222 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ endmenu
 endif
 
 menu "Networking"
+source "package/gnutls/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
new file mode 100644
index 0000000..cedf120
--- /dev/null
+++ b/package/gnutls/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GNUTLS
+	bool "gnutls"
+	select BR2_PACKAGE_LIBGCRYPT
+	help
+	  GnuTLS is a secure communications library implementing the SSL
+	  and TLS protocols and technologies around them.
+
+	  http://www.gnu.org/software/gnutls/gnutls.html
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
new file mode 100644
index 0000000..5f31e1e
--- /dev/null
+++ b/package/gnutls/gnutls.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# gnutls
+#
+#############################################################
+
+GNUTLS_VERSION = 2.8.6
+GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
+GNUTLS_SITE = http://ftp.gnu.org/gnu/gnutls/
+GNUTLS_DEPENDENCIES = libgcrypt
+GNUTLS_CONF_OPT += --without-libgcrypt-prefix
+GNUTLS_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,gnutls))
-- 
1.7.5.4
