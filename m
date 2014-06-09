From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:58:37 +0200
Subject: [Buildroot] [git commit] libksba: new package
Message-ID: <20140609125854.E3D7D9CF7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe70a288f119eff4dca8e6564618516d49829ab6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix license informations.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/libksba/Config.in  |    7 +++++++
 package/libksba/libksba.mk |   16 ++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e234054..66142bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -536,6 +536,7 @@ source "package/libassuan/Config.in"
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
index 0000000..bbd3980
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
+LIBKSBA_LICENSE = LGPLv3+ or GPLv2+ (library, headers), GPLv3+ (manual, tests, build system)
+LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
+LIBKSBA_INSTALL_STAGING = YES
+LIBKSBA_DEPENDENCIES = libgpg-error
+LIBKSBA_CONF_OPT = --with-gpg-error-prefix=$(STAGING_DIR)/usr
+
+$(eval $(autotools-package))
