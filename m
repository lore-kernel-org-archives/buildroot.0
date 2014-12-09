From: Thierry Bultel <tbultel@free.fr>
Date: Tue,  9 Dec 2014 16:01:33 +0100
Subject: [Buildroot] [PATCH 1/1] makes host-qemu buildable without qemu on
	target
Message-ID: <1418137293-13629-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thierry Bultel <tbultel@free.fr>
---
 package/Config.in.host      | 1 +
 package/qemu/Config.in.host | 4 ++++
 2 files changed, 5 insertions(+)
 create mode 100644 package/qemu/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 0b7bc36..6ddcb2c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -23,5 +23,6 @@ menu "Host utilities"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
+	source "package/qemu/Config.in.host"
 
 endmenu
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
new file mode 100644
index 0000000..de35458
--- /dev/null
+++ b/package/qemu/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_QEMU
+	bool "host qemu"
+	help
+	  Qemu-host
-- 
1.9.1
