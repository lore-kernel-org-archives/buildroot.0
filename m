From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 18 Apr 2012 10:19:46 +0200
Subject: [Buildroot] [PATCH] boost: add an option to run cmds in parallel
Message-ID: <1334737186-30736-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add the same -jN parameter as used for make.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 9da427a..3667964 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -70,7 +70,7 @@ define BOOST_CONFIGURE_CMDS
 endef
 
 define BOOST_INSTALL_TARGET_CMDS
-	(cd $(@D) && ./b2 -q -d+2 \
+	(cd $(@D) && ./b2 -j$(BR2_JLEVEL) -q -d+2 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPT) \
 	--prefix=$(TARGET_DIR)/usr \
@@ -78,7 +78,7 @@ define BOOST_INSTALL_TARGET_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -d+2 \
+	(cd $(@D) && ./bjam -j$(BR2_JLEVEL) -d+2 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPT) \
 	--prefix=$(STAGING_DIR)/usr \
-- 
1.7.7
