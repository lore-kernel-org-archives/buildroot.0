From: Alexander Dahl <post@lespocky.de>
Date: Thu, 29 Oct 2015 08:13:01 +0100
Subject: [Buildroot] [PATCH 1/2] libuecc: add new package
Message-ID: <1446102782-4565-1-git-send-email-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is a small library used for the Freifunk Gluon project and
will be used by other upcoming packages. It's my first buildroot package
and I tried to follow the documentation as close as possible, however as
you might suppose I'm open for any suggestions.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/Config.in          |  1 +
 package/libuecc/Config.in  |  6 ++++++
 package/libuecc/libuecc.mk | 13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/libuecc/Config.in
 create mode 100644 package/libuecc/libuecc.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..64b7b50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -763,6 +763,7 @@ menu "Crypto"
 	source "package/libsodium/Config.in"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
+	source "package/libuecc/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/polarssl/Config.in"
diff --git a/package/libuecc/Config.in b/package/libuecc/Config.in
new file mode 100644
index 0000000..8922898
--- /dev/null
+++ b/package/libuecc/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBUECC
+	bool "libuecc"
+	help
+	  Very small Elliptic Curve Cryptography library
+	
+	  http://git.universe-factory.net/libuecc
diff --git a/package/libuecc/libuecc.mk b/package/libuecc/libuecc.mk
new file mode 100644
index 0000000..bddb7d5
--- /dev/null
+++ b/package/libuecc/libuecc.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libuecc
+#
+################################################################################
+
+LIBUECC_VERSION = v6
+LIBUECC_SITE = git://git.universe-factory.net/libuecc
+LIBUECC_LICENSE = BSD-2c
+LIBUECC_LICENSE_FILES = COPYRIGHT
+LIBUECC_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.1.4
