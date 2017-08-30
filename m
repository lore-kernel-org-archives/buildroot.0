From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:08:21 +0200
Subject: [Buildroot] [git commit] libgcrypt: security bump to version 1.7.9
Message-ID: <20170830200103.60869800D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd4514109a6bd248d6ca7713d97e3b257ae91c6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-0379: Mitigate a local side-channel attack on Curve25519
dubbed "May the Fourth be With You".

As we are close to release, don't update to the latest 1.8.1 version,
but to a maintenance release from the 1.7 branch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgcrypt/libgcrypt.hash | 6 ++----
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 8ac9f0a..56a45c5 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,3 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000408.html
-sha1  65a4a495aa858483e66868199eaa8238572ca6cd  libgcrypt-1.7.8.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.7.8.tar.bz2.sig
-sha256  948276ea47e6ba0244f36a17b51dcdd52cfd1e664b0a1ac3bc82134fb6cec199  libgcrypt-1.7.8.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.7.9.tar.bz2.sig
+sha256  bfe9bb703c1126c3647da2810fd23039c2f09d46969f71612c2065dc3fa9373b  libgcrypt-1.7.9.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index bc194ad..fe3ac5c 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.7.8
+LIBGCRYPT_VERSION = 1.7.9
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
