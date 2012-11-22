From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:06 +0100
Subject: [Buildroot] [PATCH 16/33] libmad: do not install mad.pc on the
	target
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-17-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libmad/libmad.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index d9ce0ae..6999b66 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -19,14 +19,8 @@ define LIBMAD_INSTALL_STAGING_PC
 		$(STAGING_DIR)/usr/lib/pkgconfig/mad.pc
 endef
 
-define LIBMAD_INSTALL_TARGET_PC
-	$(INSTALL) -D package/libmad/mad.pc \
-		$(TARGET_DIR)/usr/lib/pkgconfig/mad.pc
-endef
-
 LIBMAD_POST_PATCH_HOOKS += LIBMAD_PREVENT_AUTOMAKE
 LIBMAD_POST_INSTALL_STAGING_HOOKS += LIBMAD_INSTALL_STAGING_PC
-LIBMAD_POST_INSTALL_TARGET_HOOKS += LIBMAD_INSTALL_TARGET_PC
 
 LIBMAD_CONF_OPT = \
 		--disable-debugging \
-- 
1.8.0
