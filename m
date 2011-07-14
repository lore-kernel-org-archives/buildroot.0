From: Evgeni Dobrev <evgeni_dobrev@developer.bg>
Date: Thu, 14 Jul 2011 13:56:47 +0200
Subject: [Buildroot] [PATCH] New package: libyaml
Message-ID: <1310644607-25251-1-git-send-email-evgeni_dobrev@developer.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

YAML 1.1 parser and emitter written in C
---
 package/Config.in          |    1 +
 package/libyaml/Config.in  |    8 ++++++++
 package/libyaml/libyaml.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/libyaml/Config.in
 create mode 100644 package/libyaml/libyaml.mk

diff --git a/package/Config.in b/package/Config.in
index fb5a570..dee3b70 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -345,6 +345,7 @@ source "package/libglib2/Config.in"
 source "package/libnspr/Config.in"
 source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
+source "package/libyaml/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
diff --git a/package/libyaml/Config.in b/package/libyaml/Config.in
new file mode 100644
index 0000000..23e74a5
--- /dev/null
+++ b/package/libyaml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBYAML
+	bool "libyaml"
+	default n
+	help
+	LibYAML is a YAML 1.1 parser and emitter written in C.
+
+	http://pyyaml.org/wiki/LibYAML
+
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
new file mode 100644
index 0000000..2e936fc
--- /dev/null
+++ b/package/libyaml/libyaml.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# yaml
+#
+#############################################################
+LIBYAML_VERSION = 0.1.4
+LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
+LIBYAML_SITE = http://pyyaml.org/download/libyaml/
+LIBYAML_INSTALL_STAGING = YES
+LIBYAML_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS,package,libyaml))
+
+
-- 
1.7.2.5
