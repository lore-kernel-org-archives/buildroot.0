From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 23:24:22 +0100
Subject: [Buildroot] [git commit branch/next] package/libuci: bump version
 to 52bbc99
Message-ID: <20210213221553.BC49881358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=351e6a9bce11ced9e75a5aca0ada6dcf9de2e113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- change download url to https

- update homepage url (the old one redirects to legacy read only
  OpenWrt wiki system)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuci/Config.in   | 2 +-
 package/libuci/libuci.hash | 2 +-
 package/libuci/libuci.mk   | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libuci/Config.in b/package/libuci/Config.in
index 2f4ad40487..f94d7dc391 100644
--- a/package/libuci/Config.in
+++ b/package/libuci/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_LIBUCI
 
 	  This package will also install CLI tool uci.
 
-	  http://wiki.openwrt.org/doc/techref/uci
+	  https://openwrt.org/docs/techref/uci
 
 comment "libuci needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index b808810ccf..b6962c2541 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  1ee875910bdf751807f10d44f6b6b7f9ec71c12d4c407a80bae5cb654d2ba4cc  libuci-49ec6efbdac4819033d34f08927d795f83a3932d-br1.tar.gz
+sha256  76ef826df2961420cd7a4f1702bef06c37563d9807a2d8e84557963aab21ac80  libuci-52bbc99f69ea6f67b6fe264f424dac91bde5016c-br1.tar.gz
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 55afd53c10..fcfda95b3a 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = 49ec6efbdac4819033d34f08927d795f83a3932d
-LIBUCI_SITE = git://git.openwrt.org/project/uci.git
+LIBUCI_VERSION = 52bbc99f69ea6f67b6fe264f424dac91bde5016c
+LIBUCI_SITE = https://git.openwrt.org/project/uci.git
+LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
