From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 19:39:46 +0100
Subject: [Buildroot] [git commit] dtach: new package
Message-ID: <20130324194035.A4D638F2EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3cf74351daadf5f72481a74e7584071476dc05a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Justin Maggard <jmaggard@netgear.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/dtach/Config.in |    8 ++++++++
 package/dtach/dtach.mk  |   17 +++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 94e279b..c66e139 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -774,6 +774,7 @@ source "package/bash/Config.in"
 source "package/dash/Config.in"
 endif
 source "package/dialog/Config.in"
+source "package/dtach/Config.in"
 source "package/file/Config.in"
 source "package/gnupg/Config.in"
 source "package/inotify-tools/Config.in"
diff --git a/package/dtach/Config.in b/package/dtach/Config.in
new file mode 100644
index 0000000..033536b
--- /dev/null
+++ b/package/dtach/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DTACH
+	bool "dtach"
+	help
+	  dtach is a tiny program that emulates the detach feature of screen,
+	  allowing you to run a program in an environment that is protected
+	  from the controlling terminal and attach to it later.
+
+	  http://dtach.sourceforge.net/
diff --git a/package/dtach/dtach.mk b/package/dtach/dtach.mk
new file mode 100644
index 0000000..77ad7c0
--- /dev/null
+++ b/package/dtach/dtach.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# dtach
+#
+#############################################################
+
+DTACH_VERSION = 0.8
+DTACH_SITE = http://downloads.sourceforge.net/project/dtach/dtach/$(DTACH_VERSION)
+DTACH_LICENSE = GPLv2+
+DTACH_LICENSE_FILES = COPYING
+
+# The Makefile does not have an install target.
+define DTACH_INSTALL_TARGET_CMDS
+        $(INSTALL) -D -m 0755 $(@D)/dtach $(TARGET_DIR)/usr/bin/dtach
+endef
+
+$(eval $(autotools-package))
