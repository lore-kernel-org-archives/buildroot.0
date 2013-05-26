From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:24 +0200
Subject: [Buildroot] [PATCH 14/20] freescale-imx: new package directory
In-Reply-To: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369606110-8088-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>

The freescale-imx directory is intended to contain all freescale
i.MXyy related packages, together with their download site and version
info

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/freescale-imx/Config.in        |    4 ++++
 package/freescale-imx/freescale-imx.mk |   13 +++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/freescale-imx/Config.in
 create mode 100644 package/freescale-imx/freescale-imx.mk

diff --git a/package/Config.in b/package/Config.in
index 50683ff..d8a2cf7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -222,6 +222,7 @@ source "package/sunxi-boards/Config.in"
 source "package/ux500-firmware/Config.in"
 source "package/zd1211-firmware/Config.in"
 endmenu
+source "package/freescale-imx/Config.in"
 source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
 source "package/dbus/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
new file mode 100644
index 0000000..389bcc6
--- /dev/null
+++ b/package/freescale-imx/Config.in
@@ -0,0 +1,4 @@
+menu "Freescale i.MX libraries"
+	depends on BR2_arm
+
+endmenu
diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
new file mode 100644
index 0000000..0d5400b
--- /dev/null
+++ b/package/freescale-imx/freescale-imx.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# freescale-imx
+#
+#############################################################
+
+FREESCALE_IMX_VERSION = 12.09.01
+
+# No official download site from freescale, just this mirror
+FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
+
+include package/freescale-imx/*/*.mk
+
-- 
1.7.9.5
