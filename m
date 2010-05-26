From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] lsof: needs RPC support in toolchain
Message-ID: <20100526122003.01FCE1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d355281d15f2a50768845afc1f0ab5d9ac148c1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/lsof/Config.in |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8684ca4..f26d8b1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	cdrkit, dbus-glib, dbus-python, docker, enchant, fltk, gamin,
 	gettext, gmpc, gob2, grep, gstreamer, gvfs, hal, iconv, icu,
 	libcgicc, libglade, libglib2, libgtk2, libidn, libmms, libmpd,
-	libpcap, libsoup, lmbench, ltrace, lvm2, make,
+	libpcap, libsoup, lmbench, lsof, ltrace, lvm2, make,
 	metacity, mtd-utils, mutt, nbd, netsnmp, ntp, pango, pciutils,
 	pcmanfm, php, pkg-config, psmisc, qt, samba, shared-mime-info,
 	sshfs, startup-notification, swfdec, sylpheed, uemacs,
diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index cc7512c..22b7f5e 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LSOF
 	bool "lsof"
+	depends on BR2_INET_RPC
 	help
 	  lsof (LiSt Open Files)
 	  The lsof tool lists information about files opened by
 	  processes.
 
 	  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+
+comment "lsof requires a toolchain with RPC support"
+	depends on !BR2_INET_RPC
-- 
1.6.3.3
