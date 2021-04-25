From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Apr 2021 15:54:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfreefare: drop threads dependency
Message-ID: <20210425135454.2460266-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This dependency should have dropped by commit
1a49188a69416542087acd1246b17c0139ff0054 which removed threads
dependency from libnfc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfreefare/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 2bb0c93ddf..b330b2256a 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library for high level manipulation of MIFARE cards.
 
 	  http://nfc-tools.org/index.php?title=Libfreefare
-
-comment "libfreefare needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.30.2
