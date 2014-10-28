From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:54:26 +0100
Subject: [Buildroot] [git commit] boost: ignore site config
Message-ID: <20141028175447.71323B1C96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b65013988f0ee5c9d596a2fd819f0d722183f020
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It can lead to build failures if you've got boost installed in the host,
like this:
http://stackoverflow.com/questions/23013433/how-to-install-modular-boost

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/boost.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
 
