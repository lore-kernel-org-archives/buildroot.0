From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  5 Feb 2014 14:53:00 +0100
Subject: [Buildroot] [pkg-perl infra V4 9/9] qemu: add a Config.in.host
In-Reply-To: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1391608380-23240-10-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

after the removal of cpanminus

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in.host      |    1 +
 package/qemu/Config.in.host |   10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 package/qemu/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 599ab9e..ca047e3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -12,6 +12,7 @@ source "package/mtools/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/parted/Config.in.host"
+source "package/qemu/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
new file mode 100644
index 0000000..cfab922
--- /dev/null
+++ b/package/qemu/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_QEMU
+	bool "host qemu"
+	help
+	  QEMU is a generic and open source machine emulator and virtualizer.
+
+	  In user mode emulation, QEMU runs single cross-compiled programs.
+	  Fast cross-compilation and cross-debugging are the main targets
+	  for user-mode emulation.
+
+	  http://qemu.org/
-- 
1.7.9.5
