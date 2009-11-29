From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Nov 2009 21:25:49 +0100
Subject: [Buildroot] [git commit master] package/fltk: needs C++ support in
	toolchain
Message-ID: <20091129203528.7C963777F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ade675c55a575f3a78369bc2b98f5ad0d5b540d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/fltk/Config.in |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index d37b582..30eaac9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2009.11, Not released yet:
 
-	Updated/fixed packages: busybox, dbus, gvfs, ltrace
+	Updated/fixed packages: busybox, dbus, fltk, gvfs, ltrace
 
 2009.11-rc1, Released November 23rd, 2009:
 
diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index b0ffb4e..546ecb0 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_FLTK
 	bool "fltk"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
 	help
 	  A cross-platform C++ GUI toolkit for UNIX/Linux (X11),
 	  Microsoft Windows, and MacOS X.
 
 	  http://www.fltk.org/
+
+comment "fltk requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_XORG7
-- 
1.6.3.3
