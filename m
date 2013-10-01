From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Tue,  1 Oct 2013 11:06:29 -0700
Subject: [Buildroot] [PATCH 1/2] freescale-imx: separate variable assignment
	from Makefile
In-Reply-To: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1380650790-18097-2-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch pulls the variable assignments for the site and
version from freescale-imx.mk and places them into freescale-imx.inc
so they can be used by components in other trees
(e.g. gstreamer plugins).

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 package/freescale-imx/freescale-imx.inc | 9 +++++++++
 package/freescale-imx/freescale-imx.mk  | 6 +-----
 2 files changed, 10 insertions(+), 5 deletions(-)
 create mode 100644 package/freescale-imx/freescale-imx.inc

diff --git a/package/freescale-imx/freescale-imx.inc b/package/freescale-imx/freescale-imx.inc
new file mode 100644
index 0000000..51709f4
--- /dev/null
+++ b/package/freescale-imx/freescale-imx.inc
@@ -0,0 +1,9 @@
+################################################################################
+#
+# Set freescale-imx variables to make it easy to align versions of various
+# packages
+#
+################################################################################
+FREESCALE_IMX_VERSION = 3.5.7-1.0.0
+FREESCALE_IMX_SITE   = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
+
diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 2762972..46f4ddb 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,9 +4,5 @@
 #
 ################################################################################
 
-FREESCALE_IMX_VERSION = 3.5.7-1.0.0
-
-FREESCALE_IMX_SITE   = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
-#FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
-
+include package/freescale-imx/freescale-imx.inc
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
-- 
1.8.1.2
