From: Stijn Souffriau <stijn.souffriau@essensium.com>
Date: Wed,  9 May 2012 23:29:43 +0200
Subject: [Buildroot] [PATCH 2/5] Added the libksba package.
In-Reply-To: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
References: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <1336598986-9518-2-git-send-email-stijn.souffriau@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in          |    1 +
 package/libksba/Config.in  |    6 ++++++
 package/libksba/libksba.mk |   16 ++++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
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
index 0000000..b13982a
--- /dev/null
+++ b/package/libksba/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBKSBA
+	bool "libksba"
+	help
+	  Libksba is a CMS and X.509 access library under development.
+
+	  http://gnupg.org/
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
new file mode 100644
index 0000000..bebd352
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
+
+LIBKSBA_CONF_OPT = \
+	--disable-optimization \
+	--with-gpg-error-prefix=$(STAGING_DIR)/usr
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.0.4
