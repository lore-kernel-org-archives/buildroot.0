From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 19 Oct 2011 09:34:17 +0200
Subject: [Buildroot] [PATCH 4 of 5] python config: move configuration into
	menu
In-Reply-To: <patchbomb.1318602115@devws108>
References: <patchbomb.1318602115@devws108>
Message-ID: <7da9728c48a268ae7b8d.1318602119@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
