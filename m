From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:37:02 +0100
Subject: [Buildroot] [git commit] libsha1: new package
Message-ID: <20130112215436.862BF996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f83232e8d307f6184900c6e4a99a5f76dc66fa4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libsha1/Config.in  |    9 +++++++++
 package/libsha1/libsha1.mk |   15 +++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bd1db6b..fcc2480 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -371,6 +371,7 @@ source "package/gnutls/Config.in"
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
