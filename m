From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 17 Nov 2011 20:42:01 +0100
Subject: [Buildroot] [PATCH 4 of 5 v2] python config: move configuration
	into menu
In-Reply-To: <patchbomb.1321557989@devws108>
References: <patchbomb.1321557989@devws108>
Message-ID: <97f99d539f586caa8660.1321557993@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

# HG changeset patch
# User Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
# Date 1318517686 -7200
# Node ID 97f99d539f586caa866009c9702596c63f3637fe
# Parent  76f1a5eeba5e79cb841338d5317e3c618bf7c93c
python config: move configuration into menu

Group all Python-related configuration in a separate menuconfig.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/python/Config.in |  8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,4 +1,7 @@
-config BR2_PACKAGE_PYTHON
+comment "python requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
+menuconfig BR2_PACKAGE_PYTHON
 	bool "python"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBFFI
@@ -7,9 +10,6 @@ config BR2_PACKAGE_PYTHON
 
 	  http://www.python.org/
 
-comment "python requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
-
 if BR2_PACKAGE_PYTHON
 
 choice
