From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Dec 2019 19:11:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: libargon2 needs dynamic library
Message-ID: <20191204181141.2185407-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/72412a68da44d7ecc87656436a17542cafcf1f95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/Config.ext | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index d5c723ca39..b3d6088f54 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -70,8 +70,12 @@ config BR2_PACKAGE_PHP_EXT_HASH
 	help
 	  HASH message digest framework
 
+comment "libargon2 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PHP_EXT_LIBARGON2
 	bool "libargon2"
+	depends on !BR2_STATIC_LIBS # libargon2
 	select BR2_PACKAGE_LIBARGON2
 	help
 	  libargon2 support
-- 
2.24.0
