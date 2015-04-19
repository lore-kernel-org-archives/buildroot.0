From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 17:22:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/dhcpcd: bump to version 6.8.1
Message-ID: <1429456975-17889-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

removed patch applied upstream

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dhcpcd/0001-fix-linux-macro-name.patch |   25 ------------------------
 package/dhcpcd/dhcpcd.hash                     |    2 +-
 package/dhcpcd/dhcpcd.mk                       |    2 +-
 3 files changed, 2 insertions(+), 27 deletions(-)
 delete mode 100644 package/dhcpcd/0001-fix-linux-macro-name.patch

diff --git a/package/dhcpcd/0001-fix-linux-macro-name.patch b/package/dhcpcd/0001-fix-linux-macro-name.patch
deleted file mode 100644
index 18dbb10..0000000
--- a/package/dhcpcd/0001-fix-linux-macro-name.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Fix Linux define
-
-Fetched from upstream:
-http://roy.marples.name/projects/dhcpcd/ci/2cabc3efee4c18ca?sbs=0
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
-Index: dhcpcd.h
-==================================================================
---- /dhcpcd.h
-+++ /dhcpcd.h
-@@ -58,11 +58,11 @@
- 
- struct interface {
- 	struct dhcpcd_ctx *ctx;
- 	TAILQ_ENTRY(interface) next;
- 	char name[IF_NAMESIZE];
--#ifdef __linux
-+#ifdef __linux__
- 	char alias[IF_NAMESIZE];
- #endif
- 	unsigned int index;
- 	unsigned int flags;
- 	sa_family_t family;
-
diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index b66244d..1b7543f 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	cb65d3e783fa5484ed095bb940c3274a5a91d3ed4a9d9ae66a49d9637165bd98	dhcpcd-6.7.1.tar.bz2
+sha256	27b60cbf726a8319e6f1e7691132082c9cdac473317ea47cb093d0dd3d32af82	dhcpcd-6.8.1.tar.bz2
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 6f82090..694bb75 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.7.1
+DHCPCD_VERSION = 6.8.1
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
1.7.10.4
