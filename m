From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 16 Mar 2017 22:37:58 +0100
Subject: [Buildroot] [PATCH] s6-rc: expose the host variant in menuconfig
Message-ID: <20170316213758.1362-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some users may want to build the s6-rc service database offline using a
post-build script. So make the host variant visible in menuconfig.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in.host       | 1 +
 package/s6-rc/Config.in.host | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 package/s6-rc/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 8da79c3..bb91671 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -38,6 +38,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
+	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/s6-rc/Config.in.host b/package/s6-rc/Config.in.host
new file mode 100644
index 0000000..f250b9f
--- /dev/null
+++ b/package/s6-rc/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_S6_RC
+	bool "host s6-rc"
+	depends on BR2_PACKAGE_S6_RC
+	help
+	  This package provides the host variant of the s6-rc tools,
+	  required to build the s6-rc service database offline.
+
+	  http://skarnet.org/software/s6-rc/
-- 
2.9.3
