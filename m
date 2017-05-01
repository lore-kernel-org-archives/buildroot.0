From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 May 2017 20:47:04 +0200
Subject: [Buildroot] [git commit] fdk-aac: bump to version 0.1.5
Message-ID: <20170501185524.C833682853@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=833466aeecb9146da3d42aa6fe34c1e75d7f3df8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, remove the compile flags to make it build
with GCC6 as it was added upstream

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fdk-aac/fdk-aac.hash | 2 +-
 package/fdk-aac/fdk-aac.mk   | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
index 28a1eee..cd2e868 100644
--- a/package/fdk-aac/fdk-aac.hash
+++ b/package/fdk-aac/fdk-aac.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  5910fe788677ca13532e3f47b7afaa01d72334d46a2d5e1d1f080f1173ff15ab  fdk-aac-0.1.4.tar.gz
+sha256  2164592a67b467e5b20fdcdaf5bd4c50685199067391c6fcad4fa5521c9b4dd7  fdk-aac-0.1.5.tar.gz
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index 45a3cf5..0c9662e 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 0.1.4
+FDK_AAC_VERSION = 0.1.5
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
 
 FDK_AAC_INSTALL_STAGING = YES
 
-# Not compatible with GCC 6 which defaults to GNU++14
-FDK_AAC_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++98"
-
 $(eval $(autotools-package))
