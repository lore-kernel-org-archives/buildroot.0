From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Mar 2011 13:34:25 +0200
Subject: [Buildroot] [git commit master 1/1] qt: fix qt3 support target
	install
Message-ID: <20110329113545.9C930819E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=187ca32ae4a1c5661f0ae5a0b25403535748069a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"lib" shouldn't be prefixed, otherwise the make file tries to install
liblibQt3Support.so.*.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 8569f7d..bdc32d9 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -539,7 +539,7 @@ ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
 QT_INSTALL_LIBS    += QtScriptTools
 endif
 ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
-QT_INSTALL_LIBS    += libQt3Support
+QT_INSTALL_LIBS    += Qt3Support
 endif
 
 QT_CONF_FILE=$(HOST_DIR)/usr/bin/qt.conf
-- 
1.7.3.4
