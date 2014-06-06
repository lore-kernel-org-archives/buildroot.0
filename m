From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Jun 2014 14:44:26 +0100
Subject: [Buildroot] [PATCH 2/5] libksba: new package
In-Reply-To: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1402062269-57018-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/Config.in          |    1 +
 package/libksba/Config.in  |    7 +++++++
 package/libksba/libksba.mk |   16 ++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/libksba/Config.in
 create mode 100644 package/libksba/libksba.mk

diff --git a/package/Config.in b/package/Config.in
index 14508ae..56ef7ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -535,6 +535,7 @@ source "package/libassuan/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libgpgme/Config.in"
+source "package/libksba/Config.in"
 source "package/libmcrypt/Config.in"
 source "package/libmhash/Config.in"
 source "package/libnss/Config.in"
diff --git a/package/libksba/Config.in b/package/libksba/Config.in
new file mode 100644
index 0000000..780fed9
--- /dev/null
+++ b/package/libksba/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBKSBA
+	bool "libksba"
+	select BR2_PACKAGE_LIBGPG_ERROR
+	help
+	  CMS and X.509 library
+
+	  https://www.gnupg.org/related_software/libksba/
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
new file mode 100644
index 0000000..431a03d
--- /dev/null
+++ b/package/libksba/libksba.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libksba
+#
+################################################################################
+
+LIBKSBA_VERSION = 1.3.0
+LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
+LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
+LIBKSBA_LICENSE = Mixture of GPL and LGPL licenses
+LIBKSBA_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
+LIBKSBA_INSTALL_STAGING = YES
+LIBKSBA_DEPENDENCIES = libgpg-error
+LIBKSBA_CONF_OPT = --with-gpg-error-prefix=$(STAGING_DIR)/usr
+
+$(eval $(autotools-package))
-- 
1.7.1
