From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 17 Feb 2020 15:30:27 +0100
Subject: [Buildroot] [PATCH 1/4] package/libbytesize: add new package
In-Reply-To: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200217143030.5031-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libbytesize is a tiny library providing a C "class" for working with
arbitrary big sizes in bytes.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libbytesize/Config.in        | 10 ++++++++++
 package/libbytesize/libbytesize.hash |  3 +++
 package/libbytesize/libbytesize.mk   | 15 +++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/libbytesize/Config.in
 create mode 100644 package/libbytesize/libbytesize.hash
 create mode 100644 package/libbytesize/libbytesize.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5991ee505a..6f2dbbb11a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1009,6 +1009,7 @@ F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
+F:	package/libbytesize/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/minicom/
diff --git a/package/Config.in b/package/Config.in
index 6201c5d2c7..4d76a5791f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1782,6 +1782,7 @@ menu "Other"
 	source "package/libavl/Config.in"
 	source "package/libb64/Config.in"
 	source "package/libbsd/Config.in"
+	source "package/libbytesize/Config.in"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
diff --git a/package/libbytesize/Config.in b/package/libbytesize/Config.in
new file mode 100644
index 0000000000..a3b086ccbc
--- /dev/null
+++ b/package/libbytesize/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBBYTESIZE
+	bool "libbytesize"
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_MPFR
+	select BR2_PACKAGE_PCRE2
+	help
+	  A tiny library providing a C "class" for working with
+	  arbitrary big sizes in bytes.
+
+	  https://github.com/storaged-project/libbytesize/
diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
new file mode 100644
index 0000000000..2348ae2d25
--- /dev/null
+++ b/package/libbytesize/libbytesize.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 e2063d5123fca5c347d561a032e406b9b72b94f3c30f7159bb4619c5aef02ef4  libbytesize-2.2.tar.gz
+sha256 97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
new file mode 100644
index 0000000000..65cde2a2fc
--- /dev/null
+++ b/package/libbytesize/libbytesize.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libbytesize
+#
+################################################################################
+
+LIBBYTESIZE_VERSION = 2.2
+LIBBYTESIZE_SITE = $(call github,storaged-project,libbytesize,$(LIBBYTESIZE_VERSION))
+LIBBYTESIZE_LICENSE = LGPL-2.1+
+LIBBYTESIZE_LICENSE_FILES = LICENSE
+LIBBYTESIZE_DEPENDENCIES = gmp mpfr pcre2 host-pkgconf
+LIBBYTESIZE_INSTALL_STAGING = YES
+LIBBYTESIZE_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.20.1
