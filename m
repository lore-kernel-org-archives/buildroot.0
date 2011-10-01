From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Oct 2011 17:00:19 +0200
Subject: [Buildroot] [PATCH 2/6] uboot-tools: expose host package in
	menuconfig
In-Reply-To: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f81f9b565273a0c959eb99b581e1286663c69809.1317481137.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host             |    2 ++
 package/uboot-tools/Config.in.host |    6 ++++++
 2 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 package/uboot-tools/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 54f6a59..b8f8aab 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,3 +1,5 @@
 menu "Host utilities"
 
+source "package/uboot-tools/Config.in.host"
+
 endmenu
diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
new file mode 100644
index 0000000..7a844e9
--- /dev/null
+++ b/package/uboot-tools/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_UBOOT_TOOLS
+	bool "host u-boot tools"
+	help
+	  Companion tools for Das U-Boot bootloader.
+
+	  http://www.denx.de/wiki/U-Boot/WebHome
-- 
1.7.4.1
