From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 21:52:51 +0200
Subject: [Buildroot] [git commit] package/vuejs: new package
Message-ID: <20200329194403.476BD7FA68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=131216123bb5ed13ec44696b2c78d22669c87552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/vuejs/Config.in  |  6 ++++++
 package/vuejs/vuejs.hash |  3 +++
 package/vuejs/vuejs.mk   | 19 +++++++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f67ef86e6c..23aeb3d588 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1321,6 +1321,7 @@ F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/nginx-dav-ext/
+F:	package/vuejs/
 
 N:	John Stile <johns@msli.com>
 F:	package/dhcpcd/
diff --git a/package/Config.in b/package/Config.in
index 7b73198d50..f855076b5a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1542,6 +1542,7 @@ endif
 	source "package/json-javascript/Config.in"
 	source "package/openlayers/Config.in"
 	source "package/spidermonkey/Config.in"
+	source "package/vuejs/Config.in"
 endmenu
 
 menu "JSON/XML"
diff --git a/package/vuejs/Config.in b/package/vuejs/Config.in
new file mode 100644
index 0000000000..6456d288f9
--- /dev/null
+++ b/package/vuejs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_VUEJS
+	bool "vuejs"
+	help
+	  VueJS web application framework.
+
+	  http://vuejs.org
diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
new file mode 100644
index 0000000000..d2b30b8d34
--- /dev/null
+++ b/package/vuejs/vuejs.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 7ee4d5e4ec7d44fb9918ecb074ad7701eb0bcb3a840cee3c2924734ef3fd888a v2.6.11.tar.gz
+sha256 17fb24bc303763f3fe1911ee24e5225c7ad59f0e3a5d8123e9b730c100a306a6 LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
new file mode 100644
index 0000000000..f7e197c4af
--- /dev/null
+++ b/package/vuejs/vuejs.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# vuejs
+#
+################################################################################
+
+VUEJS_VERSION = 2.6.11
+VUEJS_SOURCE = v$(VUEJS_VERSION).tar.gz
+VUEJS_SITE = https://github.com/vuejs/vue/archive
+VUEJS_LICENSE = MIT
+VUEJS_LICENSE_FILES = LICENSE
+
+# Install .min.js as .js
+define VUEJS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/dist/vue.min.js \
+		$(TARGET_DIR)/var/www/vue.js
+endef
+
+$(eval $(generic-package))
