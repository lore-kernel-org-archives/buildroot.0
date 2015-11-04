From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 21:42:30 +0100
Subject: [Buildroot] [git commit] libuecc: new package
Message-ID: <20151104204649.E202581E9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ae362f09a36f96d63c8a24bde9ad2ddf6211642
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is a small library used for the Freifunk Gluon project
and will be used by other upcoming packages.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/libuecc/Config.in  |    6 ++++++
 package/libuecc/libuecc.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3a0bd2f..98411b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -764,6 +764,7 @@ menu "Crypto"
 	source "package/libsodium/Config.in"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
+	source "package/libuecc/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/polarssl/Config.in"
diff --git a/package/libuecc/Config.in b/package/libuecc/Config.in
new file mode 100644
index 0000000..34bbea2
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
