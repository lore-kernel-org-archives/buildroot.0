From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 17:16:08 +0100
Subject: [Buildroot] [git commit] package/libnspr: bump version to 4.25
Message-ID: <20200201160734.919628800C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40f73486ba4e3f565e1d2b0636cfd3977faffbe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xtensa architecture has been added. Let's use upstream sha1 for
tarball's hash.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnspr/Config.in    | 1 -
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 57fcbdf6be..c1be7151e0 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	def_bool y
-	depends on !BR2_xtensa
 
 if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 
diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 0ec475f480..cdbf6ce69d 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.20/src/SHA256SUMS
-sha256	90a59a0df6a11528749647fe18401cc7e03881e3e63c309f8c520ce06dd413d0  nspr-4.24.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.25/src/SHA256SUMS
+sha256	0bc309be21f91da4474c56df90415101c7f0c7c7cab2943cd943cd7896985256  nspr-4.25.tar.gz
 # Locally calculated
 sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 42b4350d90..857052d8c7 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.24
+LIBNSPR_VERSION = 4.25
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
