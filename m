From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 16 May 2015 19:38:55 -0400
Subject: [Buildroot] [PATCH] libsodium: new package
Message-ID: <1431819535-9598-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/Config.in                |  1 +
 package/libsodium/Config.in      |  6 ++++++
 package/libsodium/libsodium.hash |  2 ++
 package/libsodium/libsodium.mk   | 14 ++++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/libsodium/Config.in
 create mode 100644 package/libsodium/libsodium.hash
 create mode 100644 package/libsodium/libsodium.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..5b99639 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -723,6 +723,7 @@ menu "Crypto"
 	source "package/libnss/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
+	source "package/libsodium/Config.in"
 	source "package/libssh2/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
diff --git a/package/libsodium/Config.in b/package/libsodium/Config.in
new file mode 100644
index 0000000..47b9bb3
--- /dev/null
+++ b/package/libsodium/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBSODIUM
+	bool "libsodium"
+	help
+	  A modern and easy-to-use crypto library.
+
+	  http://libsodium.org/
diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
new file mode 100644
index 0000000..089dc03
--- /dev/null
+++ b/package/libsodium/libsodium.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	cbcfc63cc90c05d18a20f229a62c7e7054a73731d0aa858c0517152c549b1288	libsodium-1.0.3.tar.gz
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
new file mode 100644
index 0000000..9445f5a
--- /dev/null
+++ b/package/libsodium/libsodium.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libsodium
+#
+################################################################################
+
+LIBSODIUM_VERSION = 1.0.3
+LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/${LIBSODIUM_VERSION}
+LIBSODIUM_LICENSE = ISC
+LIBSODIUM_LICENSE_FILES = LICENSE
+LIBSODIUM_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.1.4
