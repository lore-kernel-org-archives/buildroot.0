From: David GOUARIN <dgouarin@gmail.com>
Date: Mon, 21 Sep 2020 18:58:33 +0200
Subject: [Buildroot] [PATCH 1/2] packages/librelp: new package.
In-Reply-To: <20200921165834.7514-1-dgouarin@gmail.com>
References: <20200921165834.7514-1-dgouarin@gmail.com>
Message-ID: <20200921165834.7514-2-dgouarin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reliable Logging Protocol library.

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
---
 package/Config.in            |  1 +
 package/librelp/Config.in    | 10 ++++++++++
 package/librelp/librelp.hash |  6 ++++++
 package/librelp/librelp.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/librelp/Config.in
 create mode 100644 package/librelp/librelp.hash
 create mode 100644 package/librelp/librelp.mk

diff --git a/package/Config.in b/package/Config.in
index 0282a2069f..5c1001cf7f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1806,6 +1806,7 @@ menu "Networking"
 	source "package/zeromq/Config.in"
 	source "package/zmqpp/Config.in"
 	source "package/zyre/Config.in"
+	source "package/librelp/Config.in"
 endmenu
 
 menu "Other"
diff --git a/package/librelp/Config.in b/package/librelp/Config.in
new file mode 100644
index 0000000000..3bfe466bfa
--- /dev/null
+++ b/package/librelp/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBRELP
+	bool "librelp"
+	select BR2_PACKAGE_GNUTLS
+	# dependencies of gnutls
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	help
+	  Reliable Event Logging Protocol library
+
+	  https://www.rsyslog.com/librelp/
diff --git a/package/librelp/librelp.hash b/package/librelp/librelp.hash
new file mode 100644
index 0000000000..b188b2bd22
--- /dev/null
+++ b/package/librelp/librelp.hash
@@ -0,0 +1,6 @@
+# From http://download.rsyslog.com/librelp/librelp-1.2.16.tar.gz
+sha256	0c235dd2a01060ad5e64438879b31ae64e7640d0e262aa1a287a2dd9bc60fd53	librelp-1.2.16.tar.gz
+
+# Hash for license file:
+sha256	1ed76f935566e93e3c3c0d9f8fad22eb6d8bbe406e2eb8470a4a2764d9fd9685	COPYING
+
diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
new file mode 100644
index 0000000000..6265a627cb
--- /dev/null
+++ b/package/librelp/librelp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# librelp
+#
+################################################################################
+
+LIBRELP_VERSION = 1.2.16
+LIBRELP_SITE = http://download.rsyslog.com/librelp/librelp-1.2.16.tar.gz
+LIBRELP_LICENSE = GPL-3.0
+LIBRELP_LICENSE_FILES = COPYING
+LIBRELP_INSTALL_STAGING = YES
+LIBRELP_DEPENDENCIES = gnutls
+
+$(eval $(autotools-package))
-- 
2.17.1
