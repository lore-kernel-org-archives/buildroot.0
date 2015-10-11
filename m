From: Jason Pruitt <jrspruitt@gmail.com>
Date: Sun, 11 Oct 2015 00:00:53 -0700
Subject: [Buildroot] [PATCH 2/2] Add package hackrf-tools
In-Reply-To: <1444546853-1505-1-git-send-email-jrspruitt@gmail.com>
References: <1444546853-1505-1-git-send-email-jrspruitt@gmail.com>
Message-ID: <1444546853-1505-2-git-send-email-jrspruitt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
---
 package/Config.in                    |  1 +
 package/hackrf-tools/Config.in       |  8 ++++++++
 package/hackrf-tools/hackrf-tools.mk | 14 ++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/hackrf-tools/Config.in
 create mode 100644 package/hackrf-tools/hackrf-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 0184e46..fe3f057 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -352,6 +352,7 @@ endif
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
 	source "package/gvfs/Config.in"
+	source "package/hackrf-tools/Config.in
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/hdparm/Config.in"
 endif
diff --git a/package/hackrf-tools/Config.in b/package/hackrf-tools/Config.in
new file mode 100644
index 0000000..71fced6
--- /dev/null
+++ b/package/hackrf-tools/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HACKRF_TOOLS
+	bool "hackrf-tools"
+    depends on BR2_PACKAGE_LIBHACKRF && (BR2_SHARED_STATIC_LIBS || BR2_SHARED_LIBS)
+	help
+	  Tools for interacting with and updating HackRF boards.
+
+	  https://github.com/mossmann/hackrf/host/hackrf-tools
+
diff --git a/package/hackrf-tools/hackrf-tools.mk b/package/hackrf-tools/hackrf-tools.mk
new file mode 100644
index 0000000..40bccae
--- /dev/null
+++ b/package/hackrf-tools/hackrf-tools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hackrf-tools
+#
+################################################################################
+
+HACKRF_TOOLS_VERSION = v2015.07.2
+HACKRF_TOOLS_SITE = $(call github,mossmann,hackrf,$(HACKRF_TOOLS_VERSION))
+HACKRF_TOOLS_LICENSE = GPLv2+
+HACKRF_TOOLS_LICENSE_FILES = COPYING
+HACKRF_TOOLS_DEPENDENCIES = libhackrf
+HACKRF_TOOLS_SUBDIR = host/hackrf-tools
+
+$(eval $(cmake-package))
-- 
2.1.4
