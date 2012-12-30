From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:31:52 +0100
Subject: [Buildroot] [PATCH 14/19] efl/libeio: new package
In-Reply-To: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20e90e4f0d2628322b0f376043b29668806cf3d3.1356849033.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in        |    1 +
 package/efl/libeio/Config.in |   18 ++++++++++++++++++
 package/efl/libeio/libeio.mk |   16 ++++++++++++++++
 3 files changed, 35 insertions(+)
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
index 0000000..0b2751c
--- /dev/null
+++ b/package/efl/libeio/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBEIO
+	bool "libeio"
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBECORE
+	help
+	  Eio integrates with EFL (Ecore, Eina) to provide efficient
+	  filesystem Input/Output (I/O). It use the best techniques to
+	  achieve such purpose, like using at-variants, splice,
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
index 0000000..f5e08de
--- /dev/null
+++ b/package/efl/libeio/libeio.mk
@@ -0,0 +1,16 @@
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
+LIBEIO_DEPENDENCIES = libeina libeet libecore
+
+$(eval $(autotools-package))
-- 
1.7.9.5
