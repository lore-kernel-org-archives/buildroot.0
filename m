From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 Feb 2013 22:56:47 +0100
Subject: [Buildroot] [PATCH 1/6] package/e2fsprogs: add host-package
	selection
In-Reply-To: <cover.1360360503.git.yann.morin.1998@free.fr>
References: <cover.1360360503.git.yann.morin.1998@free.fr>
Message-ID: <0385ef98f1a9d45aef1f0e741c343f962c72a660.1360360503.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the e2fsprogs as a host-package selection in the menuconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in.host           |    1 +
 package/e2fsprogs/Config.in.host |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 package/e2fsprogs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 79050f2..8813f5b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 source "package/dfu-util/Config.in.host"
+source "package/e2fsprogs/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
diff --git a/package/e2fsprogs/Config.in.host b/package/e2fsprogs/Config.in.host
new file mode 100644
index 0000000..ea6a0bd
--- /dev/null
+++ b/package/e2fsprogs/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_E2FSPROGS
+	bool "host e2fsprogs"
+	help
+	  The EXT2 file system utilities.
+	  
+	  http://e2fsprogs.sf.net
-- 
1.7.2.5
