From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 22:12:04 +0200
Subject: [Buildroot] [PATCH] package/libopenssl: md5 is not optional
Message-ID: <20210519201204.2693525-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit a83d41867c8d (package/libopenssl: add option to enable some
features) made md5 an optional feature.

However, md5 has nt been optional since 1.1.0, released in 2016.

Drop that option.

Reported-by: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenssl/Config.in     | 4 ----
 package/libopenssl/libopenssl.mk | 1 -
 2 files changed, 5 deletions(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 7ed799075f..fcead4c11a 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -64,10 +64,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
 	bool "enable MD4"
 	default y
 
-config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD5
-	bool "enable MD5"
-	default y
-
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2
 	bool "enable MDC2"
 	default y
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index c7f8ae714e..389a0a8b32 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -90,7 +90,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2),,no-md2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4),,no-md4) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD5),,no-md5) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2),,no-mdc2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2),,no-blake2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA),,no-idea) \
-- 
2.25.1
