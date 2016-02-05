From: Martin Bark <martin@barkynet.com>
Date: Fri,  5 Feb 2016 17:09:40 +0000
Subject: [Buildroot] [PATCH 1/1] package/zip: add host-zip
Message-ID: <1454692180-6467-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the host variant of zip available.  This can be useful in
post-{build,image} scripts.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/Config.in.host     |  1 +
 package/zip/Config.in.host | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 package/zip/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 8e6b870..917670f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -31,5 +31,6 @@ menu "Host utilities"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
+	source "package/zip/Config.in.host"
 
 endmenu
diff --git a/package/zip/Config.in.host b/package/zip/Config.in.host
new file mode 100644
index 0000000..b14ce55
--- /dev/null
+++ b/package/zip/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_ZIP
+	bool "host zip"
+	help
+	  Zip is a compression and file packaging/archive utility.
+	  Although highly compatible both with PKWARE's PKZIP and
+	  PKUNZIP utilities for MS-DOS and with Info-ZIP's own UnZip,
+	  our primary objectives have been portability and
+	  other-than-MSDOS functionality.
+
+	  http://infozip.sourceforge.net/Zip.html
-- 
2.5.0
