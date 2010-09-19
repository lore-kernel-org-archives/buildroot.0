From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 19 Sep 2010 22:34:20 +0200
Subject: [Buildroot] [git commit master 1/1] m4: needs wchar support in
	toolchain
Message-ID: <20100919204348.2AB118B422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c29e01e61e5754c446eb524f65b01195cf25cbcc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    4 ++--
 package/m4/Config.in |    4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a5b035f..e6baf69 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,8 +19,8 @@
 	ifplugd, iptables, jpeg, kexec, kismet, less, libcurl,
 	libdnet, libevent, libglade, libgtk2, libiconv, libidn, libnl,
 	liboil, libpcap, libpng, libungif, libxml2, libxslt, lighttpd,
-	lite, mdadm, metacity, mysql_client, nano, nbd, ncftp, neon,
-	netperf, ntfsprogs, openntpd, openssh, openvpn, oprofile,
+	lite, m4, mdadm, metacity, mysql_client, nano, nbd, ncftp,
+	neon, netperf, ntfsprogs, openntpd, openssh, openvpn, oprofile,
 	pango, pcre, php, prboom, radvd, qt, samba, sdl_sound,
 	shared-mime-info, speex, sqlite, strace, taglib, tcpdump,
 	tiff, tn5250, udpcast, usbutils, which, xlib_libX11
diff --git a/package/m4/Config.in b/package/m4/Config.in
index 9928db7..56b2859 100644
--- a/package/m4/Config.in
+++ b/package/m4/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_M4
 	bool "m4"
+	depends on BR2_USE_WCHAR
 	help
 	  An implementation of the traditional Unix macro processor.
 
 	  http://www.gnu.org/software/m4/m4.html
+
+comment "m4 requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
-- 
1.7.1
