From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 23:42:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/neon: requires DES and MD4 support
 in openssl
Message-ID: <20210612214231.655042-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable DES and MD4 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/9145df89497df52c7124b82525b76d365aa92fc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neon/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index 983134339b..d055b37607 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_NEON_ZLIB
 config BR2_PACKAGE_NEON_SSL
 	bool "SSL support"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  build with SSL support
 
-- 
2.30.2
