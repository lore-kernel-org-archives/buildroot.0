From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Mar 2011 22:13:54 +0100
Subject: [Buildroot] [git commit master 1/1] qt: dbus module doesn't depend
	on gui support
Message-ID: <20110325211424.DD25981951@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=808f98e3ebc0bce5f96052fa0557ff68d33659d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Seems I somehow got this wrong back in December (bff5248202).

At the same time fix a typo in the comment.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3cc04f4..2eb05e4 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -285,8 +285,9 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 	help
 	  Build the platform Phonon plugin.
 	  If unsure, say n.
+endif
 
-comment "Qt DBbus module not available (need dbus)"
+comment "Qt Dbus module not available (needs dbus)"
 	depends on !BR2_PACKAGE_DBUS
 
 config BR2_PACKAGE_QT_DBUS
@@ -294,7 +295,6 @@ config BR2_PACKAGE_QT_DBUS
 	depends on BR2_PACKAGE_DBUS
 	help
 	  Build the Qt DBus module.
-endif
 
 config BR2_PACKAGE_QT_XML
 	bool "XML Module"
-- 
1.7.3.4
