From: Pedro Aguilar <paguilar@paguilar.org>
Date: Sun,  2 Nov 2014 16:15:44 +0100
Subject: [Buildroot] [PATCH 1/2] Add package bdwgc: A garbage collector for
	C and C++. The Boehm-Demers-Weiser conservative garbage
	collector can be used as a garbage collecting replacement for
	C 'malloc' or C++ 'new'.
In-Reply-To: <1414941345-16581-1-git-send-email-paguilar@paguilar.org>
References: <1414941345-16581-1-git-send-email-paguilar@paguilar.org>
Message-ID: <1414941345-16581-2-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/Config.in       |  1 +
 package/bdwgc/Config.in |  9 +++++++++
 package/bdwgc/bdwgc.mk  | 18 ++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/bdwgc/Config.in
 create mode 100644 package/bdwgc/bdwgc.mk

diff --git a/package/Config.in b/package/Config.in
index 3b3c372..bb158b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -942,6 +942,7 @@ endmenu
 menu "Miscellaneous"
 	source "package/aespipe/Config.in"
 	source "package/bc/Config.in"
+	source "package/bdwgc/Config.in"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
 	source "package/empty/Config.in"
diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
new file mode 100644
index 0000000..38f612f
--- /dev/null
+++ b/package/bdwgc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_BDWGC
+	bool "bdwgc"
+	help
+      The Boehm-Demers-Weiser conservative garbage collector can 
+      be used as a garbage collecting replacement for C 'malloc'
+      or C++ 'new'.
+
+      http://www.hboehm.info/gc/
+
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
new file mode 100644
index 0000000..9419265
--- /dev/null
+++ b/package/bdwgc/bdwgc.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# bdwgc
+#
+################################################################################
+
+BDWGC_VERSION = 7.2f
+BDWGC_SOURCE  = gc-$(BDWGC_VERSION).tar.gz
+BDWGC_SITE    = http://www.hboehm.info/gc/gc_source
+BDWGC_INSTALL_STAGING = YES
+BDWGC_LICENSE = GPL compatible
+BDWGC_LICENSE_FILES = README
+BDWGC_LIBTOOL_PATCH = NO
+
+BDWGC_DEPENDENCIES = host-bdwgc
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
