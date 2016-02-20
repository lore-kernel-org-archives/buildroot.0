From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 14:24:38 +0100
Subject: [Buildroot] [git commit] package/zip: add host-zip
Message-ID: <20160302202753.D7B6380203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddb8ff9d95d71cee6fb965817d077409dd3056a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the host variant of zip available.  This can be useful in
post-{build,image} scripts.

Signed-off-by: Martin Bark <martin@barkynet.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host     |  1 +
 package/zip/Config.in.host | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 1c691a3..09c98fb 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -32,5 +32,6 @@ menu "Host utilities"
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
