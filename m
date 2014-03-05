From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  5 Mar 2014 08:17:29 +0100
Subject: [Buildroot] [PATCH v2 2/2] libuci: new package
In-Reply-To: <1394003849-17326-1-git-send-email-yegorslists@googlemail.com>
References: <1394003849-17326-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1394003849-17326-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in        |    1 +
 package/libuci/Config.in |    9 +++++++++
 package/libuci/libuci.mk |   14 ++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/libuci/Config.in
 create mode 100644 package/libuci/libuci.mk

diff --git a/package/Config.in b/package/Config.in
index 0e4b02e..07480bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -765,6 +765,7 @@ source "package/libsigsegv/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
 source "package/libubox/Config.in"
+source "package/libuci/Config.in"
 source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
diff --git a/package/libuci/Config.in b/package/libuci/Config.in
new file mode 100644
index 0000000..c1aba16
--- /dev/null
+++ b/package/libuci/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBUCI
+	bool "libuci"
+	select BR2_PACKAGE_LIBUBOX
+	help
+	  libuci is intended to centralize the whole configuration
+	  of a device running OpenWrt. This package will also install
+	  CLI tool uci.
+
+	  http://wiki.openwrt.org/doc/techref/uci
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
new file mode 100644
index 0000000..212074c
--- /dev/null
+++ b/package/libuci/libuci.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libuci
+#
+################################################################################
+
+LIBUCI_VERSION = 262fede3e8c8c08c1eb0d1be9bf102232fb86cb9
+LIBUCI_SITE = git://nbd.name/uci.git
+LIBUCI_LICENSE = LGPLv2.1
+LIBUCI_INSTALL_STAGING = YES
+LIBUCI_DEPENDENCIES = libubox
+LIBUCI_CONF_OPT = -DBUILD_LUA:BOOL=OFF
+
+$(eval $(cmake-package))
-- 
1.7.7
