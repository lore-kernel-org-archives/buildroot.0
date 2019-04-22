From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:26:11 +0200
Subject: [Buildroot] [git commit] package/keepalived: bump to version 2.0.15
Message-ID: <20190422202139.CEB028147F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e45fe7259e3e05a01808ab4ce4e693100805ef21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...global_parser.c-fix-build-with-kernel-4.1.patch | 37 ----------------------
 package/keepalived/keepalived.hash                 |  2 +-
 package/keepalived/keepalived.mk                   |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/keepalived/0001-global_parser.c-fix-build-with-kernel-4.1.patch b/package/keepalived/0001-global_parser.c-fix-build-with-kernel-4.1.patch
deleted file mode 100644
index 0c395b5101..0000000000
--- a/package/keepalived/0001-global_parser.c-fix-build-with-kernel-4.1.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 50e7b848feb7976c58c70edc64bf1056050aa1a3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 22 Mar 2019 09:18:44 +0100
-Subject: [PATCH] global_parser.c: fix build with kernel < 4.1
-
-NFT_TABLE_MAXNAMELEN has been added only in kernel 4.1 with
-https://github.com/torvalds/linux/commit/1cae565e8b746f484f1ff1b71d2a1c89d7cf0668
-
-So define it to 32 if it is not defined
-
-Fixes:
- - http://autobuild.buildroot.org/results/a33433abeb122cfb15f7f21ab777e84040bdcb8b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- keepalived/core/global_parser.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/keepalived/core/global_parser.c b/keepalived/core/global_parser.c
-index 65442408..eec82e8a 100644
---- a/keepalived/core/global_parser.c
-+++ b/keepalived/core/global_parser.c
-@@ -60,6 +60,11 @@
- 
- #define LVS_MAX_TIMEOUT		(86400*31)	/* 31 days */
- 
-+/* For kernels < 4.1 */
-+#ifndef NFT_TABLE_MAXNAMELEN
-+#define NFT_TABLE_MAXNAMELEN 32
-+#endif
-+
- /* data handlers */
- /* Global def handlers */
- #ifdef _WITH_LINKBEAT_
--- 
-2.20.1
-
diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index 5f9f569ca7..091821467b 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	c7fb38e8a322fb898fb9f6d5d566827a30aa5a4cd1774f474bb4041c85bcbc46  keepalived-2.0.13.tar.gz
+sha256	933ee01bc6346aa573453b998f87510d3cce4aba4537c9642b24e6dbfba5c6f4  keepalived-2.0.15.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 15a1b0e9f4..30d857ba25 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 2.0.13
+KEEPALIVED_VERSION = 2.0.15
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
