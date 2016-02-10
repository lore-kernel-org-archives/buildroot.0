From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Feb 2016 08:06:25 -0300
Subject: [Buildroot] [PATCH] libgcrypt: security bump to version 1.6.5
Message-ID: <1455102385-18073-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-7511 - Mitigate side-channel attack on ECDH with Weierstrass
curves.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgcrypt/libgcrypt.hash | 6 ++++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index e845a51..272d332 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,2 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2015-09/msg00000.html
-sha1 ed52add1ce635deeb2f5c6650e52667debd4ec70  libgcrypt-1.6.4.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2016q1/000384.html
+sha1	c3a5a13e717f7b3e3895650afc1b6e0d3fe9c726	libgcrypt-1.6.5.tar.bz2
+# Calculated based on the hash above
+sha256	f49ebc5842d455ae7019def33eb5a014a0f07a2a8353dc3aa50a76fd1dafa924	libgcrypt-1.6.5.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 53d1d6c..7c27a22 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.6.4
+LIBGCRYPT_VERSION = 1.6.5
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.4.10
