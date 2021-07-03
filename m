From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:12:05 +0200
Subject: [Buildroot] [git commit] package/libgcrypt: security bump to
 version 1.9.3
Message-ID: <20210703204039.ED1488F469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=878b57ca3b80d63106ec1398932d2e0ebd18c0c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-33560: Libgcrypt before 1.8.8 and 1.9.x before 1.9.3
mishandles ElGamal encryption because it lacks exponent blinding to
address a side-channel attack against mpi_powm, and the window size is
not chosen appropriately. (There is also an interoperability problem
because the selection of the k integer value does not properly consider
the differences between basic ElGamal encryption and generalized ElGamal
encryption.) This, for example, affects use of ElGamal in OpenPGP.

https://dev.gnupg.org/T5305

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgcrypt/libgcrypt.hash | 6 +++---
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 978ec8b294..26ec492e10 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,7 +1,7 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  29bd5d0a8f674d4521167dd518ef99b26d1e8f27  libgcrypt-1.9.2.tar.bz2
+sha1  6b18f453fee677078586279d96fb88e5df7b3f35  libgcrypt-1.9.3.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.2.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.3.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  b2c10d091513b271e47177274607b1ffba3d95b188bbfa8797f948aec9053c5a  libgcrypt-1.9.2.tar.bz2
+sha256  97ebe4f94e2f7e35b752194ce15a0f3c66324e0ff6af26659bbfb5ff2ec328fd  libgcrypt-1.9.3.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 9c1cd32acb..26be5d2f49 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.9.2
+LIBGCRYPT_VERSION = 1.9.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
