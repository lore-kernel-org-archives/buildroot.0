From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Jun 2011 17:13:20 +0200
Subject: [Buildroot] [git commit] package: add yajl
Message-ID: <20110621153045.5F78488D84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a9f637383d1c4fc5161494460a0ce2d04f9066a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

yajl is Yet Another JSON Library.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    3 ++-
 package/yajl/Config.in |    8 ++++++++
 package/yajl/yajl.mk   |   11 +++++++++++
 3 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 package/yajl/Config.in
 create mode 100644 package/yajl/yajl.mk

diff --git a/package/Config.in b/package/Config.in
index 10d435c..85d50ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -354,13 +354,14 @@ source "package/readline/Config.in"
 source "package/slang/Config.in"
 endmenu
 
-menu "XML"
+menu "JSON/XML"
 source "package/expat/Config.in"
 source "package/ezxml/Config.in"
 source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
 source "package/libxslt/Config.in"
 source "package/xerces/Config.in"
+source "package/yajl/Config.in"
 endmenu
 
 endmenu
diff --git a/package/yajl/Config.in b/package/yajl/Config.in
new file mode 100644
index 0000000..be2c133
--- /dev/null
+++ b/package/yajl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_YAJL
+	bool "yajl"
+	help
+	  Yet Another JSON Library. YAJL is a small event-driven
+	  (SAX-style) JSON parser written in ANSI C, and a small
+	  validating JSON generator.
+
+	  http://lloyd.github.com/yajl/
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
new file mode 100644
index 0000000..e67a7da
--- /dev/null
+++ b/package/yajl/yajl.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# yajl
+#
+################################################################################
+
+YAJL_VERSION = 2.0.2
+YAJL_SITE = git://github.com/lloyd/yajl.git
+YAJL_INSTALL_STAGING = YES
+
+$(eval $(call CMAKETARGETS,package,yajl))
-- 
1.7.3.4
