From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 08 Mar 2021 07:44:56 -0000
Subject: [Buildroot] [git commit] package/libxcrypt: new package
Message-ID: <20210308072134.C1DE488918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=464bbe26ff5fb9e5bfe26a26ea65c700b90598f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libxcrypt is a modern library for one-way hashing of passwords.  It
supports a wide variety of both modern and historical hashing methods:
yescrypt, gost-yescrypt, scrypt, bcrypt, sha512crypt, sha256crypt,
md5crypt, SunMD5, sha1crypt, NT.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libxcrypt/Config.in      | 11 +++++++++++
 package/libxcrypt/libxcrypt.hash |  4 ++++
 package/libxcrypt/libxcrypt.mk   | 13 +++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cee62ddca8..42f3c66274 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1055,6 +1055,7 @@ F:	package/python-wtforms/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
+F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
diff --git a/package/Config.in b/package/Config.in
index 8fb173540f..1cfbabeb86 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1372,6 +1372,7 @@ menu "Crypto"
 	source "package/libssh2/Config.in"
 	source "package/libtomcrypt/Config.in"
 	source "package/libuecc/Config.in"
+	source "package/libxcrypt/Config.in"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
diff --git a/package/libxcrypt/Config.in b/package/libxcrypt/Config.in
new file mode 100644
index 0000000000..57ae8f67a3
--- /dev/null
+++ b/package/libxcrypt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBXCRYPT
+	bool "libxcrypt"
+	help
+	  libxcrypt is a modern library for one-way hashing
+	  of passwords. It supports a wide variety of both
+	  modern and historical hashing methods:
+	  yescrypt, gost-yescrypt, scrypt, bcrypt, sha512crypt,
+	  sha256crypt, md5crypt, SunMD5, sha1crypt, NT,
+	  bsdicrypt, bigcrypt, and descrypt.
+
+	  https://github.com/besser82/libxcrypt
diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
new file mode 100644
index 0000000000..b56ab6beaf
--- /dev/null
+++ b/package/libxcrypt/libxcrypt.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256 7665168d0409574a03f7b484682e68334764c29c21ca5df438955a381384ca07  libxcrypt-4.4.17.tar.gz
+sha256 f8198fcc4f002bf54512bac2e68e1e3f04af7d105f4f4f98d7d22cb110e04715  LICENSING
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
new file mode 100644
index 0000000000..f9799ac006
--- /dev/null
+++ b/package/libxcrypt/libxcrypt.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libxcrypt
+#
+################################################################################
+
+LIBXCRYPT_VERSION = 4.4.17
+LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
+LIBXCRYPT_LICENSE = LGPL-2.1+
+LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
+LIBXCRYPT_AUTORECONF = YES
+
+$(eval $(autotools-package))
