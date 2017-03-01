From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:48:41 +0100
Subject: [Buildroot] [git commit] cjson: fix build for toolchains without ssp
Message-ID: <20170301204904.5BF2A8228B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e01248c4cfd34a66517dc2c57d4478e3ce31ba43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF to disable custom flags, in
particular -fstack-protector-strong which depends on
BR2_TOOLCHAIN_HAS_SSP

Fixes:

  http://autobuild.buildroot.net/results/cfcf3bc8066159dfddd1786954d78e8527858f2f/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index aea9578..c554654 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -9,7 +9,10 @@ CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
+# Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF in particular to disable
+# -fstack-protector-strong which depends on BR2_TOOLCHAIN_HAS_SSP
 CJSON_CONF_OPTS += \
-	-DENABLE_CJSON_TEST=OFF
+	-DENABLE_CJSON_TEST=OFF \
+	-DENABLE_CUSTOM_COMPILER_FLAGS=OFF
 
 $(eval $(cmake-package))
