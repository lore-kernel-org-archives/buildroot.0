From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 14:55:37 +0200
Subject: [Buildroot] [git commit] scrypt: new package
Message-ID: <20150901083108.0C6857F95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84face61cf1dfefe864d6d47976932a32bbde9f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - move from "Libraries -> Crypto" to "System tools", since it only
    installs one binary, scrypt, and no library.
  - bump from 1.1.6 to 1.2.0
  - add comment in the .hash file explaining where the hash is coming
    from.
  - add missing dependency on OpenSSL
  - use BSD-2c as the license code, instead of BSD2
  - use 'main.c' as the license file.]

Signed-off-by: Parnell Springmeyer <parnell@digitalmentat.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/scrypt/Config.in   |    8 ++++++++
 package/scrypt/scrypt.hash |    1 +
 package/scrypt/scrypt.mk   |   13 +++++++++++++
 4 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1bc31fa..5b8084d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -754,6 +754,7 @@ menu "Crypto"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/polarssl/Config.in"
+	source "package/scrypt/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/scrypt/Config.in b/package/scrypt/Config.in
new file mode 100644
index 0000000..8be7f54
--- /dev/null
+++ b/package/scrypt/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SCRYPT
+	bool "scrypt"
+	help
+	  A password-based key derivation function specifically designed
+	  to make it costly to perform large-scale custom hardware attacks
+	  by requiring large amounts of memory.
+
+	  http://www.tarsnap.com/scrypt.html
diff --git a/package/scrypt/scrypt.hash b/package/scrypt/scrypt.hash
new file mode 100644
index 0000000..e6b690e
--- /dev/null
+++ b/package/scrypt/scrypt.hash
@@ -0,0 +1 @@
+sha256 dfd0d1a544439265bbb9b58043ad3c8ce50a3987b44a61b1d39fd7a3ed5b7fb8  scrypt-1.1.6.tgz
diff --git a/package/scrypt/scrypt.mk b/package/scrypt/scrypt.mk
new file mode 100644
index 0000000..2db6e2e
--- /dev/null
+++ b/package/scrypt/scrypt.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# scrypt
+#
+################################################################################
+
+SCRYPT_VERSION = 1.1.6
+SCRYPT_SOURCE = scrypt-$(SCRYPT_VERSION).tgz
+SCRYPT_SITE = http://www.tarsnap.com/scrypt
+SCRYPT_LICENSE = BSD2
+SCRYPT_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
