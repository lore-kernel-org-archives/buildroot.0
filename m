From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 15:35:02 -0300
Subject: [Buildroot] [PATCH] connman: bump to version 1.27
Message-ID: <1421174102-26667-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also drop PAN profile comment since it now supports GN and PANU profiles
as well to avoid overcrowding.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/connman/Config.in    | 5 ++---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 861df7d..f071627 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -42,9 +42,8 @@ config BR2_PACKAGE_CONNMAN_WISPR
 config BR2_PACKAGE_CONNMAN_BLUETOOTH
 	bool "enable Bluetooth support"
 	help
-	  Enable Bluetooth (PAN profile) support. The start of
-	  bluetoothd is automatically detected and only a runtime
-	  dependency.
+	  Enable Bluetooth support. The start of bluetoothd is
+	  automatically detected and only a runtime dependency.
 
 config BR2_PACKAGE_CONNMAN_LOOPBACK
 	bool "enable loopback support"
diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 58f74b3..dfeef4b 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256	7184e4b6d954449ee00a30e188924b3e37a20ad2fd9a0b76a2bdd82c863dcf8a	connman-1.26.tar.xz
+sha256	13997824c076af150c68d6d79e48277216e8192278a5c6615cfd4905d65600f5	connman-1.27.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 3ca049a..4d9b03e 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.26
+CONNMAN_VERSION = 1.27
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
-- 
2.0.5
