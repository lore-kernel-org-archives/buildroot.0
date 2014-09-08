From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Sep 2014 13:17:15 +0100
Subject: [Buildroot] [PATCH] qt4 webkit: Disable for MIPS64 n32
Message-ID: <1410178635-53697-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt4 webkit fails to compile for MIPS64 n32. A bug has been reported
upstream, so we disable this package until upstream fixes the problem.

Upstream bug:
  https://bugreports.qt-project.org/browse/QTBUG-39224

Fixes:
  http://autobuild.buildroot.net/results/2ab/2ab5ab179dab9e1a47092b066f97d48c75ab935b/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/qt/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index da159b4..8c0fe54 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -371,6 +371,9 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
+	# qt-4.8.6 webkit: fails to compile on MIPS64 n32 platforms
+	# https://bugreports.qt-project.org/browse/QTBUG-39224
+	depends on !BR2_MIPS_NABI32
 	depends on BR2_PACKAGE_QT_SHARED
 	depends on BR2_PACKAGE_QT_GUI_MODULE
 	depends on BR2_PACKAGE_QT_NETWORK
-- 
1.7.1
