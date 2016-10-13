From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 12 Oct 2016 20:42:45 -0700
Subject: [Buildroot] [PATCH 1/3] libite: new package
Message-ID: <20161013034247.21603-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/libite/Config.in   | 15 +++++++++++++++
 package/libite/libite.hash |  2 ++
 package/libite/libite.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/libite/Config.in
 create mode 100644 package/libite/libite.hash
 create mode 100644 package/libite/libite.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ae3150..7a23c78 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1259,6 +1259,9 @@ F:	package/python-pysnmp-apps/
 F:	package/python-pysnmp-mibs/
 F:	package/python-tornado/
 
+N:	Ryan Coe <bluemrp9@gmail.com>
+F:	package/libite/
+
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
diff --git a/package/Config.in b/package/Config.in
index 60184ce..4c3f588 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1310,6 +1310,7 @@ menu "Other"
 	source "package/libgee/Config.in"
 	source "package/libglib2/Config.in"
 	source "package/libical/Config.in"
+	source "package/libite/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
diff --git a/package/libite/Config.in b/package/libite/Config.in
new file mode 100644
index 0000000..78ac22f
--- /dev/null
+++ b/package/libite/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBITE
+	bool "libite"
+	help
+	  Libite is a lightweight library of frog DNA. It can be used to fill
+	  the gaps in any dinosaur project. It holds useful functions and
+	  macros developed by both Finit and the OpenBSD project. Most notably
+	  the string functions: strlcpy(3), strlcat(3) and the highly useful
+	  *BSD sys/queue.h and sys/tree.h API's.
+
+	  Libite is the frog DNA missing in GNU libc. However, -lite does not
+	  aim to become another GLIB! One noticeable gap in GLIBC is the
+	  missing _SAFE macros in the BSD sys/queue.h API - highly recommended
+	  when traversing lists to delete/free nodes.
+
+	  https://github.com/troglobit/libite
diff --git a/package/libite/libite.hash b/package/libite/libite.hash
new file mode 100644
index 0000000..67ad009
--- /dev/null
+++ b/package/libite/libite.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b27e4af69e9e5b4d00924538d3a41b53752082cc439b9246edec5501aff2f22f libite-v1.8.2.tar.gz
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
new file mode 100644
index 0000000..ff19aa2
--- /dev/null
+++ b/package/libite/libite.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libite
+#
+################################################################################
+
+LIBITE_VERSION = v1.8.2
+LIBITE_SITE = $(call github,troglobit,libite,$(LIBITE_VERSION))
+LIBITE_LICENSE = MIT X11 ISC BSD
+LIBITE_LICENSE_FILES = LICENSE
+LIBITE_INSTALL_STAGING = YES
+LIBITE_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.9.3
