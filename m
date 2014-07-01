From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Jul 2014 08:42:03 -0300
Subject: [Buildroot] [PATCH] pwgen: add host utilities menu entry
Message-ID: <1404214923-27568-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in.host       | 1 +
 package/pwgen/Config.in.host | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 package/pwgen/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 08b8064..dce1a2d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/parted/Config.in.host"
+	source "package/pwgen/Config.in.host"
 	source "package/qemu-system/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
diff --git a/package/pwgen/Config.in.host b/package/pwgen/Config.in.host
new file mode 100644
index 0000000..0c56851
--- /dev/null
+++ b/package/pwgen/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PWGEN
+	bool "host pwgen"
+	help
+	  Pwgen is a small, GPL'ed password generator which creates passwords
+	  which can be easily memorized by a human.
+
+	  http://sourceforge.net/projects/pwgen/
-- 
1.8.5.5
