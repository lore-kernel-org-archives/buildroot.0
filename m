From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 19 Apr 2018 07:57:37 +0200
Subject: [Buildroot] [PATCH v2] dhcpc: bump to version 7.0.3
Message-ID: <20180419055737.23603-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Use sha256 checksum from *.distinfo.asc file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
	- use checksum from the *.distinfo.asc file (Alexander Dahl)

 package/dhcpcd/dhcpcd.hash | 4 ++--
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 3be3f7ff51..99b7fe786e 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
-# Locally calculated from download (no sig, hash)
-sha256	6f9674dc7e27e936cc787175404a6171618675ecfb6903ab9887b1b66a87d69e	dhcpcd-6.11.5.tar.xz
+# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-7.0.3.tar.xz.distinfo.asc
+sha256	a255d9aecceb1c77a9862f1c0d31a48ba37aab5ef2ca5ad76fc7a907b6ea292e	dhcpcd-7.0.3.tar.xz
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index dc5c69b86b..1bb0dd8a51 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.11.5
+DHCPCD_VERSION = 7.0.3
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.17.0
