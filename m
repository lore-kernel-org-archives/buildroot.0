From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 22:28:01 +0100
Subject: [Buildroot] [git commit] package/php: properly propagate libargon2
 dependencies
Message-ID: <20191205213429.E393488136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba34e47004756133f3199c0785ccb6c46530fe17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/72412a68da44d7ecc87656436a17542cafcf1f95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/Config.ext | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index d5c723ca39..6a9634391c 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -70,8 +70,14 @@ config BR2_PACKAGE_PHP_EXT_HASH
 	help
 	  HASH message digest framework
 
+comment "libargon2 needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PHP_EXT_LIBARGON2
 	bool "libargon2"
+	depends on BR2_USE_MMU # libargon2
+	depends on !BR2_STATIC_LIBS # libargon2
 	select BR2_PACKAGE_LIBARGON2
 	help
 	  libargon2 support
