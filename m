From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 15 Feb 2021 10:41:34 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/x265: update project URL
Message-ID: <20210215094134.2250-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project moved to https://bitbucket.org/multicoreware/x265_git
The archive file has changed (but not its content) so update the hashes
too.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---

Changes for v2:
 - update hashes

 package/x265/Config.in | 2 +-
 package/x265/x265.hash | 5 ++---
 package/x265/x265.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/x265/Config.in b/package/x265/Config.in
index 180931db66..1067505d31 100644
--- a/package/x265/Config.in
+++ b/package/x265/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_X265
 	  General Public License (GPL) 2 license or a commercial
 	  license, similar to the x264 project.
 
-	  https://bitbucket.org/multicoreware/x265/wiki/Home
+	  https://bitbucket.org/multicoreware/x265_git/wiki/Home
 
 if BR2_PACKAGE_X265
 
diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 3d70ac0c67..a2246fc84d 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,5 +1,4 @@
-# From https://mailman.videolan.org/pipermail/x265-devel/2020-February/012880.html
-md5  0c8c747b59b5411dea8cf557554636c1  x265_3.3.tar.gz
 # Locally generated
-sha256  f26e148ed1f4dfb33fd1eb3ff5e60e08078d1b2017e88bcbb045b3fb58300b9c  x265_3.3.tar.gz
+md5  be6ea7a139b01fa6f2614d5c1197492d  x265_3.3.tar.gz
+sha256  c6d744a87eda55560da715f56f878640554ddc06e2d0fcbd822fa330affc22cc  x265_3.3.tar.gz
 sha256  d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 872753eea8..7bc1d11e19 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -6,7 +6,7 @@
 
 X265_VERSION = 3.3
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
-X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
+X265_SITE = https://bitbucket.org/multicoreware/x265_git/downloads
 X265_LICENSE = GPL-2.0+
 X265_LICENSE_FILES = COPYING
 X265_CPE_ID_VENDOR = multicorewareinc
@@ -19,7 +19,7 @@ X265_DEPENDENCIES += host-nasm
 endif
 
 # disable altivec, it has build issues
-# https://bitbucket.org/multicoreware/x265/issues/320/
+# https://bitbucket.org/multicoreware/x265_git/issues/320/
 ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 X265_CONF_OPTS += -DENABLE_ALTIVEC=OFF
 endif
-- 
2.26.2
