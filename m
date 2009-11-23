From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 16:31:35 +0100
Subject: [Buildroot] [git commit master] sysklogd: needs largefile support
Message-ID: <20091123153334.3796B777E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9627e21153693f296f41c0339e14d6ed18445d7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It tries to call lseek64():

ksym_mod.o: In function `InitMsyms':
ksym_mod.c:(.text+0x438): undefined reference to `lseek64'

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    4 ++--
 package/sysklogd/Config.in |    4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 264c398..7580e52 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,8 +30,8 @@
 	ng-spice-rework, ntfs-3g, openntp, openssl, pcmanfm, php, psmisc,
 	python, quagga, radvd, rpm, rsync, rubix, samba, sawman, sdl,
 	shared-mime-info, sfdisk, spawn-fcgi, speech-tools, sqlite, squashfs,
-	synergy, syslinux, target-binutils, tcpdump, torsmo, u-boot, udpcast,
-	util-linux, valgrind, vsftpd, wipe, wpa-supplicant, x11vnc,
+	synergy, syslinux, sysklogd, target-binutils, tcpdump, torsmo, u-boot,
+	udpcast, util-linux, valgrind, vsftpd, wipe, wpa-supplicant, x11vnc,
 	xdata_xcursor-themes, xboard, xfsprogs, xstroke, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 573f1e0..e3cf2ba 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_SYSKLOGD
 	bool "syslogd & klogd"
+	depends on BR2_LARGEFILE
 	help
 	  System log daemons syslogd and klogd.
 
 	  http://www.infodrom.org/products/sysklogd/
+
+comment "syslogd requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.6.3.3
