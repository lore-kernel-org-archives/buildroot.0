From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jul 2021 09:12:53 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/libtasn1:
 security bump to version 4.17.0
Message-ID: <20210714064749.D2D1290E35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=397289af77071d8e46941b8f23958db3dec2f01c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

- Fix some clang issues due to illegal pointers, thanks to Stefan Weil.
- Fix memory leak caught by oss-fuzz, thanks to Dmitry Baryshkov.
- Fix bugs unveiled by Static Analysis, reported by Simo Sorce.

- LICENSE has been renamed to COPYING since
  https://gitlab.com/gnutls/libtasn1/-/commit/a72a8d1ef13436bf8916097f11c3fc90f07ba911

https://gitlab.com/gnutls/libtasn1/-/blob/v4.17.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b36ad0306366d2c9fca8f681ff5be40c7bb54a15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtasn1/libtasn1.hash | 6 +++---
 package/libtasn1/libtasn1.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 93cfa1a68b..fc3610b965 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.16.0.tar.gz.sig
-sha256  0e0fb0903839117cb6e3b56e68222771bebf22ad7fc2295a0ed7d576e8d4329d  libtasn1-4.16.0.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.17.0.tar.gz.sig
+sha256  ece7551cea7922b8e10d7ebc70bc2248d1fdd73351646a2d6a8d68a9421c45a5  libtasn1-4.17.0.tar.gz
 # Locally calculated
-sha256  7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6  LICENSE
+sha256  7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  doc/COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index a354716824..d9d14fde83 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.16.0
+LIBTASN1_VERSION = 4.17.0
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
-LIBTASN1_LICENSE_FILES = LICENSE doc/COPYING doc/COPYING.LESSER
+LIBTASN1_LICENSE_FILES = COPYING doc/COPYING doc/COPYING.LESSER
 LIBTASN1_CPE_ID_VENDOR = gnu
 LIBTASN1_INSTALL_STAGING = YES
 
