From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Oct 2014 07:49:11 -0300
Subject: [Buildroot] [PATCH] boost: ignore site config
Message-ID: <1414493351-10954-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It can lead to build failures if you've got boost installed in the host,
like this:
http://stackoverflow.com/questions/23013433/how-to-install-modular-boost

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/boost/boost.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 46a98e8..275ee00 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -125,6 +125,7 @@ define BOOST_INSTALL_TARGET_CMDS
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(TARGET_DIR)/usr \
+	--ignore-site-config \
 	--layout=$(BOOST_LAYOUT) install )
 endef
 
@@ -132,6 +133,7 @@ define HOST_BOOST_BUILD_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
+	--ignore-site-config \
 	--prefix=$(HOST_DIR)/usr )
 endef
 
@@ -140,6 +142,7 @@ define HOST_BOOST_INSTALL_CMDS
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
 	--prefix=$(HOST_DIR)/usr \
+	--ignore-site-config \
 	--layout=$(BOOST_LAYOUT) install )
 endef
 
@@ -148,6 +151,7 @@ define BOOST_INSTALL_STAGING_CMDS
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
+	--ignore-site-config \
 	--layout=$(BOOST_LAYOUT) install)
 endef
 
-- 
2.0.4
