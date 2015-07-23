From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 23 Jul 2015 08:38:24 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libtirpc: bump to version 0.3.2
Message-ID: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version, update hash and update patch.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2:
  - None
---
 ...sable-parts-of-TIRPC-requiring-NIS-support.patch | 21 +++++++++++++--------
 package/libtirpc/libtirpc.hash                      |  4 ++--
 package/libtirpc/libtirpc.mk                        |  2 +-
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
index 2835ee1..12771f3 100644
--- a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
+++ b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
@@ -1,28 +1,33 @@
-From 9ab72f908af734b5a940fb459394072cfa9fc3a8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 23 Jun 2012 21:57:39 +0200
-Subject: [PATCH] Disable parts of TIRPC requiring NIS support
+From fc53290b7f2be918856883cd174cf18f06a085cf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 20 Jul 2015 20:30:11 +0200
+Subject: [PATCH 1/1] Disable parts of TIRPC requiring NIS support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [yann.morin.1998 at free.fr: update for 0.3.1]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[joerg.krause at embedded.rocks: update for 0.3.2]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 ---
  src/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 75bd4bf..7428e92 100644
+index 6cc567a..cf8a8ca 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -52,7 +52,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+@@ -51,7 +51,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
          rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
          rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
          svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c debug.c
+-        auth_time.c auth_des.c authdes_prot.c debug.c
 +        debug.c
  
  ## XDR
  libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
 -- 
-1.9.1
+2.4.6
 
diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 0a1cc98..f171870 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,4 +1,4 @@
 # From sourceforge's info on download page:
-sha1   0e0ef9123cf28cd0940148fabd23952476a8fcd6  libtirpc-0.3.1.tar.bz2
+sha1   af9b74d0c4d1499a7b1a43e396e5b7d62180ea65  libtirpc-0.3.2.tar.bz2
 # Locally computed
-sha256 a8838fe180deb8a6f6e491ee665325a28dee4100ec6b1f0b86d611dbfe3a2bb8  libtirpc-0.3.1.tar.bz2
+sha256 2008a379f37f2c5d5a87a568b06707422cc3e4f5da305f7fb71f3f4c6d473ffc  libtirpc-0.3.2.tar.bz2
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 494650c..8f49356 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 0.3.1
+LIBTIRPC_VERSION = 0.3.2
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3c
-- 
2.4.6
