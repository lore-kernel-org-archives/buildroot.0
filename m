From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  8 Apr 2013 07:31:43 +0100
Subject: [Buildroot] [PATCH v2] libsigsegv: new package
Message-ID: <1365402703-3124-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 v2: Use $(BR2_GNU_MIRROR), as suggested by Thomas Petazzoni; add acks

 package/Config.in                |    1 +
 package/libsigsegv/Config.in     |    6 ++++++
 package/libsigsegv/libsigsegv.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/libsigsegv/Config.in
 create mode 100644 package/libsigsegv/libsigsegv.mk

diff --git a/package/Config.in b/package/Config.in
index 69d87f0..9fec8ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -570,6 +570,7 @@ source "package/libnspr/Config.in"
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
-- 
1.7.10.4
