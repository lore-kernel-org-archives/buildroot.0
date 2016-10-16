From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 18:04:11 +0200
Subject: [Buildroot] [git commit] libite: new package
Message-ID: <20161016160531.BD20D818AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=878a9892ceb52d665e6cceca75304a72d2705de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
[Thomas:
 - rewrap Config.in help text
 - improve license description]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/libite/Config.in   | 17 +++++++++++++++++
 package/libite/libite.hash |  2 ++
 package/libite/libite.mk   | 14 ++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 56813ea..9399f63 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1309,6 +1309,7 @@ menu "Other"
 	source "package/libgee/Config.in"
 	source "package/libglib2/Config.in"
 	source "package/libical/Config.in"
+	source "package/libite/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
diff --git a/package/libite/Config.in b/package/libite/Config.in
new file mode 100644
index 0000000..80d2979
--- /dev/null
+++ b/package/libite/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBITE
+	bool "libite"
+	help
+	  Libite is a lightweight library of frog DNA. It can be used
+	  to fill the gaps in any dinosaur project. It holds useful
+	  functions and macros developed by both Finit and the OpenBSD
+	  project. Most notably the string functions: strlcpy(3),
+	  strlcat(3) and the highly useful *BSD sys/queue.h and
+	  sys/tree.h API's.
+
+	  Libite is the frog DNA missing in GNU libc. However, -lite
+	  does not aim to become another GLIB! One noticeable gap in
+	  GLIBC is the missing _SAFE macros in the BSD sys/queue.h API
+	  - highly recommended when traversing lists to delete/free
+	  nodes.
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
index 0000000..b56c430
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
+LIBITE_LICENSE = MIT, X11, ISC, BSD-2c
+LIBITE_LICENSE_FILES = LICENSE chomp.c pidfile.c
+LIBITE_INSTALL_STAGING = YES
+LIBITE_AUTORECONF = YES
+
+$(eval $(autotools-package))
