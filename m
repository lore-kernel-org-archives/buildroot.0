From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:42:07 +0100
Subject: [Buildroot] [PATCH 14/20] efl/libeio: new package
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <def1e95b3470173f129cd36c95f40260e9893594.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in        |    1 +
 package/efl/libeio/Config.in |   15 +++++++++++++++
 package/efl/libeio/libeio.mk |   15 +++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/efl/libeio/Config.in
 create mode 100644 package/efl/libeio/libeio.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index c783d7f..a526d87 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -13,6 +13,7 @@ source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libefreet/Config.in"
+source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
diff --git a/package/efl/libeio/Config.in b/package/efl/libeio/Config.in
new file mode 100644
index 0000000..889d079
--- /dev/null
+++ b/package/efl/libeio/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBEIO
+	bool "libeio"
+	help
+	  Eio integrates with EFL (Ecore, Eina) to provide efficient
+	  filesystem Input/Output? (I/O). It use the best techniques
+	  to achieve such purpose, like using at-variants, splice,
+	  properly handling errors and doing it in an asynchronous
+	  fashion by means of worker threads. It is also ported to
+	  Windows, so multi-platform.
+
+	  Whenever you need to list a directory, copy, move or delete
+	  files, Eio will do that task better than you'd achieve with
+	  naive implementations, and it is easy to use.
+
+	  http://trac.enlightenment.org/e/wiki/Eio
diff --git a/package/efl/libeio/libeio.mk b/package/efl/libeio/libeio.mk
new file mode 100644
index 0000000..c02fdc1
--- /dev/null
+++ b/package/efl/libeio/libeio.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libeio
+#
+#############################################################
+
+LIBEIO_VERSION = 1.7.4
+LIBEIO_SOURCE = eio-$(LIBEIO_VERSION).tar.bz2
+LIBEIO_SITE = http://download.enlightenment.org/releases/
+LIBEIO_LICENSE = LGPLv2.1
+LIBEIO_LICENSE_FILES = COPYING
+
+LIBEIO_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.9.5
