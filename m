From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Apr 2014 22:10:21 -0300
Subject: [Buildroot] [PATCH] freetype: host variant needs to run autogen too
Message-ID: <1398215421-1844-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/fb8/fb8e38bcc73ff60a71df7558a1a4d6cc7cc9157f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 2f8d497..c7c9a06 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -26,6 +26,7 @@ define FREETYPE_RUN_AUTOGEN
 	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
 endef
 FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
+HOST_FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
 FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
 HOST_FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
 
-- 
1.8.3.2
