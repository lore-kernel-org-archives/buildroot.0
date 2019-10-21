From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:43:56 +0200
Subject: [Buildroot] [git commit] package/boost: fix build with python 3.8
Message-ID: <20191021193736.3D2298391B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d17f54af03a2d893359d302df62f79418a575741
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/81489f92ceb6287a4d6c52b2bb16a80e8c5c430a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
