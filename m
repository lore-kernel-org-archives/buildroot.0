From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 19:59:48 +0200
Subject: [Buildroot] [PATCH 6/7] sysstat: bump to 9.1.5 and comply with new
	libtool policy
In-Reply-To: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
References: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284832789-22631-7-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <lionel.landwerlin@pace.com>

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
---
 ...t-9.5.1-add-missing-lintl-to-linker-flags.patch |   25 ++++++++++++++++++++
 package/sysstat/sysstat.mk                         |    8 +----
 2 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 package/sysstat/sysstat-9.5.1-add-missing-lintl-to-linker-flags.patch

diff --git a/package/sysstat/sysstat-9.5.1-add-missing-lintl-to-linker-flags.patch b/package/sysstat/sysstat-9.5.1-add-missing-lintl-to-linker-flags.patch
new file mode 100644
index 0000000..d9b7cf0
--- /dev/null
+++ b/package/sysstat/sysstat-9.5.1-add-missing-lintl-to-linker-flags.patch
@@ -0,0 +1,25 @@
+From fff3734146edf3ff6e2627dba729aa30d1faf8da Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.landwerlin@pace.com>
+Date: Fri, 17 Sep 2010 17:10:17 +0200
+Subject: [PATCH] Add missing -lintl to linker flags
+
+Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
+---
+ Makefile.in |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 5dac5c7..6821cce 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -87,6 +87,7 @@ REQUIRE_NLS = -DUSE_NLS -DPACKAGE=\"$(PACKAGE)\" -DLOCALEDIR=\"$(NLS_DIR)\"
+ endif
+ ifdef REQUIRE_NLS
+    DFLAGS += $(REQUIRE_NLS)
++   LFLAGS += -lintl
+ endif
+ INSTALL_CRON = @INSTALL_CRON@
+ CRON_OWNER = @CRON_OWNER@
+-- 
+1.6.0.6
+
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 324580e..846eeec 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,17 +4,13 @@
 #
 #############################################################
 
-SYSSTAT_VERSION = 9.0.5
+SYSSTAT_VERSION = 9.1.5
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
-SYSSTAT_AUTORECONF = NO
-SYSSTAT_LIBTOOL_PATCH = NO
 SYSSTAT_INSTALL_STAGING = NO
 SYSSTAT_INSTALL_TARGET = YES
 
-# Should be --disable-man-group, it might be a little mistake in the
-# configure.in script.
-SYSSTAT_CONF_OPT = --enable-man-group
+SYSSTAT_CONF_OPT = --disable-man-group
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SYSSTAT_CONF_OPT += --disable-documentation
 endif
-- 
1.7.1
