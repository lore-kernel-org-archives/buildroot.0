From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:05 +0200
Subject: [Buildroot] [PATCH 32/41] package: add libgnutls package
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-33-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Config.in              |    1 +
 package/libgnutls/Config.in    |    9 +++++++++
 package/libgnutls/libgnutls.mk |   18 ++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/libgnutls/Config.in
 create mode 100644 package/libgnutls/libgnutls.mk

diff --git a/package/Config.in b/package/Config.in
index 582d435..5b951a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -225,6 +225,7 @@ endmenu
 menu "Crypto"
 source "package/beecrypt/Config.in"
 source "package/libgcrypt/Config.in"
+source "package/libgnutls/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/openssl/Config.in"
 endmenu
diff --git a/package/libgnutls/Config.in b/package/libgnutls/Config.in
new file mode 100644
index 0000000..b323912
--- /dev/null
+++ b/package/libgnutls/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBGNUTLS
+	bool "libgnutls"
+        select BR2_PACKAGE_LIBGCRYPT
+	help
+          GNUTLS implements the TLS/SSL (Transport Layer Security aka
+          Secure Sockets Layer) protocol. Gnutls is a GNU project.
+          More up to date information can be found at
+
+          http://www.gnu.org/software/gnutls/
diff --git a/package/libgnutls/libgnutls.mk b/package/libgnutls/libgnutls.mk
new file mode 100644
index 0000000..34f6384
--- /dev/null
+++ b/package/libgnutls/libgnutls.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# libgnutls
+#
+#############################################################
+
+LIBGNUTLS_VERSION = 2.8.6
+LIBGNUTLS_SOURCE = gnutls-$(LIBGNUTLS_VERSION).tar.bz2
+LIBGNUTLS_SITE = http://ftp.gnu.org/pub/gnu/gnutls
+LIBGNUTLS_LIBTOOL_PATCH = NO
+LIBGNUTLS_INSTALL_STAGING = YES
+
+LIBGNUTLS_DEPENDENCIES = libgcrypt
+
+LIBGNUTLS_CONF_OPT = \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+
+$(eval $(call AUTOTARGETS,package,libgnutls))
-- 
1.7.0.4
