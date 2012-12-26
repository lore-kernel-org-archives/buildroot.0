From: Mikhail Boiko <mikhailboiko85@gmail.com>
Date: Wed, 26 Dec 2012 09:43:58 +0200
Subject: [Buildroot] [PATCH 1/1] new package: libfribidi
Message-ID: <1356507838-9090-1-git-send-email-mikhailboiko85@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mikhail Boiko <mikhailboiko85@gmail.com>
---
 package/Config.in                |    1 +
 package/libfribidi/Config.in     |    7 +++++++
 package/libfribidi/libfribidi.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/libfribidi/Config.in
 create mode 100644 package/libfribidi/libfribidi.mk

diff --git a/package/Config.in b/package/Config.in
index 3d556b2..e60f22e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,6 +519,7 @@ source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libev/Config.in"
 source "package/libffi/Config.in"
+source "package/libfribidi/Config.in"
 source "package/gsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
diff --git a/package/libfribidi/Config.in b/package/libfribidi/Config.in
new file mode 100644
index 0000000..11aed62
--- /dev/null
+++ b/package/libfribidi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBFRIBIDI
+	bool "libfribidi"
+	help
+	  GNU FriBidi is an implementation of the Unicode 
+	  Bidirectional Algorithm (bidi).
+
+	  http://www.fribidi.org/
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
new file mode 100644
index 0000000..578438a
--- /dev/null
+++ b/package/libfribidi/libfribidi.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libfribidi
+#
+#############################################################
+
+LIBFRIBIDI_VERSION = 0.19.5
+LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
+LIBFRIBIDI_SITE = http://www.fribidi.org/download/
+LIBFRIBIDI_LICENSE = LGPLv2.1+
+LIBFRIBIDI_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.9.5
