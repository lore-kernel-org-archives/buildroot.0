From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 22:47:36 +0100
Subject: [Buildroot] [git commit] qt: Disable QtScript on non-supported
	platforms
Message-ID: <20131128214913.88D699BE37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d57723541b339ad54c15fc1ec7e555e49ce3cbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no support for certain platforms in QtScript right now, so
buildroot upstream suggested to disable the possibility of enabling
QtScript on those platforms as a quick fix for the 2013.11 release:

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
