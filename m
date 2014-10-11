From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 11 Oct 2014 13:05:35 +0200
Subject: [Buildroot] [PATCH 1/1] cramfs: add host utilities menu entry
Message-ID: <1413025535-5896-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in.host        | 1 +
 package/cramfs/Config.in.host | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 package/cramfs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 2c88c0b..185dcbc 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/cramfs/Config.in.host b/package/cramfs/Config.in.host
new file mode 100644
index 0000000..53b43d4
--- /dev/null
+++ b/package/cramfs/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_CRAMFS
+	bool "host cramfs"
+	help
+	  cramfs is a compressed read-only filesystem. This package
+	  contains the tools to generate and check a cramfs filesystem.
+
+	  http://sourceforge.net/projects/cramfs/
-- 
1.9.3
