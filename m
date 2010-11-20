From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 01:52:43 -0500
Subject: [Buildroot] [PATCH] lsuio: new UIO helper package
Message-ID: <1290235963-2083-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/Config.in       |    1 +
 package/lsuio/Config.in |    6 ++++++
 package/lsuio/lsuio.mk  |   11 +++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/lsuio/Config.in
 create mode 100644 package/lsuio/lsuio.mk

diff --git a/package/Config.in b/package/Config.in
index fb0dee8..bd348a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -177,6 +177,7 @@ source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/kbd/Config.in"
 source "package/lm-sensors/Config.in"
+source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
 source "package/makedevs/Config.in"
 source "package/mdadm/Config.in"
diff --git a/package/lsuio/Config.in b/package/lsuio/Config.in
new file mode 100644
index 0000000..675a318
--- /dev/null
+++ b/package/lsuio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LSUIO
+	bool "lsuio"
+	help
+	  list available userspace I/O (UIO) devices
+
+	  http://www.osadl.org/UIO.uio.0.html
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
new file mode 100644
index 0000000..2a867b7
--- /dev/null
+++ b/package/lsuio/lsuio.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# lsuio
+#
+#############################################################
+
+LSUIO_VERSION = 0.2.0
+LSUIO_SOURCE = lsuio-$(LSUIO_VERSION).tar.gz
+LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
+
+$(eval $(call AUTOTARGETS,package,lsuio))
-- 
1.7.3.2
