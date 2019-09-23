From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Sep 2019 21:15:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.71.0
Message-ID: <20190923191514.10484-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Change BOOST_SITE to
  https://dl.bintray.com/boostorg/release/1.71.0/source to get latest
  boost version
- Update path of bjam

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.hash | 4 ++--
 package/boost/boost.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index c6cc3c2639..b3a6f7ec39 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From http://www.boost.org/users/history/version_1_70_0.html
-sha256 430ae8354789de4fd19ee52f3b1f739e1fba576f0aded0897c3c2bc00fb38778  boost_1_70_0.tar.bz2
+# From http://www.boost.org/users/history/version_1_71_0.html
+sha256 d73a8da01e8bf8c7eda40b4c84915071a8c8a0df4a6734537ddde4a8580524ee  boost_1_71_0.tar.bz2
 
 # Locally computed
 sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index a2d8395fd4..3bc5a451ab 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.70.0
+BOOST_VERSION = 1.71.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
-BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
+BOOST_SITE = https://dl.bintray.com/boostorg/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
@@ -133,7 +133,7 @@ define BOOST_CONFIGURE_CMDS
 endef
 
 define BOOST_BUILD_CMDS
-	(cd $(@D) && $(TARGET_MAKE_ENV) ./bjam -j$(PARALLEL_JOBS) -q \
+	(cd $(@D) && $(TARGET_MAKE_ENV) ./tools/build/src/engine/bjam -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--ignore-site-config \
@@ -150,7 +150,7 @@ define BOOST_INSTALL_TARGET_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && $(TARGET_MAKE_ENV) ./bjam -j$(PARALLEL_JOBS) -q \
+	(cd $(@D) && $(TARGET_MAKE_ENV) ./tools/build/src/engine/bjam -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
-- 
2.23.0
