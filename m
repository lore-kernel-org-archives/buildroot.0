From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] package: don't select libgtk2 as it
	doesn't know what backend to use
Message-ID: <20100526122001.093661EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9bf3f6d9133062e5e1d6f1c8d99bd3e395adc272
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgtk2 can either use the X11 or directfb backend, depending on what
is selected - But if other packages 'select' libgtk2 there is no
guarantee that any backends are enabled, breaking the build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    6 +++---
 package/metacity/Config.in |    2 +-
 package/pcmanfm/Config.in  |    2 +-
 package/sylpheed/Config.in |    2 +-
 package/webkit/Config.in   |    2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4d00463..880c703 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,9 +5,9 @@
 	Updated/fixed packages: aumix, avahi, busybox, cairo, cdrkit,
 	fltk, gettext, gmpc, grep, hal, iconv, icu, libcgicc, libglib2,
 	libidn, libmpd, libpcap, libsoup, lmbench, ltrace, lvm2, make,
-	mtd-utils, mutt, netsnmp, ntp, pango, pciutils, php, psmisc,
-	qt, samba, sshfs, startup-notification, uemacs, util-linux,
-	vpnc
+	metacity, mtd-utils, mutt, netsnmp, ntp, pango, pciutils,
+	pcmanfm, php, psmisc, qt, samba, sshfs, startup-notification,
+	sylpheed, uemacs, util-linux, vpnc, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/metacity/Config.in b/package/metacity/Config.in
index 12c54d1..c483c44 100644
--- a/package/metacity/Config.in
+++ b/package/metacity/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_METACITY
 	bool "metacity"
-	select BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_XORG7
 	help
 	  Metacity is a window manager for the X Window System.
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 9a00bc0..e87e517 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
-	select BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2
 	help
 	  An extremly fast and lightweight file manager which features
 	  tabbed browsing and user-friendly interface.
diff --git a/package/sylpheed/Config.in b/package/sylpheed/Config.in
index fe5aee6..16f03be 100644
--- a/package/sylpheed/Config.in
+++ b/package/sylpheed/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SYLPHEED
 	bool "sylpheed"
-	select BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2
 	help
 	  lightweight and user-friendly e-mail client.
 
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 10c8b38..eee6bcb 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_WEBKIT
 	bool "webkit"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_CURL
 	select BR2_PACKAGE_LIBXML2
-- 
1.6.3.3
