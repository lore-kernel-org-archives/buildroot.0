From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 09:56:37 +0100
Subject: [Buildroot] [git commit] jquery-sidebar: new package
Message-ID: <20151223085952.39086826CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0afd34091698623ee0fba5930c38474792f4f0d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/jquery-sidebar/Config.in           |  6 ++++++
 package/jquery-sidebar/jquery-sidebar.hash |  2 ++
 package/jquery-sidebar/jquery-sidebar.mk   | 17 +++++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4292188..de0ad5e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -953,6 +953,7 @@ menu "external jQuery plugins"
 	source "package/jquery-datetimepicker/Config.in"
 	source "package/jquery-keyboard/Config.in"
 	source "package/jquery-mobile/Config.in"
+	source "package/jquery-sidebar/Config.in"
 	source "package/jquery-sparkline/Config.in"
 	source "package/jquery-ui/Config.in"
 	source "package/jquery-ui-themes/Config.in"
diff --git a/package/jquery-sidebar/Config.in b/package/jquery-sidebar/Config.in
new file mode 100644
index 0000000..324a20c
--- /dev/null
+++ b/package/jquery-sidebar/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JQUERY_SIDEBAR
+	bool "jquery-sidebar"
+	help
+	  A stupid simple sidebar jQuery plugin.
+
+	  http://jillix.github.io/jQuery-sidebar/
diff --git a/package/jquery-sidebar/jquery-sidebar.hash b/package/jquery-sidebar/jquery-sidebar.hash
new file mode 100644
index 0000000..60e44d4
--- /dev/null
+++ b/package/jquery-sidebar/jquery-sidebar.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  c96e46439a87555f2200442f597cce64f21f81f94d7601ddfc3b837913ddb42f  jquery-sidebar-3.3.2.tar.gz
diff --git a/package/jquery-sidebar/jquery-sidebar.mk b/package/jquery-sidebar/jquery-sidebar.mk
new file mode 100644
index 0000000..7af3667
--- /dev/null
+++ b/package/jquery-sidebar/jquery-sidebar.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# jquery-sidebar
+#
+################################################################################
+
+JQUERY_SIDEBAR_VERSION = 3.3.2
+JQUERY_SIDEBAR_SITE = $(call github,jillix,jQuery-sidebar,$(JQUERY_SIDEBAR_VERSION))
+JQUERY_SIDEBAR_LICENSE = MIT
+JQUERY_SIDEBAR_LICENSE_FILES = LICENSE
+
+define JQUERY_SIDEBAR_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/src/jquery.sidebar.min.js \
+		$(TARGET_DIR)/var/www/jquery-plugins/sidebar/jquery.sidebar.min.js
+endef
+
+$(eval $(generic-package))
