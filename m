From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 22:26:20 +0200
Subject: [Buildroot] [git commit] libsodium: new package
Message-ID: <20150710204421.37F818198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03b5b63c248e9532c80b4363c6825a3f36c73167
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/libsodium/Config.in      |    6 ++++++
 package/libsodium/libsodium.hash |    2 ++
 package/libsodium/libsodium.mk   |   13 +++++++++++++
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4df5cdb..9f04b54 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -730,6 +730,7 @@ menu "Crypto"
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
index 0000000..c032863
--- /dev/null
+++ b/package/libsodium/libsodium.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libsodium
+#
+################################################################################
+
+LIBSODIUM_VERSION = 1.0.3
+LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/$(LIBSODIUM_VERSION)
+LIBSODIUM_LICENSE = ISC
+LIBSODIUM_LICENSE_FILES = LICENSE
+LIBSODIUM_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
