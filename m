From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 20:03:53 +0200
Subject: [Buildroot] [git commit] dfu-util: new package
Message-ID: <20120720180404.30BA396BBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3c1ee9a598d470956d029a16b64a33c10aee06d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host          |    1 +
 package/dfu-util/Config.in.host |    8 ++++++++
 package/dfu-util/dfu-util.mk    |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 9fcfede..79050f2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+source "package/dfu-util/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
diff --git a/package/dfu-util/Config.in.host b/package/dfu-util/Config.in.host
new file mode 100644
index 0000000..cfeebdc
--- /dev/null
+++ b/package/dfu-util/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_DFU_UTIL
+	bool "host dfu-util"
+	help
+	  Dfu-util is the host side implementation of the DFU 1.0 
+	  specification of the USB forum. DFU is intended to download
+	  and upload firmware to devices connected over USB. 
+
+	  http://dfu-util.gnumonks.org/
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
new file mode 100644
index 0000000..4ba7014
--- /dev/null
+++ b/package/dfu-util/dfu-util.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# dfu-util
+#
+#############################################################
+DFU_UTIL_VERSION:=0.6
+DFU_UTIL_SOURCE = dfu-util-$(DFU_UTIL_VERSION).tar.gz
+DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
+
+HOST_DFU_UTIL_DEPENDENCIES = host-libusb
+
+$(eval $(host-autotools-package))
+
