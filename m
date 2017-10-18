From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:36 -0400
Subject: [Buildroot] [PATCH 09/13] libevent: add libressl support patch
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-10-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a program checks for openssl 1.1 or higher, it will pass that
check because libressl sets it's version number to 2.x.

Add simple checks to see if LIBRESSL_VERSION_NUMBER is defined.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/libevent/0002-fix-libressl-support.patch | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/libevent/0002-fix-libressl-support.patch

diff --git a/package/libevent/0002-fix-libressl-support.patch b/package/libevent/0002-fix-libressl-support.patch
new file mode 100644
index 0000000000..ff4ecc3e8a
--- /dev/null
+++ b/package/libevent/0002-fix-libressl-support.patch
@@ -0,0 +1,31 @@
+From 10ca825cf8f52b14b6230db7de5e5df307212499 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Wed, 2 Aug 2017 11:38:11 -0400
+Subject: [PATCH 1/1] add libressl support
+
+When a program checks for openssl 1.1 or higher, it will pass that
+check because libressl sets it's version number to 2.x.
+
+Add simple checks to see if libressl_version_number is defined.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ openssl-compat.h                     | 2 +-
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/openssl-compat.h b/openssl-compat.h
+index 69afc71..937fa4d 100644
+--- a/openssl-compat.h
++++ b/openssl-compat.h
+@@ -1,7 +1,7 @@
+ #ifndef OPENSSL_COMPAT_H
+ #define OPENSSL_COMPAT_H
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined (LIBRESSL_VERSION_NUMBER)
+ 
+ static inline BIO_METHOD *BIO_meth_new(int type, const char *name)
+ {
+-- 
+2.13.3
+
-- 
2.13.6
