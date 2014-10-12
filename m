From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 20:00:27 +0200
Subject: [Buildroot] [PATCH] snowball-hdmiservice: Use github call
Message-ID: <1413136827-31792-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/snowball-hdmiservice/snowball-hdmiservice.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
index f254414..267b5ad 100644
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -5,13 +5,13 @@
 ################################################################################
 
 SNOWBALL_HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
-SNOWBALL_HDMISERVICE_SITE = https://github.com/igloocommunity/hdmiservice
+SNOWBALL_HDMISERVICE_SITE = $(call github,igloocommunity,hdmiservice,$(SNOWBALL_HDMISERVICE_VERSION))
 SNOWBALL_HDMISERVICE_LICENSE = MIT
 SNOWBALL_HDMISERVICE_LICENSE_FILES = debian/copyright
 SNOWBALL_HDMISERVICE_INSTALL_STAGING = YES
 
 define SNOWBALL_HDMISERVICE_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" 	
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
 endef
 
 define SNOWBALL_HDMISERVICE_INSTALL_STAGING_CMDS
-- 
2.1.1
