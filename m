From: Mikhail Boiko <mikhailboiko85@gmail.com>
Date: Sun, 23 Dec 2012 23:39:49 +0200
Subject: [Buildroot] [PATCH 2/2] liblinebreak: new package
Message-ID: <CAOWBBJxG=-FBHe42_tm6RymLzgCTHy4vA6D5f25jvjJwuAYrmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                    |    1 +
 package/liblinebreak/Config.in       |   10 ++++++++++
 package/liblinebreak/liblinebreak.mk |   14 ++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/liblinebreak/Config.in
 create mode 100644 package/liblinebreak/liblinebreak.mk

diff --git a/package/Config.in b/package/Config.in
index 4d45577..6572edc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -497,6 +497,7 @@ source "package/libevent/Config.in"
 source "package/libev/Config.in"
 source "package/libffi/Config.in"
 source "package/libfribidi/Config.in"
+source "package/liblinebreak/Config.in"
 source "package/gsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
diff --git a/package/liblinebreak/Config.in b/package/liblinebreak/Config.in
new file mode 100644
index 0000000..2787fe3
--- /dev/null
+++ b/package/liblinebreak/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBLINEBREAK
+ bool "liblinebreak"
+ help
+
+  Liblinebreak is an implementation of the line breaking
+  algorithm as described in Unicode 6.0.0 Standard. It
+  breaks lines that contain Unicode characters. It is
+  designed to be used in a generic text renderer.
+
+  http://vimgadgets.sourceforge.net/liblinebreak/
diff --git a/package/liblinebreak/liblinebreak.mk b/package/liblinebreak/
liblinebreak.mk
new file mode 100644
index 0000000..aaa6e33
--- /dev/null
+++ b/package/liblinebreak/liblinebreak.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# liblinebreak
+#
+#############################################################
+
+LIBLINEBREAK_VERSION = 2.1
+LIBLINEBREAK_SOURCE = liblinebreak-$(LIBLINEBREAK_VERSION).tar.gz
+LIBLINEBREAK_SITE =
http://downloads.sourceforge.net/project/vimgadgets/liblinebreak/$(LIBLINEBREAK_VERSION)
+LIBLINEBREAK_INSTALL_STAGING = YES
+LIBLINEBREAK_CONF_OPT = --disable-docs
+LIBLINEBREAK_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
-- 
1.7.9.5
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121223/32b85cae/attachment.html>
