From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed, 18 Apr 2018 16:24:34 +0200
Subject: [Buildroot] [PATCH 3/3] dropbear: Disable insecure options
In-Reply-To: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
References: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
Message-ID: <20180418142434.7268-3-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default dropbear configuration includes a number of features no longer
considered secure, so disable
  3DES cipher
  MD5 integrity algorithm
  SHA1-96 integrity algorithm
  DSS key exchange algorithm
  DH Group1 key exchange algorithm

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/dropbear/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 441c521d18..c5acd333a8 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -71,7 +71,7 @@ config BR2_PACKAGE_DROPBEAR_CIPHER_AES256
 
 config BR2_PACKAGE_DROPBEAR_CIPHER_3DES
 	bool "3DES"
-	default y
+	default n
 	help
 	  Enable the 3DES cipher
 
@@ -99,7 +99,7 @@ menu "Dropbear cipher modes"
 
 config BR2_PACKAGE_DROPBEAR_CIPHER_MODE_CBC
 	bool "CBC"
-	default y
+	default n
 	help
 	  Enable CBC mode for ciphers. This has security issues though
 	  is the most compatible with older SSH implementations
@@ -124,7 +124,7 @@ config BR2_PACKAGE_DROPBEAR_HMAC_SHA1
 
 config BR2_PACKAGE_DROPBEAR_HMAC_SHA1_96
 	bool "SHA1-96"
-	default y
+	default n
 	help
 	  Enable SHA1-96 integrity algorithm
 
@@ -142,7 +142,7 @@ config BR2_PACKAGE_DROPBEAR_HMAC_SHA2_512
 
 config BR2_PACKAGE_DROPBEAR_HMAC_MD5
 	bool "MD5"
-	default y
+	default n
 	help
 	  Enable MD5 integrity algorithm. If you disable MD5, Dropbear
 	  will fall back to SHA1 fingerprints, which are not the
@@ -160,7 +160,7 @@ config BR2_PACKAGE_DROPBEAR_KEX_RSA
 
 config BR2_PACKAGE_DROPBEAR_KEX_DSS
 	bool "DSS"
-	default y
+	default n
 	help
 	  Enable DSS key exchange algorithm. SSH2 RFC Draft requires
 	  DSS.
@@ -188,7 +188,7 @@ config BR2_PACKAGE_DROPBEAR_KEX_ECDH
 
 config BR2_PACKAGE_DROPBEAR_KEX_DH_GROUP1
 	bool "DH Group1"
-	default y
+	default n
 	help
 	  Enable DH Group1 key exchange algorithm. Group1 is less
 	  secure (1024 bit) than Group14 though is the only option for
-- 
2.17.0
