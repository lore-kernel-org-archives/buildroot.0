From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 20 Jun 2017 17:24:43 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: new package
Message-ID: <20170620152443.17014-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/dt-utils/Config.in   |  8 ++++++++
 package/dt-utils/dt-utils.mk | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/dt-utils/Config.in
 create mode 100644 package/dt-utils/dt-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index afc45962c..84f06be13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1063,6 +1063,7 @@ N:	Marcin Niestroj <m.niestroj@grinn-global.com>
 F:	board/grinn/
 F:	configs/grinn_*
 F:	package/argparse/
+F:	package/dt-utils/
 F:	package/easydbus/
 F:	package/luaossl/
 F:	package/rs485conf/
diff --git a/package/Config.in b/package/Config.in
index 9df0b4247..4c04aa80d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ endmenu
 	source "package/devmem2/Config.in"
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
+	source "package/dt-utils/Config.in"
 	source "package/dtv-scan-tables/Config.in"
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
diff --git a/package/dt-utils/Config.in b/package/dt-utils/Config.in
new file mode 100644
index 000000000..3cf4681d6
--- /dev/null
+++ b/package/dt-utils/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DT_UTILS
+	bool "dt-utils"
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  Tools for flattened device-tree dumping and barebox state
+	  manipulation.
+
+	  https://git.pengutronix.de/cgit/tools/dt-utils/
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
new file mode 100644
index 000000000..d7c053ac1
--- /dev/null
+++ b/package/dt-utils/dt-utils.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# dt-utils
+#
+################################################################################
+
+DT_UTILS_VERSION = v2017.03.0
+DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
+DT_UTILS_SITE_METHOD = git
+DT_UTILS_LICENSE = GPLv2
+DT_UTILS_LICENSE_FILES = COPYING
+DT_UTILS_DEPENDENCIES = udev
+DT_UTILS_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.13.1
