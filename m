From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 20:55:45 +0100
Subject: [Buildroot] [git commit] uboot-tools: expose host package in
	menuconfig
Message-ID: <20120202201521.7E0659099F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b04b2dda6bf87dc12650774aff3d99aa4290ff2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host             |    2 ++
 package/uboot-tools/Config.in.host |    6 ++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

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
