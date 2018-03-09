From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  9 Mar 2018 20:36:05 +0100
Subject: [Buildroot] [PATCH 1/1] libcdio-paranoia: new package
Message-ID: <20180309193605.23701-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CD paranoia on top of libcdio

http://www.gnu.org/software/libcdio/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/libcdio-paranoia/Config.in             |  8 ++++++++
 package/libcdio-paranoia/libcdio-paranoia.hash |  3 +++
 package/libcdio-paranoia/libcdio-paranoia.mk   | 19 +++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/libcdio-paranoia/Config.in
 create mode 100644 package/libcdio-paranoia/libcdio-paranoia.hash
 create mode 100644 package/libcdio-paranoia/libcdio-paranoia.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e8ed14cd4..26a40d4e39 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -644,6 +644,7 @@ F:	package/alljoyn-base/
 F:	package/alljoyn-tcl/
 F:	package/alljoyn-tcl-base/
 F:	package/boinc/
+F:	package/libcdio-paranoia/
 F:	package/flatbuffers/
 F:	package/gtksourceview/
 F:	package/gssdp/
diff --git a/package/Config.in b/package/Config.in
index edcf03b70b..7a15990f00 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -987,6 +987,7 @@ menu "Audio/Sound"
 	source "package/libcdaudio/Config.in"
 	source "package/libcddb/Config.in"
 	source "package/libcdio/Config.in"
+	source "package/libcdio-paranoia/Config.in"
 	source "package/libcodec2/Config.in"
 	source "package/libcue/Config.in"
 	source "package/libcuefile/Config.in"
diff --git a/package/libcdio-paranoia/Config.in b/package/libcdio-paranoia/Config.in
new file mode 100644
index 0000000000..28c9ac9cd5
--- /dev/null
+++ b/package/libcdio-paranoia/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBCDIO_PARANOIA
+	bool "libcdio-paranoia"
+	depends on BR2_USE_MMU # libcdio
+	select BR2_PACKAGE_LIBCDIO
+	help
+	  CD paranoia on top of libcdio
+
+	  http://www.gnu.org/software/libcdio/
diff --git a/package/libcdio-paranoia/libcdio-paranoia.hash b/package/libcdio-paranoia/libcdio-paranoia.hash
new file mode 100644
index 0000000000..33e59ba704
--- /dev/null
+++ b/package/libcdio-paranoia/libcdio-paranoia.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 d60f82ece97eeb92407a9ee03f3499c8983206672c28ae5e4e22179063c81941  libcdio-paranoia-10.2+0.94+2.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio-paranoia/libcdio-paranoia.mk b/package/libcdio-paranoia/libcdio-paranoia.mk
new file mode 100644
index 0000000000..452c0297f9
--- /dev/null
+++ b/package/libcdio-paranoia/libcdio-paranoia.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libcdio-paranoia
+#
+################################################################################
+
+LIBCDIO_PARANOIA_VERSION = 10.2+0.94+2
+LIBCDIO_PARANOIA_SITE = $(BR2_GNU_MIRROR)/libcdio
+LIBCDIO_PARANOIA_INSTALL_STAGING = YES
+LIBCDIO_PARANOIA_LICENSE = GPL-3.0+
+LIBCDIO_PARANOIA_LICENSE_FILES = COPYING
+LIBCDIO_PARANOIA_DEPENDENCIES = libcdio
+LIBCDIO_PARANOIA_CONF_OPTS = --disable-example-progs
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+LIBCDIO_PARANOIA_CONF_OPTS += --disable-cxx
+endif
+
+$(eval $(autotools-package))
-- 
2.14.1
