From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 23:22:42 +0200
Subject: [Buildroot] [git commit] i2c-tools: depend on BUSYBOX_SHOW_OTHERS
Message-ID: <20160801212254.29A0581DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bb48645e65bd252ee97ebd55a40dbb713c8e7c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of version 1.25.0 busybox by default includes a nearly complete
implementation of i2c-tools. Hide the upstream version unless the
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS option is selected.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/i2c-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index e83dbd6..b82c7dc 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_I2C_TOOLS
 	bool "i2c-tools"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Heterogeneous set of I2C tools for Linux
 
