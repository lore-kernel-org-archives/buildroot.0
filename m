From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] swfdec: use depends on for gstreamer
Message-ID: <20100526122001.5999C1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d874b08abc6bdd682b5e66321831337d1b79bdc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gstreamer has complicated dependencies (because of glib2), so use
depends on rather than select, similar to how it is done for gtk2.

At the same time default gtk/gstreamer support to Y if those are
available, as they are likely wanted.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    2 +-
 package/multimedia/swfdec/Config.in |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 880c703..985347a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	libidn, libmpd, libpcap, libsoup, lmbench, ltrace, lvm2, make,
 	metacity, mtd-utils, mutt, netsnmp, ntp, pango, pciutils,
 	pcmanfm, php, psmisc, qt, samba, sshfs, startup-notification,
-	sylpheed, uemacs, util-linux, vpnc, webkit
+	swfdec, sylpheed, uemacs, util-linux, vpnc, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/swfdec/Config.in b/package/multimedia/swfdec/Config.in
index 7a51e2e..0f2dea5 100644
--- a/package/multimedia/swfdec/Config.in
+++ b/package/multimedia/swfdec/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_SWFDEC_GTK_SUPPORT
 	depends on BR2_PACKAGE_SWFDEC
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBSOUP
+	default y
 	help
 	  Swfdec-gtk library is used for easy integration
 	  of swfdec in GTK applications
@@ -22,8 +23,9 @@ config BR2_PACKAGE_SWFDEC_GTK_SUPPORT
 config BR2_PACKAGE_SWFDEC_GSTREAMER
 	bool "gstreamer support"
 	depends on BR2_PACKAGE_SWFDEC
-	select BR2_PACKAGE_GSTREAMER
+	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
+	default y
 	help
 	  Enables GStreamer support
 
-- 
1.6.3.3
