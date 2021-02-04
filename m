From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Feb 2021 20:42:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/autofs: bump to version 5.1.7
Message-ID: <20210204194212.1347238-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update hash of license files (correction in FSF address):
  https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=b74dcdd3f6b05522388729141c29286829c302fc
- Update indentation in hash file (two spaces)

https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/tree/CHANGELOG?h=release_5_1_7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lude-linux-nfs.h-directly-in-rpc_sub.patch | 32 -------------------
 package/autofs/autofs.hash                    |  6 ++--
 package/autofs/autofs.mk                      |  2 +-
 3 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch

diff --git a/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch b/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch
deleted file mode 100644
index 26f22653cf..0000000000
--- a/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 44bdce8c6ed9b30c1643e5981172a4f9025f013c Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Wed, 13 Mar 2013 16:17:08 +0100
-Subject: [PATCH] autofs-5.0.7: include linux/nfs.h directly in rpc_subs.h
-
-Fixes compile error with uclibc. Glibc's nfs/nfs.h contains
-nothing but "#include linux/nfs.h". rpc_subs.h already includes
-other linux/nfs*.h files directly.
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Upstream-Status: Pending
----
- include/rpc_subs.h |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/rpc_subs.h b/include/rpc_subs.h
-index b6d59f9..a2d9648 100644
---- a/include/rpc_subs.h
-+++ b/include/rpc_subs.h
-@@ -18,7 +18,7 @@
- 
- #include <rpc/rpc.h>
- #include <rpc/pmap_prot.h>
--#include <nfs/nfs.h>
-+#include <linux/nfs.h>
- #include <linux/nfs2.h>
- #include <linux/nfs3.h>
- 
--- 
-1.7.10.4
-
diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 07432bf769..10ca42ebed 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256 dddee3d9b7388ce6cb7432832dfade25b07ef68ad48dcce01cf247b26a10caef  autofs-5.1.6.tar.xz
+sha256  a36b268611b79b07051749870ba540b139938efc84bc0293244c483e94f9ced7  autofs-5.1.7.tar.xz
 
 # Hash for license files
-sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
-sha256 2ac2e352a92629e3abcdddbd3eeec64e7c2f5b58b6e819ff2c1444fb6e249fa3  COPYRIGHT
+sha256  458028929f712b4795bc5adc31a1d6a2151364ce1b372ac43f613f56c8448fed  COPYING
+sha256  26c826658dfa9e5ce5f182fbfbadf3fda2d184e78dba3d99da34c60113b2ce54  COPYRIGHT
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index e9b374ec07..4c5200584f 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.6
+AUTOFS_VERSION = 5.1.7
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
-- 
2.29.2
