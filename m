From: Mikhail Boiko <mikhailboiko85@gmail.com>
Date: Sun, 23 Dec 2012 23:39:14 +0200
Subject: [Buildroot] [PATCH 1/2] libfribidi: new package
Message-ID: <CAOWBBJxB8rzAUNJNap5sLQppA68wcBByKZeE=hQK0a267zuQ7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                |    1 +
 package/libfribidi/Config.in     |    7 +++++++
 package/libfribidi/libfribidi.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/libfribidi/Config.in
 create mode 100644 package/libfribidi/libfribidi.mk

diff --git a/package/Config.in b/package/Config.in
index 5d9783a..4d45577 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -496,6 +496,7 @@ source "package/libelf/Config.in"
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
+ bool "libfribidi"
+ help
+  GNU FriBidi is an implementation of the Unicode
+  Bidirectional Algorithm (bidi).
+
+  http://www.fribidi.org/
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/
libfribidi.mk
new file mode 100644
index 0000000..5cd1bc9
--- /dev/null
+++ b/package/libfribidi/libfribidi.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libfribidi
+#
+#############################################################
+
+LIBFRIBIDI_VERSION = 0.19.5
+LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
+LIBFRIBIDI_SITE = http://www.fribidi.org/download/
+LIBFRIBIDI_INSTALL_STAGING = YES
+LIBFRIBIDI_CONF_OPT = --disable-docs
+LIBFRIBIDI_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
-- 
1.7.9.5
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121223/39d54ca5/attachment-0001.html>
