From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:05:55 +0200
Subject: [Buildroot] [git commit] package/php: requires DES support in
 openssl
Message-ID: <20210717073211.38E8A91153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=2b2f635733999918d359d6cd611ef07c2ec4bacc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/c10800fde50b123809557ed50e0a86acb59404a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/Config.ext | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 3a65f70b86..83bb3c481f 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -92,6 +92,7 @@ config BR2_PACKAGE_PHP_EXT_MCRYPT
 config BR2_PACKAGE_PHP_EXT_OPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
