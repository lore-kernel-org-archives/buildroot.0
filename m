From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  5 Sep 2017 13:27:41 +0300
Subject: [Buildroot] [PATCH] e2fsprogs: remove unneeded patch
Message-ID: <f8a6a05d98b19227a150f07af7ac04877803fb4c.1504607261.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 44b5637ab2 (e2fsprogs: add a patch to link against SEM_INIT libs)
introduced a patch that effectively adds -lpthread to the link command
with libcom_err. Today the only libc with separate libpthread is glibc
that does not support static build. The generated libcom_err.so.2.1
library links with libpthread with or without this patch. Drop this
patch.

Cc: Daniel Mack <daniel@zonque.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/e2fsprogs/0001-sem-init-libs.patch | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 package/e2fsprogs/0001-sem-init-libs.patch

diff --git a/package/e2fsprogs/0001-sem-init-libs.patch b/package/e2fsprogs/0001-sem-init-libs.patch
deleted file mode 100644
index 56f1cc2c1595..000000000000
--- a/package/e2fsprogs/0001-sem-init-libs.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- e2fsprogs-1.41.9/MCONFIG.in.orig	2009-10-07 20:25:07.000000000 +0800
-+++ e2fsprogs-1.41.9/MCONFIG.in	2009-10-07 20:21:41.000000000 +0800
-@@ -85,7 +85,7 @@
- #
- LIB = $(top_builddir)/lib
- LIBSS = $(LIB)/libss at LIB_EXT@ @PRIVATE_LIBS_CMT@ @DLOPEN_LIB@
--LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @PRIVATE_LIBS_CMT@ @SEM_INIT_LIB@
-+LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @SEM_INIT_LIB@
- LIBE2P = $(LIB)/libe2p at LIB_EXT@
- LIBEXT2FS = $(LIB)/libext2fs at LIB_EXT@
- LIBUUID = @LIBUUID@ @SOCKET_LIB@
-- 
2.14.1
