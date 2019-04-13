From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:12:25 +0200
Subject: [Buildroot] [git commit] package/efl: bump to version 1.22.0
Message-ID: <20190413190814.034B9884A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6acb3c090485f06ab567ec8d389c934f49e8650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream commit.

https://www.enlightenment.org/news/efl-1.22.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch | 34 ----------------------
 package/efl/efl.hash                               |  4 +--
 package/efl/efl.mk                                 |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch b/package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch
deleted file mode 100644
index b64a200ffb..0000000000
--- a/package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d045dd99acdd47be238642d4f9384dccacde2b42 Mon Sep 17 00:00:00 2001
-From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
-Date: Sat, 15 Dec 2018 16:19:01 +0000
-Subject: [PATCH] evas gl - make GLintptr etc. also ndefed for GL_VERSION_1_5
- fix typedef
-
-It seems that GL_VERSION_1_5 define == these provided by gl already. At
-least reading the mesa headers I do, so this should fix T7502
-
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
----
- src/lib/evas/Evas_GL.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/lib/evas/Evas_GL.h b/src/lib/evas/Evas_GL.h
-index fa3e6f4..5524d82 100644
---- a/src/lib/evas/Evas_GL.h
-+++ b/src/lib/evas/Evas_GL.h
-@@ -4272,9 +4272,11 @@ typedef signed int       GLfixed;      // Changed khronos_int32_t
- 
- #ifndef GL_ES_VERSION_2_0
- /* GL types for handling large vertex buffer objects */
--#include <stddef.h>
-+# ifndef GL_VERSION_1_5
-+#  include <stddef.h>
- typedef ptrdiff_t GLintptr;     // Changed khronos_intptr_t
- typedef ptrdiff_t GLsizeiptr;   // Changed khronos_ssize_t
-+# endif
- #endif
- 
- /* Some definitions from GLES 3.0.
--- 
-2.14.1
-
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index bbefdeec66..18d867bfe4 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.21.1.tar.xz.sha256
-sha256 44774b42b3dbbbe4d124c8fddcd169c6ffab9d602d1a757abcfb9a84e001a928 efl-1.21.1.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.22.0.tar.xz.sha256
+sha256 6ac87450cb55a5948c550dbeb05464f5fc1b0616c52dcb1cb2efbda73999c8ef efl-1.22.0.tar.xz
 
 sha256 d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
 sha256 1f0597d326e2fdb54aa2f0caec6d8bb0afb9941ef32475f017ed02ca214fcf37  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index c4fd676be1..ecc31f84c4 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.21.1
+EFL_VERSION = 1.22.0
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
