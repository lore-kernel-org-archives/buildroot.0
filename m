From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sat, 17 Nov 2012 09:26:54 +0100
Subject: [Buildroot] [PATCH] libffi: Needs threads support in toolchain
Message-ID: <1353140814-26164-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/7ee57d01917ea72d1811469e482513dda2ceb1ea/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/libffi/Config.in   |    1 +
 package/libglib2/Config.in |    1 +
 package/python/Config.in   |    1 +
 package/python3/Config.in  |    1 +
 4 files changed, 4 insertions(+)

diff --git a/package/libffi/Config.in b/package/libffi/Config.in
index 7211f8f..6c7688c 100644
--- a/package/libffi/Config.in
+++ b/package/libffi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFFI
 	bool "libffi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The libffi library provides a portable, high level
 	  programming interface to various calling conventions. This
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 5282885..7b1040c 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
diff --git a/package/python/Config.in b/package/python/Config.in
index 4089cce..af80ec4 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 2e1e98b..4f5e67d 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
-- 
1.7.9.5
