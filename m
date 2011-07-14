From: Evgeni Dobrev <evgeni_dobrev@developer.bg>
Date: Thu, 14 Jul 2011 22:27:51 +0200
Subject: [Buildroot] [PATCH] XML 1.1 parser and emitter written in C
In-Reply-To: <1310644607-25251-1-git-send-email-evgeni_dobrev@developer.bg>
References: <1310644607-25251-1-git-send-email-evgeni_dobrev@developer.bg>
Message-ID: <1310675271-7398-1-git-send-email-evgeni_dobrev@developer.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in          |    1 +
 package/libyaml/Config.in  |    6 ++++++
 package/libyaml/libyaml.mk |   12 ++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/libyaml/Config.in
 create mode 100644 package/libyaml/libyaml.mk

diff --git a/package/Config.in b/package/Config.in
index fb5a570..25e6d3a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ source "package/libxslt/Config.in"
 source "package/mxml/Config.in"
 source "package/xerces/Config.in"
 source "package/yajl/Config.in"
+source "package/libyaml/Config.in"
 endmenu
 
 endmenu
diff --git a/package/libyaml/Config.in b/package/libyaml/Config.in
new file mode 100644
index 0000000..00a48b2
--- /dev/null
+++ b/package/libyaml/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBYAML
+	bool "libyaml"
+	help
+	  LibYAML is a YAML 1.1 parser and emitter written in C.
+
+	  http://pyyaml.org/wiki/LibYAML
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
new file mode 100644
index 0000000..563b1ba
--- /dev/null
+++ b/package/libyaml/libyaml.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libyaml
+#
+#############################################################
+LIBYAML_VERSION = 0.1.4
+LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
+LIBYAML_SITE = http://pyyaml.org/download/libyaml/
+LIBYAML_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libyaml))
+
-- 
1.7.2.5
