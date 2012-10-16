From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 16 Oct 2012 20:30:14 +0100
Subject: [Buildroot] [PATCH v2] macchanger: new package
Message-ID: <1350415814-18453-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (build-test with a WCHAR-only internal powerpc toolchain)

---
 v2: Incorporated changes suggested by Arnout Vandecappelle

 package/Config.in                |    1 +
 package/macchanger/Config.in     |    7 +++++++
 package/macchanger/macchanger.mk |   11 +++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/macchanger/Config.in
 create mode 100644 package/macchanger/macchanger.mk

diff --git a/package/Config.in b/package/Config.in
index d7b3db6..f8e83c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -573,6 +573,7 @@ endif
 source "package/links/Config.in"
 source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
+source "package/macchanger/Config.in"
 source "package/mii-diag/Config.in"
 source "package/mrouted/Config.in"
 source "package/msmtp/Config.in"
diff --git a/package/macchanger/Config.in b/package/macchanger/Config.in
new file mode 100644
index 0000000..e26faa7
--- /dev/null
+++ b/package/macchanger/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MACCHANGER
+	bool "macchanger"
+	help
+	  A GNU/Linux utility for viewing/manipulating the MAC address of
+	  network interfaces
+
+	  http://www.alobbs.com/macchanger
diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
new file mode 100644
index 0000000..66ebb80
--- /dev/null
+++ b/package/macchanger/macchanger.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# macchanger
+#
+#############################################################
+MACCHANGER_VERSION = 1.5.0
+MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
+MACCHANGER_LICENSE = GPLv2
+MACCHANGER_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.9.5
