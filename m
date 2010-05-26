From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 23:00:18 +0200
Subject: [Buildroot] [git commit master] squashfs,
	squashfs3: needs LARGEFILE support in toolchain
Message-ID: <20100526210240.4613A12E244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec1bd9900a5f6eeb0646b79b310395c740dbf0c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |    6 +++---
 package/squashfs/Config.in  |    4 ++++
 package/squashfs3/Config.in |    4 ++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 099c752..67e20c8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,9 +9,9 @@
 	libglib2, libgtk2, libidn, libmms, libmpd, libpcap, libsoup,
 	lmbench, lsof, ltrace, lvm2, make, metacity, mtd-utils, mutt,
 	nbd, netsnmp, ntfsprogs, ntp, olsr, pango, pciutils, pcmanfm,
-	php, pkg-config, psmisc, qt, samba, shared-mime-info, sshfs,
-	startup-notification, swfdec, sylpheed, uemacs, util-linux,
-	vpnc, webkit, xstroke
+	php, pkg-config, psmisc, qt, samba, shared-mime-info,
+	squashfs, squashfs3, sshfs, startup-notification, swfdec,
+	sylpheed, uemacs, util-linux, vpnc, webkit, xstroke
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 3080cc3..f83100f 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_SQUASHFS
 	bool "squashfs"
+	depends on BR2_LARGEFILE
 	help
 	  Tools to generate SquashFS filesystems.
 
 	  http://squashfs.sourceforge.net/
+
+comment "squashfs requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/squashfs3/Config.in b/package/squashfs3/Config.in
index 2f7033d..3291272 100644
--- a/package/squashfs3/Config.in
+++ b/package/squashfs3/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_SQUASHFS3
 	bool "squashfs3"
 	depends on BR2_DEPRECATED
+	depends on BR2_LARGEFILE
 	help
 	  Tools to generate SquashFS 3.x filesystems.
 
 	  http://squashfs.sourceforge.net/
+
+comment "squashfs3 requires a toolchain with LARGEFILE support"
+	depends on BR2_DEPRECATED && !BR2_LARGEFILE
-- 
1.6.3.3
