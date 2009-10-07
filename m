From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 7 Oct 2009 15:31:32 +0200
Subject: [Buildroot] [git commit master] e2fsprogs: add a patch to link
	against SEM_INIT libs
Message-ID: <20091007135643.0424D77701@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=44b5637ab28306dcd6f7a46aae56bdcf6284b3e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is needed to make e2fsprogs being linked against
SEM_INIT libraries. In this particular case, it causes the
Makefiles to add -lpthread. Without that, all binaries crash
at startup, at least on x86.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
