From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:16 +0200
Subject: [Buildroot] [git commit] boost: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121835.C350E81F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc513a797bcdce88046cec6c95736a0fe61c7435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
