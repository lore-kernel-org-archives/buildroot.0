From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:40:59 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libgcrypt: security bump
 to version 1.8.3
Message-ID: <20180617155627.57CF4826A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cde3ec2378568670a2ea05c5d41d2572af781034
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-0495: ECDSA signing side-channel attack.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b6543b5fdfb17adc81af33cad8133bb86e31748f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 8 ++++----
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 736332d350..dce6522959 100644
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
index 00e864e836..f25944da64 100644
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
