From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 11:09:46 +0200
Subject: [Buildroot] [git commit] boost: change uses of BR2_JLEVEL to
	PARALLEL_JOBS
Message-ID: <20120624095658.17E0688F3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7206f219d46c9007e9e14dffd60d4904b108671d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
