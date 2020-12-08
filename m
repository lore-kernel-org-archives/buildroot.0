From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Dec 2020 19:16:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/popperjs: new package
Message-ID: <20201208181638.28938-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/popperjs/Config.in     |  6 ++++++
 package/popperjs/popperjs.hash |  3 +++
 package/popperjs/popperjs.mk   | 19 +++++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/popperjs/Config.in
 create mode 100644 package/popperjs/popperjs.hash
 create mode 100644 package/popperjs/popperjs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ab1e125f4..a663eb559a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2525,6 +2525,7 @@ F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
 F:	package/perl-path-class/
 F:	package/pigz/
+F:	package/popperjs/
 F:	package/xenomai/
 F:	support/scripts/size-stats
 F:	support/testing/tests/package/test_perl_lwp_protocol_https.py
diff --git a/package/Config.in b/package/Config.in
index 016a99ed1a..c931c28bfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1587,6 +1587,7 @@ endif
 	source "package/jsmin/Config.in"
 	source "package/json-javascript/Config.in"
 	source "package/openlayers/Config.in"
+	source "package/popperjs/Config.in"
 	source "package/spidermonkey/Config.in"
 	source "package/vuejs/Config.in"
 endmenu
diff --git a/package/popperjs/Config.in b/package/popperjs/Config.in
new file mode 100644
index 0000000000..eae963100e
--- /dev/null
+++ b/package/popperjs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_POPPERJS
+	bool "popperjs"
+	help
+	  Popper.js, a JavaScript Tooltip & Popover Positioning Engine.
+
+	  https://popper.js.org
diff --git a/package/popperjs/popperjs.hash b/package/popperjs/popperjs.hash
new file mode 100644
index 0000000000..9ea5d11fee
--- /dev/null
+++ b/package/popperjs/popperjs.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	83eecef51d10826faca2cd5cabb344e0bef6d4127d7e728db9e4d8308b7b15d1  popperjs-v1.16.0.tar.gz
+sha256	2961310ed05cd9373a08b8191c071425a7fede0ca5d807ca38fa5f5f61c5b834  LICENSE.md
diff --git a/package/popperjs/popperjs.mk b/package/popperjs/popperjs.mk
new file mode 100644
index 0000000000..f44dbeb279
--- /dev/null
+++ b/package/popperjs/popperjs.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# popperjs
+#
+################################################################################
+
+POPPERJS_VERSION = v1.16.0
+POPPERJS_SITE = $(call github,popperjs,popper-core,$(POPPERJS_VERSION))
+POPPERJS_LICENSE = MIT
+POPPERJS_LICENSE_FILES = LICENSE.md
+
+define POPPERJS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/dist/umd/popper.min.js \
+		$(TARGET_DIR)/var/www/popperjs/js/popper.min.js
+	$(INSTALL) -m 0644 -D $(@D)/dist/umd/popper-utils.min.js \
+		$(TARGET_DIR)/var/www/popperjs/js/popper-utils.min.js
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
