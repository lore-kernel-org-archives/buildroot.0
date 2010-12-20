From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Dec 2010 10:12:39 +0100
Subject: [Buildroot] [git commit master 1/1] qt: phonon support depends on
	gui module
Message-ID: <20101220091733.AC3568A69E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e98318205cd8d79c3bfa492889f68b0f74d738f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise configure errors out with 'Phonon enabled, but GUI disabled'.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index af1db6d..ddee2cc 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -264,7 +264,6 @@ if BR2_PACKAGE_QT_GUI_MODULE
 source "package/qt/Config.gfx.in"
 source "package/qt/Config.mouse.in"
 source "package/qt/Config.keyboard.in"
-endif
 
 config BR2_PACKAGE_QT_PHONON
 	bool "Phonon Module"
@@ -285,6 +284,7 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 	help
 	  Build the platform Phonon plugin.
 	  If unsure, say n.
+endif
 
 comment "Qt DBbus module not available (need dbus)"
 	depends on !BR2_PACKAGE_DBUS
-- 
1.7.2.2
