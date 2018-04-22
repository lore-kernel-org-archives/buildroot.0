From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 Apr 2018 13:55:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/ccid: bump version to 1.4.29
In-Reply-To: <20180422115518.2353-1-bernd.kuhls@t-online.de>
References: <20180422115518.2353-1-bernd.kuhls@t-online.de>
Message-ID: <20180422115518.2353-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream moved to https://ccid.apdu.fr/ according to
http://pcsclite.alioth.debian.org/ccid.html, updated _SITE and
Config.in.

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ccid/Config.in | 2 +-
 package/ccid/ccid.hash | 6 +++---
 package/ccid/ccid.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index dfb57e82c1..599bcc042a 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_CCID
 	help
 	  PC/SC driver for USB CCID smart card readers
 
-	  http://pcsclite.alioth.debian.org/ccid.html
+	  https://ccid.apdu.fr/
 
 comment "ccid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index a7d4875c0d..eb2219393b 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
-# From http://cdn-fastly.deb.debian.org/debian/pool/main/c/ccid/ccid_1.4.27-1.dsc
-sha1 d72ee816422183a86006e0083ccd643236b4e12a  ccid_1.4.27.tar.bz2
-sha256 a660e269606986cb94840ad5ba802ffb0cd23dd12b98f69a35035e0deb9dd137  ccid_1.4.27.tar.bz2
+# Locally computed
+sha256 a5432ae845730493c04e59304b5c0c6103cd0e2c8827df57d69469a3eaaab84d  ccid-1.4.29.tar.bz2
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index e566afe07e..c9b95a6234 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.27
-CCID_SOURCE = ccid_$(CCID_VERSION).tar.bz2
-CCID_SITE = https://alioth.debian.org/frs/download.php/file/4218
+CCID_VERSION = 1.4.29
+CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
+CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
-- 
2.14.2
