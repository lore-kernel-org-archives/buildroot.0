From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Dec 2013 07:13:28 -0300
Subject: [Buildroot] [PATCH] freetype: fix host headers as well
Message-ID: <1386324808-6094-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like on 0a9cedbcf49641b2569e0a137818ad9f8c539edd we also need to fix the
headers for the host variant.
Fixes:
http://autobuild.buildroot.net/results/261/261d6a59f144e44e51b38de98a7355a9eb8ac791/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 0f1bb88..c97cc1a 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -63,6 +63,10 @@ define FREETYPE_FIX_FREETYPE_INCLUDE
 	ln -sf . $(STAGING_DIR)/usr/include/freetype2/freetype
 endef
 FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_FREETYPE_INCLUDE
+define HOST_FREETYPE_FIX_FREETYPE_INCLUDE
+	ln -sf . $(HOST_DIR)/usr/include/freetype2/freetype
+endef
+HOST_FREETYPE_POST_INSTALL_HOOKS += HOST_FREETYPE_FIX_FREETYPE_INCLUDE
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
