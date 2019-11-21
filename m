From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:15 +0800
Subject: [Buildroot] [PATCH v2 01/10] package/freescale-qoriq: new package
 directory
In-Reply-To: <20191121102324.35225-1-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
Message-ID: <20191121102324.35225-2-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The freescale-qoriq directory is intended to contain all freescale
QorIQ (including PowerPC and LayerScape serial) related packages,
together with their download site and version info.

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
changes since v1:
no changes
---
 package/Config.in                          | 1 +
 package/freescale-qoriq/Config.in          | 4 ++++
 package/freescale-qoriq/freescale-qoriq.mk | 1 +
 3 files changed, 6 insertions(+)
 create mode 100644 package/freescale-qoriq/Config.in
 create mode 100644 package/freescale-qoriq/freescale-qoriq.mk

diff --git a/package/Config.in b/package/Config.in
index 36d2b31e2e..4cdc8298f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -447,6 +447,7 @@ endmenu
 	source "package/flashrom/Config.in"
 	source "package/fmtools/Config.in"
 	source "package/freescale-imx/Config.in"
+	source "package/freescale-qoriq/Config.in"
 	source "package/fxload/Config.in"
 	source "package/gadgetfs-test/Config.in"
 	source "package/gcnano-binaries/Config.in"
diff --git a/package/freescale-qoriq/Config.in b/package/freescale-qoriq/Config.in
new file mode 100644
index 0000000000..51497c588e
--- /dev/null
+++ b/package/freescale-qoriq/Config.in
@@ -0,0 +1,4 @@
+menu "Freescale QorIQ libraries"
+	depends on BR2_aarch64 || BR2_arm || BR2_powerpc64 || BR2_powerpc
+
+endmenu
diff --git a/package/freescale-qoriq/freescale-qoriq.mk b/package/freescale-qoriq/freescale-qoriq.mk
new file mode 100644
index 0000000000..bbbbf3efbe
--- /dev/null
+++ b/package/freescale-qoriq/freescale-qoriq.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard package/freescale-qoriq/*/*.mk))
-- 
2.17.1
