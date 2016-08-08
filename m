From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 8 Aug 2016 22:41:50 +0530
Subject: [Buildroot] [PATCH 1/2] lftp: remove unrequired config options
Message-ID: <1470676311-12729-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When installation prefix is specified in "--with-readline" config
option, lftp's build systems figures out include dir and linker flags.
So don't specify --with-readline-{inc,libs} options which are anyways
get ignored by build system.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/lftp/lftp.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index eab7731..b46b802 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -16,8 +16,6 @@ LFTP_DEPENDENCIES = readline zlib host-pkgconf
 # Help lftp finding readline and zlib
 LFTP_CONF_OPTS = \
 	--with-readline=$(STAGING_DIR)/usr \
-	--with-readline-inc=$(STAGING_DIR)/usr/include/readline \
-	--with-readline-lib=$(STAGING_DIR)/usr/lib \
 	--with-zlib=$(STAGING_DIR)/usr
 
 ifneq ($(BR2_STATIC_LIBS),y)
-- 
2.6.2
