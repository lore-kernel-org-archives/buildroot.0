From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:25:03 +0200
Subject: [Buildroot] [git commit] libsigsegv: new package
Message-ID: <20130421212658.9FB019B794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90a8c814a1cd1362704dc0e1528760b98eb5e1c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/libsigsegv/Config.in     |    6 ++++++
 package/libsigsegv/libsigsegv.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b9fe726..477cc85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -575,6 +575,7 @@ source "package/libnspr/Config.in"
 source "package/libpfm4/Config.in"
 source "package/libpthsem/Config.in"
 source "package/libsigc/Config.in"
+source "package/libsigsegv/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
 source "package/libseccomp/Config.in"
diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
new file mode 100644
index 0000000..c46bb92
--- /dev/null
+++ b/package/libsigsegv/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBSIGSEGV
+	bool "libsigsegv"
+	help
+	  Library for handling page faults in user mode.
+
+	  http://libsigsegv.sourceforge.net/
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
new file mode 100644
index 0000000..b8f84da
--- /dev/null
+++ b/package/libsigsegv/libsigsegv.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libsigsegv
+#
+#############################################################
+
+LIBSIGSEGV_VERSION = 2.6
+LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
+LIBSIGSEGV_INSTALL_STAGING = YES
+LIBSIGSEGV_LICENSE = GPLv2+
+LIBSIGSEGV_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
