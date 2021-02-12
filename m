From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 12 Feb 2021 10:11:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/x265: update project URL
Message-ID: <20210212091138.27649-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project moved to https://bitbucket.org/multicoreware/x265_git

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/x265/Config.in | 2 +-
 package/x265/x265.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
