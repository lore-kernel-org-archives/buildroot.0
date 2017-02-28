From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Feb 2017 23:26:07 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: fix build for toolchains without ssp
Message-ID: <1488320767-63856-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF to disable custom flags, in
particular -fstack-protector-strong which depends on
BR2_TOOLCHAIN_HAS_SSP

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.5.0
