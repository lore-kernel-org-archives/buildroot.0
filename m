From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 21:57:19 +0200
Subject: [Buildroot] [git commit] boost: add an option to run cmds in
	parallel
Message-ID: <20120501195941.7A94096C24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb0efa0ed4055e95fdf9791a71c7267e90099455
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the same -jN parameter as used for make.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
