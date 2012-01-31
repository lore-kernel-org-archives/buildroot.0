From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 12:23:42 +0100
Subject: [Buildroot] [git commit] qt: qt-dbus: replace dependency on dbus by
	select
Message-ID: <20120131112714.51FA090967@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d018125508c1d13f69b71702384c00c7095986a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index ab231d9..3a552d0 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -280,12 +280,9 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 	  If unsure, say n.
 endif
 
-comment "Qt Dbus module not available (needs dbus)"
-	depends on !BR2_PACKAGE_DBUS
-
 config BR2_PACKAGE_QT_DBUS
 	bool "DBus Module"
-	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS
 	help
 	  Build the Qt DBus module.
 
