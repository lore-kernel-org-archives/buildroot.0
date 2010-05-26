From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] olsr: needs IPv6 support in
	toolchain
Message-ID: <20100526122004.633871EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2f2a0294573bbb8e32ed14c6ba08bf89916adae8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    4 ++--
 package/olsr/Config.in |    4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a7cda4d..099c752 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	hal, iconv, icu, libcgicc, libdvdnav, libdvdread, libglade,
 	libglib2, libgtk2, libidn, libmms, libmpd, libpcap, libsoup,
 	lmbench, lsof, ltrace, lvm2, make, metacity, mtd-utils, mutt,
-	nbd, netsnmp, ntfsprogs, ntp, pango, pciutils, pcmanfm, php,
-	pkg-config, psmisc, qt, samba, shared-mime-info, sshfs,
+	nbd, netsnmp, ntfsprogs, ntp, olsr, pango, pciutils, pcmanfm,
+	php, pkg-config, psmisc, qt, samba, shared-mime-info, sshfs,
 	startup-notification, swfdec, sylpheed, uemacs, util-linux,
 	vpnc, webkit, xstroke
 
diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index ca45f73..ada82b4 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OLSR
 	bool "OLSR mesh networking Daemon"
+	depends on BR2_INET_IPV6
 	help
 	  The Optimized Link State Routing protocol (OLSR) is a
 	  routing protocol that is optimised for mobile ad-hoc
@@ -9,3 +10,6 @@ config BR2_PACKAGE_OLSR
 	  compute optimal forwarding paths locally.
 
 	  http://www.olsr.org/
+
+comment "olsr requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
-- 
1.6.3.3
