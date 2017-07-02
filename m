From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:03:48 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] libgcrypt: security bump
	to version 1.7.8
Message-ID: <20170702150253.8A85081D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3697347ca234414107dcd26102dc5833664f4629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

From the NEWS file:

- Mitigate a flush+reload side-channel attack on RSA secret keys
  dubbed "Sliding right into disaster".  For details see
  <https://eprint.iacr.org/2017/627>.  [CVE-2017-7526]

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 10ce9c6f8d3567c2e423907d3c5b008a97c9cdfa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 9 +++++----
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 5a833d5..8ac9f0a 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,4 +1,5 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000406.html
-sha1  ea4ae1a4dba51f15095319419d7b42a0bf160384  libgcrypt-1.7.7.tar.bz2
-# Locally calculated
-sha256  b9b85eba0793ea3e6e66b896eb031fa05e1a4517277cc9ab10816b359254cd9a  libgcrypt-1.7.7.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000408.html
+sha1  65a4a495aa858483e66868199eaa8238572ca6cd  libgcrypt-1.7.8.tar.bz2
+# Locally calculated after checking signature
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.7.8.tar.bz2.sig
+sha256  948276ea47e6ba0244f36a17b51dcdd52cfd1e664b0a1ac3bc82134fb6cec199  libgcrypt-1.7.8.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 4374032..bc194ad 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.7.7
+LIBGCRYPT_VERSION = 1.7.8
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
