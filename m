From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 28 Jan 2014 08:39:21 -0300
Subject: [Buildroot] [PATCH 2/2] mtd: Allow to select the host variant
In-Reply-To: <1390909161-2496-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1390909161-2496-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1390909161-2496-2-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If any of the post-image scripts wants to create mtd/ubi images,
we need to expose an option for mtd-tools to be user-selectable.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/Config.in.host     | 1 +
 package/mtd/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/mtd/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 34e84bf..f2fe2c2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -8,6 +8,7 @@ source "package/genimage/Config.in.host"
 source "package/genpart/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
 source "package/mtools/Config.in.host"
+source "package/mtd/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/parted/Config.in.host"
diff --git a/package/mtd/Config.in.host b/package/mtd/Config.in.host
new file mode 100644
index 0000000..3752266
--- /dev/null
+++ b/package/mtd/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_MTD
+	bool "host mtd, jffs2 and ubi/ubifs tools"
+	help
+	  Build mtd, jffs2 and ubi/ubifs tools
+
+	  http://www.linux-mtd.infradead.org/
-- 
1.8.1.5
