From: Stijn Souffriau <stijn.souffriau@essensium.com>
Date: Sat,  2 Jun 2012 17:09:16 +0200
Subject: [Buildroot] [PATCH resend 2/4] Added the libksba package.
In-Reply-To: <1338649758-11225-1-git-send-email-stijn.souffriau@essensium.com>
References: <1338649758-11225-1-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <1338649758-11225-2-git-send-email-stijn.souffriau@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in          |    1 +
 package/libksba/Config.in  |    7 +++++++
 package/libksba/libksba.mk |   16 ++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/libksba/Config.in
 create mode 100644 package/libksba/libksba.mk

diff --git a/package/Config.in b/package/Config.in
index 58c6624..d71136d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -279,6 +279,7 @@ source "package/gnutls/Config.in"
 source "package/libassuan/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libksba/Config.in"
 source "package/libnss/Config.in"
 source "package/openssl/Config.in"
 source "package/polarssl/Config.in"
diff --git a/package/libksba/Config.in b/package/libksba/Config.in
new file mode 100644
index 0000000..70b2094
--- /dev/null
+++ b/package/libksba/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBKSBA
+	bool "libksba"
+	select BR2_PACKAGE_LIBGPG_ERROR
+	help
+	  Libksba is a CMS and X.509 access library under development.
+
+	  http://gnupg.org/
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
new file mode 100644
index 0000000..6ecd268
--- /dev/null
+++ b/package/libksba/libksba.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libksba
+#
+#############################################################
+
+LIBKSBA_VERSION = 1.2.0
+LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
+LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba/
+LIBKSBA_INSTALL_STAGING = YES
+LIBKSBA_DEPENDENCIES = libgpg-error
+
+LIBKSBA_CONF_OPT = \
+	--with-gpg-error-prefix=$(STAGING_DIR)/usr
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.5
