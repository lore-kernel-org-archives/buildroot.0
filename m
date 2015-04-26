From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 14:36:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/libedit: bump version to
	20150325-3.1
Message-ID: <1430051767-14374-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libedit/0001-check-bsd-functions-in-libbsd.patch |    4 +++-
 package/libedit/Config.in                                |    7 ++++---
 package/libedit/libedit.mk                               |    8 +++++++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/libedit/0001-check-bsd-functions-in-libbsd.patch b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
index 21c57f8..de452a5 100644
--- a/package/libedit/0001-check-bsd-functions-in-libbsd.patch
+++ b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
@@ -1,11 +1,13 @@
 configure: on Linux, the BSD functions require linking against libbsd
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+(Rebased against 20150325-3.1)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -durN libedit-20130712-3.1.orig/configure.ac libedit-20130712-3.1/configure.ac
 --- libedit-20130712-3.1.orig/configure.ac	2013-07-12 20:39:22.000000000 +0200
 +++ libedit-20130712-3.1/configure.ac	2013-07-28 23:35:35.012676469 +0200
-@@ -108,6 +108,10 @@
+@@ -117,6 +117,10 @@
  #AC_FUNC_REALLOC
  AC_TYPE_SIGNAL
  AC_FUNC_STAT
diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index a70f9eb..7c85014 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -10,10 +10,11 @@ config BR2_PACKAGE_LIBEDIT
 	  The official homepage is at:
 	  http://ftp.netbsd.org/pub/NetBSD/NetBSD-release-5-0/src/lib/libedit/
 
-	  Jess Thrysoee maintains an autotoolified packaged, which we use
+	  Jess Thrysoee maintains an autotoolified package, which we use
 	  in Buildroot as it makes it much simpler than using the upstream
-	  sources which require pmake:
-	  http://www.thrysoee.dk/editline/
+	  sources which require pmake.
+
+	  http://www.thrysoee.dk/editline
 
 comment "libedit needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 8cadd9b..d4692ea 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20130712-3.1
+LIBEDIT_VERSION = 20150325-3.1
 LIBEDIT_SITE = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
@@ -14,6 +14,12 @@ LIBEDIT_LICENSE_FILES = COPYING
 # We're patching configure.ac
 LIBEDIT_AUTORECONF = YES
 
+# Needed for autoreconf to work properly
+define LIBEDIT_FIXUP_M4_DIR
+	mkdir $(@D)/m4
+endef
+LIBEDIT_POST_EXTRACT_HOOKS += LIBEDIT_FIXUP_M4_DIR
+
 # Doesn't really support !wchar, but support is disabled otherwise
 LIBEDIT_CONF_OPTS += --enable-widec
 
-- 
1.7.10.4
