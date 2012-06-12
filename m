From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 11 Jun 2012 21:09:38 -0500
Subject: [Buildroot] [PATCH 2/7] boost: change uses of BR2_JLEVEL to
	PARALLEL_JOBS
In-Reply-To: <1339466983-19786-1-git-send-email-ntl@pobox.com>
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
Message-ID: <1339466983-19786-3-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 package/boost/boost.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 3667964..abdf3a2 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -70,7 +70,7 @@ define BOOST_CONFIGURE_CMDS
 endef
 
 define BOOST_INSTALL_TARGET_CMDS
-	(cd $(@D) && ./b2 -j$(BR2_JLEVEL) -q -d+2 \
+	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+2 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPT) \
 	--prefix=$(TARGET_DIR)/usr \
@@ -78,7 +78,7 @@ define BOOST_INSTALL_TARGET_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -j$(BR2_JLEVEL) -d+2 \
+	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+2 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPT) \
 	--prefix=$(STAGING_DIR)/usr \
-- 
1.7.6.5
