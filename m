From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 18 Aug 2016 08:43:03 +0300
Subject: [Buildroot] [PATCH] libgcrypt: security bump to version to version
	1.7.3
Message-ID: <5d03002e20fce24f208b804c7f2d68c0955e325c.1471498983.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-6316: Bug in the mixing functions of Libgcrypt's random number
generator. An attacker who obtains 4640 bits from the RNG can trivially
predict the next 160 bits of output.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgcrypt/libgcrypt.hash | 6 +++---
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 63148d4a15b0..885f83172b67 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2016q3/000392.html
-sha1 85a6a936bcab4c3c05f5efbf6ce847f23d35c0c4  libgcrypt-1.7.2.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2016-08/msg00008.html
+sha1 5a034291e7248592605db448481478e6c963aa9c  libgcrypt-1.7.3.tar.bz2
 # Calculated based on the hash above
-sha256 3d35df906d6eab354504c05d749a9b021944cb29ff5f65c8ef9c3dd5f7b6689f  libgcrypt-1.7.2.tar.bz2
+sha256 ddac6111077d0a1612247587be238c5294dd0ee4d76dc7ba783cc55fb0337071  libgcrypt-1.7.3.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 5ee488dd8e34..31f4d6cdf375 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.7.2
+LIBGCRYPT_VERSION = 1.7.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.8.1
