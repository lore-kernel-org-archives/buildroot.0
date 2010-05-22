From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 May 2010 21:06:34 +0200
Subject: [Buildroot] [git commit master] cdrkit: needs largefile support in
	toolchain
Message-ID: <20100522193710.CC28499FB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f58b8cdef45b7e19c77af3fd801674f201688449
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the same time fix indentation in Config.in

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |   10 +++++-----
 package/cdrkit/Config.in |   22 +++++++++++++---------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 75da2fd..6d2fbf0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,11 +2,11 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: aumix, avahi, busybox, cairo, fltk, gettext,
-	gmpc, grep, hal, iconv, libcgicc, libglib2, libidn, libmpd,
-	libpcap, libsoup, lmbench, ltrace, lvm2, make, mtd-utils,
-	mutt, netsnmp, ntp, pango, php, psmisc, qt, samba, sshfs,
-	startup-notification, uemacs, util-linux, vpnc
+	Updated/fixed packages: aumix, avahi, busybox, cairo, cdrkit,
+	fltk, gettext, gmpc, grep, hal, iconv, libcgicc, libglib2,
+	libidn, libmpd, libpcap, libsoup, lmbench, ltrace, lvm2, make,
+	mtd-utils, mutt, netsnmp, ntp, pango, php, psmisc, qt, samba,
+	sshfs, startup-notification, uemacs, util-linux, vpnc
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 2e25581..7ff50f3 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_CDRKIT
-       # Needed for libbz
-       select BR2_PACKAGE_BZIP2
-       select BR2_PACKAGE_LIBCAP
-       bool "cdrkit"
-       help
-         cdrkit is a suite of programs for recording CDs and DVDs,
-         blanking CD-RW media, creating ISO-9660 filesystem images,
-         extracting audio CD data, and more.
+	# Needed for libbz
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_LIBCAP
+	depends on BR2_LARGEFILE
+	bool "cdrkit"
+	help
+	  cdrkit is a suite of programs for recording CDs and DVDs,
+	  blanking CD-RW media, creating ISO-9660 filesystem images,
+	  extracting audio CD data, and more.
 
-	 http://www.cdrkit.org/
+	  http://www.cdrkit.org/
+
+comment "cdrkit requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.6.3.3
