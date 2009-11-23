From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 15:29:43 +0100
Subject: [Buildroot] [git commit master] xfsprogs: needs e2fsprogs and (in
	turn) largefile support
Message-ID: <20091123143318.6DAFF777D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=08703917d79ddcff3763170b95cbf3ad52540583
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/xfsprogs/Config.in |    5 +++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index ab178b5..41df742 100644
--- a/CHANGES
+++ b/CHANGES
@@ -32,7 +32,7 @@
 	shared-mime-info, sfdisk, spawn-fcgi, speech-tools, sqlite, squashfs,
 	synergy, syslinux, target-binutils, tcpdump, torsmo, u-boot, udpcast,
 	util-linux, valgrind, vsftpd, wipe, wpa-supplicant, x11vnc,
-	xdata_xcursor-themes, xboard, xstroke, zlib
+	xdata_xcursor-themes, xboard, xfsprogs, xstroke, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 6a5c9a1..2f462cb 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -4,8 +4,13 @@ comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED enabled
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_E2FSPROGS
 	help
 	  The XFS file system utilities and libraries
 
 	  http://oss.sgi.com/projects/xfs/
 
+comment "xfssprogs requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
-- 
1.6.3.3
