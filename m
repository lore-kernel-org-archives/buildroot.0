From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] ntfsprogs: needs largefile support
	in toolchain
Message-ID: <20100526122004.13C391EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=84b96ac17a0584944932ae5fc5ebea4c6cce27dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |    4 ++--
 package/ntfsprogs/Config.in |    5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5b78d07..a7cda4d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	hal, iconv, icu, libcgicc, libdvdnav, libdvdread, libglade,
 	libglib2, libgtk2, libidn, libmms, libmpd, libpcap, libsoup,
 	lmbench, lsof, ltrace, lvm2, make, metacity, mtd-utils, mutt,
-	nbd, netsnmp, ntp, pango, pciutils, pcmanfm, php, pkg-config,
-	psmisc, qt, samba, shared-mime-info, sshfs,
+	nbd, netsnmp, ntfsprogs, ntp, pango, pciutils, pcmanfm, php,
+	pkg-config, psmisc, qt, samba, shared-mime-info, sshfs,
 	startup-notification, swfdec, sylpheed, uemacs, util-linux,
 	vpnc, webkit, xstroke
 
diff --git a/package/ntfsprogs/Config.in b/package/ntfsprogs/Config.in
index 38b955e..836a2b6 100644
--- a/package/ntfsprogs/Config.in
+++ b/package/ntfsprogs/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_NTFSPROGS
 	bool "ntfsprogs"
 	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
 	help
 	  wide collection of NTFS utilities
 
 	  http://www.linux-ntfs.org/
 
-comment "ntfsprogs requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "ntfsprogs requires a toolchain with WCHAR and LARGEFILE support"
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE
-- 
1.6.3.3
