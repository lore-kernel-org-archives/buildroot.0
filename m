From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Jun 2011 13:15:04 +0200
Subject: [Buildroot] [git commit] qt: QtDeclarative needs script support as
	well
Message-ID: <20110621111612.8F543873F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a78829e0a0d781a95a040435e22ec0d155c59ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise configure errors out with:

Error: QtDeclarative was requested, but it can't be built due to
QtScript or QtGui being disabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 214f140..ab231d9 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -380,6 +380,7 @@ config BR2_PACKAGE_QT_SCRIPTTOOLS
 
 config BR2_PACKAGE_QT_DECLARATIVE
 	bool "Declarative module"
+	depends on BR2_PACKAGE_QT_SCRIPT
 	depends on BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  Build the Qt Declarative Module for qml support
-- 
1.7.3.4
