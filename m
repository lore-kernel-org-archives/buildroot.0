From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 28 Nov 2013 15:57:16 +0000
Subject: [Buildroot] [PATCH 1/2] qt5script: Disable on non-supported
	platforms
In-Reply-To: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1385654237-36389-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is the same problem as Qt4 QtScript, it doesn't build because it uses
JavaScriptCore, so we re-use the existing
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT option which already lists which
platforms are supported by JavaScriptCore.

This is a quick fix. A proposed fix to add support for MIPS64 has
already been sent to Qt:

   https://bugreports.qt-project.org/browse/QTBUG-35191

Fixes:

   http://autobuild.buildroot.net/results/231/231c112a3fc18e6cd7d6d10873e22144525c7280/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qt5/qt5script/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index 3c5d60c..8f03e75 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT5SCRIPT
 	bool "qt5script"
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	select BR2_PACKAGE_QT5BASE
 	help
 	  Qt is a cross-platform application and UI framework for
-- 
1.7.1
