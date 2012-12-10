From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 22:36:03 +0100
Subject: [Buildroot] [git commit] tcllib: new package
Message-ID: <20121210213739.7974E9A1A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ffda3e241c4d57394d9f5eeb19e41a3546c0495
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Davide Viti <zinosat@tiscali.it>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    5 +++++
 package/tcllib/Config.in |   11 +++++++++++
 package/tcllib/tcllib.mk |   14 ++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 74e439e..cad1221 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,11 @@ endmenu
 endif
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
+if BR2_PACKAGE_TCL
+menu "tcl libraries/modules"
+source "package/tcllib/Config.in"
+endmenu
+endif
 endmenu
 
 menu "Libraries"
diff --git a/package/tcllib/Config.in b/package/tcllib/Config.in
new file mode 100644
index 0000000..b0a4ad0
--- /dev/null
+++ b/package/tcllib/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TCLLIB
+	bool "tcllib"
+	help
+	  Tcllib is a collection of utility modules for Tcl. These
+	  modules provide a wide variety of functionality, from
+	  implementations of standard data structures to
+	  implementations of common networking protocols. The intent
+	  is to collect commonly used function into a single library,
+	  which users can rely on to be available and stable
+
+	  http://tcl.activestate.com/software/tcllib/
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
new file mode 100644
index 0000000..09d617f
--- /dev/null
+++ b/package/tcllib/tcllib.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# tcllib
+#
+#############################################################
+TCLLIB_VERSION       = 1.13
+TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.bz2
+TCLLIB_SITE          = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
+TCLLIB_LICENSE       = tcl license
+TCLLIB_LICENSE_FILES = license.terms
+TCLLIB_DEPENDENCIES  = host-tcl
+TCLLIB_CONF_ENV      = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh8.4"
+
+$(eval $(autotools-package))
