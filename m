From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:23 +0100
Subject: [Buildroot] [PATCH 11/28] libsha1: new package
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9d9598b93027b4ca36e4e4d9bc463c748757d636.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/libsha1/Config.in  |    9 +++++++++
 package/libsha1/libsha1.mk |   15 +++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/libsha1/Config.in
 create mode 100644 package/libsha1/libsha1.mk

diff --git a/package/Config.in b/package/Config.in
index 047af8d..5c2182c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -367,6 +367,7 @@ source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libnss/Config.in"
+source "package/libsha1/Config.in"
 source "package/nettle/Config.in"
 source "package/ocf-linux/Config.in"
 source "package/openssl/Config.in"
diff --git a/package/libsha1/Config.in b/package/libsha1/Config.in
new file mode 100644
index 0000000..5467a6c
--- /dev/null
+++ b/package/libsha1/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBSHA1
+	bool "libsha1"
+	help
+	  libsha1 is a tiny library providing SHA1 implementation,
+	  created for facilitating X server compilation on devices
+	  when larger libraries containing SHA1 implementations
+	  (OpenSSL, Mozilla NSS) are not needed.
+
+	  https://github.com/dottedmag/libsha1
diff --git a/package/libsha1/libsha1.mk b/package/libsha1/libsha1.mk
new file mode 100644
index 0000000..e9658af
--- /dev/null
+++ b/package/libsha1/libsha1.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libsha1
+#
+#############################################################
+
+LIBSHA1_VERSION = 0.3
+LIBSHA1_SITE = http://github.com/dottedmag/libsha1/tarball/$(LIBSHA1_VERSION)
+LIBSHA1_INSTALL_STAGING = YES
+
+# We're getting the source code from Github, so there is no generated
+# configure script in the tarball.
+LIBSHA1_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.7.9.5
