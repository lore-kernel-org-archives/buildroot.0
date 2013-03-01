From: Philipp Claves <claves@budelmann-elektronik.com>
Date: Fri,  1 Mar 2013 14:38:27 +0100
Subject: [Buildroot] [PATCH 1/3] Add libassuan IPC library
In-Reply-To: <20130301111856.4753d13b@skate>
References: <20130301111856.4753d13b@skate>
Message-ID: <1362145109-32509-1-git-send-email-claves@budelmann-elektronik.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philipp Claves <claves@budelmann-elektronik.com>
---
 package/Config.in              |  1 +
 package/libassuan/Config.in    | 10 ++++++++++
 package/libassuan/libassuan.mk | 15 +++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libassuan/Config.in
 create mode 100644 package/libassuan/libassuan.mk

diff --git a/package/Config.in b/package/Config.in
index faee5c3..a6910a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -379,6 +379,7 @@ source "package/beecrypt/Config.in"
 source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libassuan/Config.in"
 source "package/libmcrypt/Config.in"
 source "package/libmhash/Config.in"
 source "package/libnss/Config.in"
diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
new file mode 100644
index 0000000..16fb599
--- /dev/null
+++ b/package/libassuan/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBASSUAN
+	bool "libassuan"
+	select BR2_PACKAGE_LIBGPG_ERROR
+	help
+	  Libassuan is a small library implementing the so-called Assuan
+	  protocol.
+	  This protocol is used for IPC between most newer GnuPG components. 
+	  Both, server and client side functions are provided.
+
+	  http://www.gnupg.org/related_software/libassuan/
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
new file mode 100644
index 0000000..69dbe71
--- /dev/null
+++ b/package/libassuan/libassuan.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libassuan
+#
+#############################################################
+
+LIBASSUAN_VERSION = 2.0.3
+LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan/
+LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
+LIBASSUAN_LICENSE = LGPLv2.1+
+LIBASSUAN_LICENSE_FILES = COPYING.LIB
+LIBASSUAN_INSTALL_STAGING = YES
+LIBASSUAN_DEPENDENCIES = libgpg-error
+
+$(eval $(autotools-package))
-- 
1.8.1.4
