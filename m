From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon, 17 Dec 2012 21:35:46 +0100
Subject: [Buildroot] [PATCH] sg3-utils new package.
Message-ID: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in              |    1 +
 package/sg3_utils/Config.in    |    7 +++++++
 package/sg3_utils/sg3_utils.mk |   10 ++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/sg3_utils/Config.in
 create mode 100644 package/sg3_utils/sg3_utils.mk

diff --git a/package/Config.in b/package/Config.in
index d6af55d..269b3ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -253,6 +253,7 @@ source "package/rng-tools/Config.in"
 source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
+source "package/sg3_utils/Config.in"
 source "package/smartmontools/Config.in"
 source "package/snowball-hdmiservice/Config.in"
 source "package/sredird/Config.in"
diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
new file mode 100644
index 0000000..1d2ab2a
--- /dev/null
+++ b/package/sg3_utils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SG3_UTILS
+	bool "sg3_utils"
+	help
+	  sg3_utils is a package of utilities that send SCSI commands to the
+	  given <scsi_device> via a SCSI pass through.
+
+	  http://sg.danny.cz/sg/
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
new file mode 100644
index 0000000..2eba3d3
--- /dev/null
+++ b/package/sg3_utils/sg3_utils.mk
@@ -0,0 +1,10 @@
+#############################################################
+#
+# sg3_utils
+#
+#############################################################
+SG3_UTILS_VERSION = 1.34
+SG3_UTILS_SITE = http://sg.danny.cz/sg/p/
+SG3_UTILS_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
