From: Julian Scheel <julian@jusst.de>
Date: Mon, 25 Apr 2016 10:09:29 +0200
Subject: [Buildroot] [PATCHv2] package/cryptopp: Backport gcc compatibility
	patch
Message-ID: <1461571769-29772-1-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Import patch from cryptopp upstream which fixes the gcc version checks for
using attribute deprecated with messages. Fixes build with host gcc versions <
4.5.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
Changes in v2:
- Add upstream commit url to patch commit msg
- Add signed-off-by to patch commit msg
---
 ...ixed-GCC-version-for-deprecated-attribute.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/cryptopp/0001-Fixed-GCC-version-for-deprecated-attribute.patch

diff --git a/package/cryptopp/0001-Fixed-GCC-version-for-deprecated-attribute.patch b/package/cryptopp/0001-Fixed-GCC-version-for-deprecated-attribute.patch
new file mode 100644
index 0000000..fc9674e
--- /dev/null
+++ b/package/cryptopp/0001-Fixed-GCC-version-for-deprecated-attribute.patch
@@ -0,0 +1,71 @@
+From f707b9ef1688d4429ca6239cf2dc236440974681 Mon Sep 17 00:00:00 2001
+From: Jeffrey Walton <noloader@gmail.com>
+Date: Sun, 27 Dec 2015 23:44:36 -0500
+Subject: [PATCH] Fixed GCC version for deprecated attribute
+
+Taken from cryptopp upstream git:
+https://github.com/weidai11/cryptopp/commit/f707b9ef1688d4429ca6239cf2dc236440974681
+
+Signed-off-by: Julian Scheel <julian@jusst.de>
+
+---
+ default.h  | 8 ++++----
+ eccrypto.h | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/default.h b/default.h
+index 3dfbe7d..00ec664 100644
+--- a/default.h
++++ b/default.h
+@@ -48,7 +48,7 @@ private:
+ 	SecByteBlock m_passphrase;
+ 	CBC_Mode<DefaultBlockCipher>::Encryption m_cipher;
+ 
+-#if (CRYPTOPP_GCC_VERSION >= 40300) || (CRYPTOPP_CLANG_VERSION >= 20800)
++#if (CRYPTOPP_GCC_VERSION >= 40500) || (CRYPTOPP_CLANG_VERSION >= 20800)
+ } __attribute__((deprecated ("DefaultEncryptor will be changing in the near future because the algorithms are no longer secure")));
+ #elif (CRYPTOPP_GCC_VERSION)
+ } __attribute__((deprecated));
+@@ -101,7 +101,7 @@ private:
+ 	member_ptr<FilterWithBufferedInput> m_decryptor;
+ 	bool m_throwException;
+ 
+-#if (CRYPTOPP_GCC_VERSION >= 40300) || (CRYPTOPP_CLANG_VERSION >= 20800)
++#if (CRYPTOPP_GCC_VERSION >= 40500) || (CRYPTOPP_CLANG_VERSION >= 20800)
+ } __attribute__((deprecated ("DefaultDecryptor will be changing in the near future because the algorithms are no longer secure")));
+ #elif (CRYPTOPP_GCC_VERSION)
+ } __attribute__((deprecated));
+@@ -139,7 +139,7 @@ protected:
+ private:
+ 	member_ptr<DefaultMAC> m_mac;
+ 
+-#if (CRYPTOPP_GCC_VERSION >= 40300) || (CRYPTOPP_CLANG_VERSION >= 20800)
++#if (CRYPTOPP_GCC_VERSION >= 40500) || (CRYPTOPP_CLANG_VERSION >= 20800)
+ } __attribute__((deprecated ("DefaultEncryptorWithMAC will be changing in the near future because the algorithms are no longer secure")));
+ #elif (CRYPTOPP_GCC_VERSION)
+ } __attribute__((deprecated));
+@@ -188,7 +188,7 @@ private:
+ 	HashVerifier *m_hashVerifier;
+ 	bool m_throwException;
+ 
+-#if (CRYPTOPP_GCC_VERSION >= 40300) || (CRYPTOPP_CLANG_VERSION >= 20800)
++#if (CRYPTOPP_GCC_VERSION >= 40500) || (CRYPTOPP_CLANG_VERSION >= 20800)
+ } __attribute__((deprecated ("DefaultDecryptorWithMAC will be changing in the near future because the algorithms are no longer secure")));
+ #elif (CRYPTOPP_GCC_VERSION)
+ } __attribute__((deprecated));
+diff --git a/eccrypto.h b/eccrypto.h
+index 94a5d6c..7beaccc 100644
+--- a/eccrypto.h
++++ b/eccrypto.h
+@@ -635,7 +635,7 @@ struct ECIES
+ 	virtual ~ECIES() {}
+ #endif
+ 	
+-#if (CRYPTOPP_GCC_VERSION >= 40300) || (CRYPTOPP_CLANG_VERSION >= 20800)
++#if (CRYPTOPP_GCC_VERSION >= 40500) || (CRYPTOPP_CLANG_VERSION >= 20800)
+ } __attribute__((deprecated ("ECIES will be changing in the near future due to (1) an implementation bug and (2) an interop issue")));
+ #elif (CRYPTOPP_GCC_VERSION)
+ } __attribute__((deprecated));
+-- 
+2.8.0
+
-- 
2.8.0
