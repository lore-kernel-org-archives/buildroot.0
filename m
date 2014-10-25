From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 02:04:30 +0200
Subject: [Buildroot] [git commit] snowball-hdmiservice: Use github call
Message-ID: <20141025001137.09A1CB0D0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b05963181a2402e446e4a917fc4e7ad655ba6978
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also drop trailing spaces.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../snowball-hdmiservice/snowball-hdmiservice.mk   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
