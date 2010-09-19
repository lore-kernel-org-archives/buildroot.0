From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Mon, 20 Sep 2010 02:44:40 +0300
Subject: [Buildroot] [PATCH] Add kbd package
Message-ID: <1284939880-455-1-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 package/Config.in     |    1 +
 package/kbd/Config.in |    6 ++++++
 package/kbd/kdb.mk    |    5 +++++
 3 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/kbd/Config.in
 create mode 100644 package/kbd/kdb.mk

diff --git a/package/Config.in b/package/Config.in
index 2209b55..5a7a4ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -167,6 +167,7 @@ source "package/hwdata/Config.in"
 source "package/i2c-tools/Config.in"
 source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
+source "package/kbd/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lvm2/Config.in"
 source "package/makedevs/Config.in"
diff --git a/package/kbd/Config.in b/package/kbd/Config.in
new file mode 100644
index 0000000..5a6b4cd
--- /dev/null
+++ b/package/kbd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KBD
+	bool "kbd"
+	help
+	  Keytable files and keyboard utilities.
+
+	  ftp://ftp.kernel.org/pub/linux/utils/kbd/
diff --git a/package/kbd/kdb.mk b/package/kbd/kdb.mk
new file mode 100644
index 0000000..5b794a9
--- /dev/null
+++ b/package/kbd/kdb.mk
@@ -0,0 +1,5 @@
+KBD_VERSION = 1.15.2
+KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
+KBD_SITE = ftp://ftp.kernel.org/pub/linux/utils/kbd
+
+$(eval $(call AUTOTARGETS,package,kbd))
-- 
1.7.3
