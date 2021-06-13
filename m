From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 09:26:11 +0200
Subject: [Buildroot] [git commit] package/neon: requires DES and MD4 support
 in openssl
Message-ID: <20210613065532.CC3D78D29A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17a0eb0efc6325472c1a326f16651ffd57ae2874
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES and MD4 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/9145df89497df52c7124b82525b76d365aa92fc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
