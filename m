From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:31:52 +0200
Subject: [Buildroot] [git commit] e2fsprogs: remove unneeded patch
Message-ID: <20170905192441.CB26881E71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=436291d3f03c5e30610b9f9ac5b797be3348aa45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 44b5637ab2 (e2fsprogs: add a patch to link against SEM_INIT libs)
introduced a patch that effectively adds -lpthread to the link command
with libcom_err. Today the only libc with separate libpthread is glibc
that does not support static build. The generated libcom_err.so.2.1
library links with libpthread with or without this patch. Drop this
patch.

Cc: Daniel Mack <daniel@zonque.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/0001-sem-init-libs.patch | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/e2fsprogs/0001-sem-init-libs.patch b/package/e2fsprogs/0001-sem-init-libs.patch
deleted file mode 100644
index 56f1cc2..0000000
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
