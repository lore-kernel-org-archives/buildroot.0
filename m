From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Oct 2019 18:56:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: fix build with python 3.8
Message-ID: <20191020165609.6412-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/81489f92ceb6287a4d6c52b2bb16a80e8c5c430a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 3bc5a451ab..3bd1e8d2c7 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -67,7 +67,7 @@ ifeq ($(BR2_PACKAGE_BOOST_PYTHON),y)
 BOOST_FLAGS += --with-python-root=$(HOST_DIR)
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
-BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
+BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 BOOST_DEPENDENCIES += python3
 else
 BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)
-- 
2.23.0
