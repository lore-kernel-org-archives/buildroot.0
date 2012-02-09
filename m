From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 21:20:12 +0100
Subject: [Buildroot] [git commit] qt: needs host-pkg-config
Message-ID: <20120209202051.AE49490A4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e39b8a6ff5ba330688bc1a60d1e509d716b6900
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4760

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    1 +
 package/qt/qt.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index a18ebc6..30ac42b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -65,6 +65,7 @@
 	#3691: New EFL packages
 	#4664: Cannot patch AT91Bootstrap
 	#4700: setlocalversion not working for combination svn/ubuntu 11.10...
+	#4760: Qt: add host-pkg-config to dependency-list
 
 2011.11, Released November 30th, 2011:
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 28a477a..34f05f9 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -15,7 +15,7 @@
 QT_VERSION = 4.7.4
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://get.qt.nokia.com/qt/source
-
+QT_DEPENDENCIES = host-pkg-config
 QT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
