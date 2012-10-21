From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Oct 2012 20:41:18 +0200
Subject: [Buildroot] [git commit] macchanger: new package
Message-ID: <20121021191347.B5A249709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=464e88c8bd90e52fa128dae2ce20a0edd9a9f0e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (build-test with a WCHAR-only internal powerpc toolchain)
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/macchanger/Config.in     |    7 +++++++
 package/macchanger/macchanger.mk |   11 +++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dd4c97e..b78d980 100644
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
