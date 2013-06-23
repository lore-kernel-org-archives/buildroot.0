From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jun 2013 22:40:55 +0200
Subject: [Buildroot] [PATCH 4/4] package/w_scan: new package
In-Reply-To: <cover.1372019882.git.yann.morin.1998@free.fr>
References: <cover.1372019882.git.yann.morin.1998@free.fr>
Message-ID: <a4416db33352923370280841140fb56daa85fd86.1372019882.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in        |  1 +
 package/w_scan/Config.in |  9 +++++++++
 package/w_scan/w_scan.mk | 13 +++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/w_scan/Config.in
 create mode 100644 package/w_scan/w_scan.mk

diff --git a/package/Config.in b/package/Config.in
index 0eb6a9c..74c7624 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -300,6 +300,7 @@ source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
+source "package/w_scan/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
new file mode 100644
index 0000000..bc94fe7
--- /dev/null
+++ b/package/w_scan/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_W_SCAN
+	bool "w_scan"
+	help
+	  w_scan is a small command line utility used to perform frequency
+	  scans for DVB and ATSC transmissions. It is capable of creating
+	  channels.conf files (in different output formats !) as well as
+	  initial tuning data for scan.
+
+	  http://wirbel.htpc-forum.de/w_scan/index_en.html
diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
new file mode 100644
index 0000000..7660c18
--- /dev/null
+++ b/package/w_scan/w_scan.mk
@@ -0,0 +1,13 @@
+###############################################################################
+#
+# w_scan
+#
+###############################################################################
+
+W_SCAN_VERSION              = 20130331
+W_SCAN_SOURCE               = w_scan-$(W_SCAN_VERSION).tar.bz2
+W_SCAN_SITE                 = http://wirbel.htpc-forum.de/w_scan
+W_SCAN_LICENSE              = GPLv2+
+W_SCAN_LICENSE_FILES        = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.1.2
