From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Jul 2011 22:42:12 +0200
Subject: [Buildroot] [git commit] package: add libyaml
Message-ID: <20110714212725.9CE8F8A597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ca0c065cb7f50f7dfbb3f5c02361f5166d4101ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

YAML 1.1 parser and emitter written in C

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libyaml/Config.in  |    6 ++++++
 package/libyaml/libyaml.mk |   12 ++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/libyaml/Config.in
 create mode 100644 package/libyaml/libyaml.mk

diff --git a/package/Config.in b/package/Config.in
index fb5a570..db730ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -367,6 +367,7 @@ source "package/libroxml/Config.in"
 source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
 source "package/libxslt/Config.in"
+source "package/libyaml/Config.in"
 source "package/mxml/Config.in"
 source "package/xerces/Config.in"
 source "package/yajl/Config.in"
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
1.7.3.4
