From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Jun 2018 11:21:52 +0300
Subject: [Buildroot] [PATCH] libgcrypt: security bump to version 1.8.3
Message-ID: <bf4e05477fe72a516766776e7cdf6fe4a77b3e19.1529050912.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-0495: ECDSA signing side-channel attack.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgcrypt/libgcrypt.hash | 8 ++++----
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 736332d3505c..dce6522959da 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,6 +1,6 @@
-# From https://www.gnupg.org/download/integrity_check.html
-sha1 ab8aae5d7a68f8e0988f90e11e7f6a4805af5c8d  libgcrypt-1.8.2.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000426.html
+sha1 13bd2ce69e59ab538e959911dfae80ea309636e3  libgcrypt-1.8.3.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.2.tar.bz2.sig
-sha256  c8064cae7558144b13ef0eb87093412380efa16c4ee30ad12ecb54886a524c07  libgcrypt-1.8.2.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.3.tar.bz2.sig
+sha256  66ec90be036747602f2b48f98312361a9180c97c68a690a5f376fa0f67d0af7c  libgcrypt-1.8.3.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 00e864e836a2..f25944da6455 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.8.2
+LIBGCRYPT_VERSION = 1.8.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.17.1
