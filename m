From: Davide Viti <zinosat@tiscali.it>
Date: Thu,  6 Dec 2012 22:33:18 +0100
Subject: [Buildroot] [PATCH] tcllib: new package
In-Reply-To: <1354829598-16782-1-git-send-email-zinosat@tiscali.it>
References: <1354829598-16782-1-git-send-email-zinosat@tiscali.it>
Message-ID: <1354829598-16782-2-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


CC: yann.morin.1998 at free.fr
Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/Config.in        |    5 +++++
 package/tcllib/Config.in |   11 +++++++++++
 package/tcllib/tcllib.mk |   12 ++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/tcllib/Config.in
 create mode 100644 package/tcllib/tcllib.mk

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
index 0000000..fa8968d
--- /dev/null
+++ b/package/tcllib/tcllib.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# tcllib
+#
+#############################################################
+TCLLIB_VERSION       = 1.13
+TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.bz2
+TCLLIB_SITE          = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
+TCLLIB_LICENSE_FILES = license.terms
+TCLLIB_DEPENDENCIES  = host-tcl tcl
+
+$(eval $(autotools-package))
-- 
1.7.2.5
