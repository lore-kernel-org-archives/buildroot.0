From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Dec 2017 19:17:32 +0100
Subject: [Buildroot] [PATCH 1/1] safeclib: new package
Message-ID: <20171217181732.13814-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

safec fork with all C11 Annex K functions

This library implements the secure C11 Annex K functions on
top of most libc implementations, which are missing from them.

https://rurban.github.io/safeclib/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/safeclib/Config.in     |  9 +++++++++
 package/safeclib/safeclib.hash |  3 +++
 package/safeclib/safeclib.mk   | 15 +++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/safeclib/Config.in
 create mode 100644 package/safeclib/safeclib.hash
 create mode 100644 package/safeclib/safeclib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 30067d3749..48f70a7eff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -634,6 +634,7 @@ F:	package/libupnp18/
 F:	package/minissdpd/
 F:	package/motion/
 F:	package/rygel/
+F:	package/safeclib/
 F:	package/tinycbor/
 F:	package/tinydtls/
 
diff --git a/package/Config.in b/package/Config.in
index cae1624cb1..09c6b11bb4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1545,6 +1545,7 @@ menu "Security"
 	source "package/libselinux/Config.in"
 	source "package/libsemanage/Config.in"
 	source "package/libsepol/Config.in"
+	source "package/safeclib/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/safeclib/Config.in b/package/safeclib/Config.in
new file mode 100644
index 0000000000..5117c49da7
--- /dev/null
+++ b/package/safeclib/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SAFECLIB
+	bool "safeclib"
+	help
+	  safec fork with all C11 Annex K functions
+
+	  This library implements the secure C11 Annex K functions on
+	  top of most libc implementations, which are missing from them.
+
+	  https://rurban.github.io/safeclib/
diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
new file mode 100644
index 0000000000..95a862eef0
--- /dev/null
+++ b/package/safeclib/safeclib.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	9c09c6e9fc95207c7d45944f8b669f2454056bef2bbaef70c94ba3f81be1cbb2	safeclib-v09102017.tar.gz
+sha256	c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b	COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
new file mode 100644
index 0000000000..65c6621e0a
--- /dev/null
+++ b/package/safeclib/safeclib.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# safeclib
+#
+################################################################################
+
+SAFECLIB_VERSION = v09102017
+SAFECLIB_SITE = $(call github,rurban,safeclib,$(SAFECLIB_VERSION))
+SAFECLIB_LICENSE = MIT 
+SAFECLIB_LICENSE_FILES = COPYING
+SAFECLIB_INSTALL_STAGING = YES
+# From git
+SAFECLIB_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.14.1
