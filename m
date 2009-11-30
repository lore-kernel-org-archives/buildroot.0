From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Nov 2009 11:00:28 +0100
Subject: [Buildroot] [git commit master] package/fltk: needs libXt
Message-ID: <20091130100144.D7C7A777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b48fb8c4aaf83336a3be2133de423f552c5960f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #707

At the same time get rid of redundant (provided by Makefile.autotools.in)
configure arguments.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |   10 ++++++++++
 package/fltk/Config.in |    1 +
 package/fltk/fltk.mk   |    8 +++-----
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7a5535a..e250a1c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2009.11, Not yet released:
+
+	Additional fixes and cleanups.
+
+	Updated/fixed packages: fltk
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#707: Cant configure fltk-1.1.7. configure: error: Configure could ...
+
 2009.11-rc2, Released November 29th, 2009:
 
 	Additional fixes and cleanups.
diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index 546ecb0..eff72b5 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLTK
 	bool "fltk"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXT
 	help
 	  A cross-platform C++ GUI toolkit for UNIX/Linux (X11),
 	  Microsoft Windows, and MacOS X.
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 3a5233b..b323c59 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -14,10 +14,8 @@ FLTK_INSTALL_TARGET = YES
 FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 
-FLTK_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--sysconfdir=/etc --enable-shared --enable-threads --with-x
+FLTK_CONF_OPT = --enable-shared --enable-threads --with-x
 
-FLTK_DEPENDENCIES = xserver_xorg-server
+FLTK_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
-$(eval $(call AUTOTARGETS,package,fltk))
\ No newline at end of file
+$(eval $(call AUTOTARGETS,package,fltk))
-- 
1.6.3.3
