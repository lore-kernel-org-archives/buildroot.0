From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 23:46:12 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] libgcrypt: security bump
	to version 1.7.7
Message-ID: <20170606214725.2AD0F82894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a0cd7af8d8af315b9aa7ce1d55a020f4c9d1497
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Fix possible timing attack on EdDSA session key.

https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000406.html

Add upstream provided SHA1 hash.

Switch to https download for better corporate firewall compatibility.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 869c8dfd7bd37bd11a903cadf065a1963fb8f887)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 4 +++-
 package/libgcrypt/libgcrypt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 48bbd6a..5a833d5 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,2 +1,4 @@
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000406.html
+sha1  ea4ae1a4dba51f15095319419d7b42a0bf160384  libgcrypt-1.7.7.tar.bz2
 # Locally calculated
-sha256  626aafee84af9d2ce253d2c143dc1c0902dda045780cc241f39970fc60be05bc  libgcrypt-1.7.6.tar.bz2
+sha256  b9b85eba0793ea3e6e66b896eb031fa05e1a4517277cc9ab10816b359254cd9a  libgcrypt-1.7.7.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 0ae4c6f..4374032 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.7.6
+LIBGCRYPT_VERSION = 1.7.7
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
+LIBGCRYPT_SITE = https://gnupg.org/ftp/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
