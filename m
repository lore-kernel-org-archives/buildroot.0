From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:30 -0400
Subject: [Buildroot] [PATCH 03/13] hostapd: add libressl-support.patch
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-4-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: https://github.com/gentoo/libressl/blob/master/net-wireless/hostapd/files/hostapd-2.6-libressl.patch
Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/hostapd/0001-fix-libressl-support.patch | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/hostapd/0001-fix-libressl-support.patch

diff --git a/package/hostapd/0001-fix-libressl-support.patch b/package/hostapd/0001-fix-libressl-support.patch
new file mode 100644
index 0000000000..5e8d7afeff
--- /dev/null
+++ b/package/hostapd/0001-fix-libressl-support.patch
@@ -0,0 +1,38 @@
+From 85c1ae0865c7221af98a60cc678c03c78d443389 Mon Sep 17 00:00:00 2001
+From: Aric Belsito <lluixhi@gmail.com>
+Date: Fri, 4 Aug 2017 13:02:17 -0400
+Subject: [PATCH] fix libressl support
+
+From: https://github.com/gentoo/libressl/blob/master/net-wireless/hostapd/files/hostapd-2.6-libressl.patch
+
+Original Author: Aric Belsito <lluixhi@gmail.com>
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ src/crypto/crypto_openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/crypto/crypto_openssl.c b/src/crypto/crypto_openssl.c
+index 19e0e2b..b3d1b07 100644
+--- a/src/crypto/crypto_openssl.c
++++ b/src/crypto/crypto_openssl.c
+@@ -611,7 +611,7 @@ void crypto_cipher_deinit(struct crypto_cipher *ctx)
+ 
+ void * dh5_init(struct wpabuf **priv, struct wpabuf **publ)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	DH *dh;
+ 	struct wpabuf *pubkey = NULL, *privkey = NULL;
+ 	size_t publen, privlen;
+@@ -712,7 +712,7 @@ err:
+ 
+ void * dh5_init_fixed(const struct wpabuf *priv, const struct wpabuf *publ)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	DH *dh;
+ 
+ 	dh = DH_new();
+-- 
+2.13.3
+
-- 
2.13.6
