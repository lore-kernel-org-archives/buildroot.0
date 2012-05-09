From: Stijn Souffriau <stijn.souffriau@essensium.com>
Date: Wed,  9 May 2012 23:29:42 +0200
Subject: [Buildroot] [PATCH 1/5] Added the libassuan package.
Message-ID: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in              |    1 +
 package/libassuan/Config.in    |    7 +++++++
 package/libassuan/libassuan.mk |   18 ++++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/libassuan/Config.in
 create mode 100644 package/libassuan/libassuan.mk

diff --git a/package/Config.in b/package/Config.in
index b25f31a..58c6624 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -276,6 +276,7 @@ endmenu
 menu "Crypto"
 source "package/beecrypt/Config.in"
 source "package/gnutls/Config.in"
+source "package/libassuan/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libnss/Config.in"
diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
new file mode 100644
index 0000000..93ab49c
--- /dev/null
+++ b/package/libassuan/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBASSUAN
+	bool "libassuan"
+	select BR2_PACKAGE_LIBGPG_ERROR
+	help
+	  Libassuan is the IPC library used by some GnuPG related software.
+
+	  http://www.gnupg.org/
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
new file mode 100644
index 0000000..d2a018a
--- /dev/null
+++ b/package/libassuan/libassuan.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# libassuan
+#
+#############################################################
+
+LIBASSUAN_VERSION = 2.0.3
+LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
+LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan/
+LIBASSUAN_INSTALL_STAGING = YES
+
+LIBASSUAN_CONF_OPT = \
+	--disable-optimization \
+	--with-gpg-error-prefix=$(STAGING_DIR)/usr
+
+LIBASSUAN_DEPENDENCIES = libgpg-error
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.0.4
