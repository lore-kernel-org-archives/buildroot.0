From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Feb 2017 12:29:22 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: do not build tests
Message-ID: <1487503762-52200-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cjson/cjson.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 5ff990e..aea9578 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -9,5 +9,7 @@ CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
+CJSON_CONF_OPTS += \
+	-DENABLE_CJSON_TEST=OFF
 
 $(eval $(cmake-package))
-- 
2.5.0
