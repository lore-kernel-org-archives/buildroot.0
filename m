From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 27 Nov 2013 17:10:06 +0000
Subject: [Buildroot] [PATCH v2 1/2] qt: Disable QtScript on MIPS64
Message-ID: <1385572207-44666-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no support for MIPS64 in QtScript right now, so buildroot
upstream suggested to disable the possibility of enabling QtScript on
MIPS64 as a quick fix for the 2013.11 release:

   http://lists.busybox.net/pipermail/buildroot/2013-November/083157.html

QtScript doesn't build because it uses JavaScriptCore, so we re-use the
existing BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT option which already lists
which platforms are supported by JavaScriptCore in Qt4.

In addition, a proposed fix to add support for MIPS64 has already been
sent to Qt:

   https://bugreports.qt-project.org/browse/QTBUG-35030

Fixes:

   http://autobuild.buildroot.net/results/fd7/fd7e7e53290f235b540ed5f3c784e2584fdb41e0/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qt/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 2651d55..dd2b6d9 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -385,6 +385,7 @@ config BR2_PACKAGE_QT_OPENSSL
 
 config BR2_PACKAGE_QT_SCRIPT
 	bool "Script Module"
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	default y
 	help
 	  Build the Qt Script module.
-- 
1.7.1
