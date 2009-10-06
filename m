From: Daniel Mack <daniel@caiaq.de>
Date: Tue,  6 Oct 2009 18:53:34 +0800
Subject: [Buildroot] [PATCH] e2fsprogs: add a patch to link against SEM_INIT
	libs
In-Reply-To: <1254826414-20763-1-git-send-email-daniel@caiaq.de>
References: <1254826414-20763-1-git-send-email-daniel@caiaq.de>
Message-ID: <1254826414-20763-2-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is needed to make e2fsprogs being linked against
SEM_INIT libraries. In this particular case, it causes the
Makefiles to add -lpthread. Without that, all binaries crash
at startup, at least on x86.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 .../e2fsprogs/e2fsprogs-1.41.9-sem-init-libs.patch |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 package/e2fsprogs/e2fsprogs-1.41.9-sem-init-libs.patch

diff --git a/package/e2fsprogs/e2fsprogs-1.41.9-sem-init-libs.patch b/package/e2fsprogs/e2fsprogs-1.41.9-sem-init-libs.patch
new file mode 100644
index 0000000..56f1cc2
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-1.41.9-sem-init-libs.patch
@@ -0,0 +1,11 @@
+--- e2fsprogs-1.41.9/MCONFIG.in.orig	2009-10-07 20:25:07.000000000 +0800
++++ e2fsprogs-1.41.9/MCONFIG.in	2009-10-07 20:21:41.000000000 +0800
+@@ -85,7 +85,7 @@
+ #
+ LIB = $(top_builddir)/lib
+ LIBSS = $(LIB)/libss at LIB_EXT@ @PRIVATE_LIBS_CMT@ @DLOPEN_LIB@
+-LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @PRIVATE_LIBS_CMT@ @SEM_INIT_LIB@
++LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @SEM_INIT_LIB@
+ LIBE2P = $(LIB)/libe2p at LIB_EXT@
+ LIBEXT2FS = $(LIB)/libext2fs at LIB_EXT@
+ LIBUUID = @LIBUUID@ @SOCKET_LIB@
-- 
1.6.0.4
