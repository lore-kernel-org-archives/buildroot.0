From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 27 Jan 2010 02:08:49 +0100
Subject: [Buildroot] [PATCH 01/19] zlib: fix headers installation in target
	directory
In-Reply-To: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1264554547-9009-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/zlib/zlib.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 5365b30..7432473 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -43,8 +43,8 @@ endef
 
 ifeq ($(BR2_HAVE_DEVFILES),y)
 define ZLIB_INSTALL_TARGET_HEADERS
-	$(INSTALL) -D $(@D)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
-	$(INSTALL) $(@D)/zconf.h $(STAGING_DIR)/usr/include/
+	$(INSTALL) -D $(@D)/zlib.h $(TARGET_DIR)/usr/include/zlib.h
+	$(INSTALL) $(@D)/zconf.h $(TARGET_DIR)/usr/include/
 endef
 endif
 
-- 
1.6.6
