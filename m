From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Jun 2012 12:19:02 +0200
Subject: [Buildroot] [git commit] libfreefare: add missing openssl dependency
Message-ID: <20120617102014.331D996F39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=929c3e89a6715ecfdc8055ec82025cee5e8e23a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If openssl is not selected, configuration fails for the libfreefare package
as follows.

  configure: error: Cannot find libcrypto.

This patch adds the missing dependency on openssl.

[Peter: use select instead of depends on]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libfreefare/Config.in      |    1 +
 package/libfreefare/libfreefare.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 2e11f7e..13a8630 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library for high level manipulation of MIFARE cards.
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 0499999..16ef8fb 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -5,6 +5,6 @@
 #############################################################
 LIBFREEFARE_VERSION = 0.3.2
 LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
-LIBFREEFARE_DEPENDENCIES = libnfc
+LIBFREEFARE_DEPENDENCIES = libnfc openssl
 
 $(eval $(call AUTOTARGETS))
