From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:36 -0300
Subject: [Buildroot] [PATCH 29/51] boost: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-30-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/boost/boost.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 1bed6b2..bb8d799 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -131,7 +131,7 @@ define BOOST_CONFIGURE_CMDS
 endef
 
 define BOOST_BUILD_CMDS
-	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q \
+	(cd $(@D) && $(TARGET_MAKE_ENV) ./bjam -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--ignore-site-config \
@@ -139,7 +139,7 @@ define BOOST_BUILD_CMDS
 endef
 
 define BOOST_INSTALL_TARGET_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
+	(cd $(@D) && $(TARGET_MAKE_ENV) ./b2 -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(TARGET_DIR)/usr \
@@ -148,7 +148,7 @@ define BOOST_INSTALL_TARGET_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q \
+	(cd $(@D) && $(TARGET_MAKE_ENV) ./bjam -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
-- 
2.7.3
