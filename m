From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 12:26:18 +0100
Subject: [Buildroot] [git commit] package/popperjs: new package
Message-ID: <20210102111312.3FF6D82804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=239f440a173feab7d046dfbb61a90b8626db00af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/popperjs/Config.in     |  6 ++++++
 package/popperjs/popperjs.hash |  3 +++
 package/popperjs/popperjs.mk   | 19 +++++++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6a0c2ed7b9..a618b11d98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2545,6 +2545,7 @@ F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
 F:	package/perl-path-class/
 F:	package/pigz/
+F:	package/popperjs/
 F:	package/xenomai/
 F:	support/scripts/size-stats
 F:	support/testing/tests/package/test_perl_lwp_protocol_https.py
diff --git a/package/Config.in b/package/Config.in
index 6451ad4b47..9f55133c12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1603,6 +1603,7 @@ endif
 	source "package/json-javascript/Config.in"
 	source "package/jszip/Config.in"
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
index 0000000000..d9cdabc32c
--- /dev/null
+++ b/package/popperjs/popperjs.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	83eecef51d10826faca2cd5cabb344e0bef6d4127d7e728db9e4d8308b7b15d1  popperjs-1.16.0.tar.gz
+sha256	2961310ed05cd9373a08b8191c071425a7fede0ca5d807ca38fa5f5f61c5b834  LICENSE.md
diff --git a/package/popperjs/popperjs.mk b/package/popperjs/popperjs.mk
new file mode 100644
index 0000000000..c5df302eb2
--- /dev/null
+++ b/package/popperjs/popperjs.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# popperjs
+#
+################################################################################
+
+POPPERJS_VERSION = 1.16.0
+POPPERJS_SITE = $(call github,popperjs,popper-core,v$(POPPERJS_VERSION))
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
