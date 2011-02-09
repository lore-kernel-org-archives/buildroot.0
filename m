From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Feb 2011 23:01:44 +0100
Subject: [Buildroot] [git commit master 1/1] qt: make QT_QMAKE variable
	point to HOST_DIR now
Message-ID: <20110209220225.C02448F47E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e5f6f55e12251faaaca54dbdcaf41296aedd3498
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 3857087..3dfdcbf 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -438,7 +438,7 @@ endif
 QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
 
 # Variable for other Qt applications to use
-QT_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++
+QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
-- 
1.7.3.4
