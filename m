From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon,  9 Dec 2013 07:15:07 -0500
Subject: [Buildroot] [PATCH] qemu: add to host utilities menu
Message-ID: <1386591307-3585-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows qemu-user to be selected by the user. One use case
for this is to call qemu-user from post build scripts to
run regression tests against the build.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/Config.in.host      | 1 +
 package/qemu/Config.in.host | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 package/qemu/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 5fd2570..d50adfb 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ source "package/lpc3250loader/Config.in.host"
 source "package/mtools/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
+source "package/qemu/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
new file mode 100644
index 0000000..a1f0531
--- /dev/null
+++ b/package/qemu/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_QEMU
+	bool "host qemu"
+	help
+	  QEMU is a generic and open source machine emulator and virtualizer.
+
+	  This option builds a user emulator for your selected architecture.
+
+	  http://www.qemu.org
-- 
1.8.3.2
