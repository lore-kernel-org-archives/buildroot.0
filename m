From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] qt: use depends on for gstreamer
Message-ID: <20100526122001.D05A51EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4059a814bb133d4dc306a366cdeba186cb7b8b89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gstreamer has complicated dependencies (because of glib2), so use
depends on rather than select. At the same time default phonon support
to Y if gstreamer is available, as this support is likely wanted.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 4371fc3..4bc4eaa 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -263,13 +263,17 @@ endif
 
 config BR2_PACKAGE_QT_PHONON
 	bool "Phonon Module"
-	select BR2_PACKAGE_GSTREAMER
+	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
+	default y
 	help
 	  Build the Phonon module. Support for different audio/video
 	  formats can be configured at the GStreamer package.
 	  If unsure, say n.
 
+comment "Phonon module needs gstreamer"
+	depends on !BR2_PACKAGE_GSTREAMER
+
 config BR2_PACKAGE_QT_PHONON_BACKEND
 	bool "Phonon Module Backend"
 	depends on BR2_PACKAGE_QT_PHONON
-- 
1.6.3.3
