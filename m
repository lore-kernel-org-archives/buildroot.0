From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Feb 2021 23:05:01 +0100
Subject: [Buildroot] [git commit] package/libxcrypt: bump version to 4.4.18
Message-ID: <20210308072136.3FC558893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e827d930f033994fc1e27978d5d5a01a760b8b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which has been merged into mainline.

LICENSING file identifies individual files in the tree, and some have
moved between 4.4.17 and 4.4.18 (upstream commit 3436c6a94b8d).

Fix two -spaces in hash file as well.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[yann.morin.1998 at free.fr:
  - explain license hash change
  - two-spaces in hash file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-alg-gost3411-core.c-fix-conversion-error.patch | 30 ----------------------
 package/libxcrypt/libxcrypt.hash                   |  6 ++---
 package/libxcrypt/libxcrypt.mk                     |  2 +-
 3 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch b/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
deleted file mode 100644
index 1245216aad..0000000000
--- a/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c7bf2cf8e610bb26bece7f3a2bc5b47d7c659c7d Mon Sep 17 00:00:00 2001
-From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
-Date: Sat, 20 Feb 2021 16:51:04 +0100
-Subject: [PATCH] lib/alg-gost3411-core.c: fix conversion error seen by
- sensitive compilers
-
-Some compiler might be sensitive and raise an Warning/error on this line.
-
-Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
-[backported from upstream]
----
- lib/alg-gost3411-2012-core.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/alg-gost3411-2012-core.c b/lib/alg-gost3411-2012-core.c
-index 13bb493..af3a36e 100644
---- a/lib/alg-gost3411-2012-core.c
-+++ b/lib/alg-gost3411-2012-core.c
-@@ -92,7 +92,7 @@ add512(const uint512_u *x, const uint512_u *y, uint512_u *r)
-     for (i = 0; i < 64; i++)
-     {
-         buf = xp[i] + yp[i] + (buf >> 8);
--        rp[i] = (unsigned char) buf & 0xFF;
-+        rp[i] = (unsigned char) (buf & 0xFF);
-     }
- #endif
- }
---
-2.20.1
-
diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index d5d3710b71..bf187413e5 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 7665168d0409574a03f7b484682e68334764c29c21ca5df438955a381384ca07  libxcrypt-4.4.17.tar.gz
-sha256 9178c76310a1136274d485e606ad92b6f8df265fc736642f5421d628214acc76  LICENSING
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  3801f0263a8596b15ec466343fc1fdc4ad4ec7416c51e038a3528fd47f3be01a  libxcrypt-4.4.18.tar.gz
+sha256  f8198fcc4f002bf54512bac2e68e1e3f04af7d105f4f4f98d7d22cb110e04715  LICENSING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index ccbb1a282c..fd33fb7ab5 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.17
+LIBXCRYPT_VERSION = 4.4.18
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
