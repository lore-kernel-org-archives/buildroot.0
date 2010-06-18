From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Jun 2010 11:48:58 +0200
Subject: [Buildroot] [git commit master 1/1] ntfsprogs: disable crypto
	support
Message-ID: <20100618114218.02CC7816CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bde127c3bc2c12a36a3698cce7820859cd8d00a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ntfsprogs crypto support requires libgnutls, which we don't have
in BR, and the autodetection in configure gets confused when the host
has a libcrypt-config.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    4 ++--
 package/ntfsprogs/ntfsprogs.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c9cf1e0..25d5233 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,8 +15,8 @@
 
 	Updated/fixed packages: busybox, cdrkit, file, gawk,
 	gstreamer, intltool, ipsec-tools, iptables, libart, libidn,
-	lmbench, lrzsz, netperf, openssl, php, qt, sqlite, squashfs,
-	tn5250, usbutils, xkeyboard-config
+	lmbench, lrzsz, netperf, ntfsprogs, openssl, php, qt, sqlite,
+	squashfs, tn5250, usbutils, xkeyboard-config
 
 	Removed packages: modutils
 
diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
index b34fe7a..654d3cb 100644
--- a/package/ntfsprogs/ntfsprogs.mk
+++ b/package/ntfsprogs/ntfsprogs.mk
@@ -6,7 +6,7 @@
 NTFSPROGS_VERSION:=2.0.0
 NTFSPROGS_SOURCE:=ntfsprogs-$(NTFSPROGS_VERSION).tar.gz
 NTFSPROGS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-ntfs/
-NTFSPROGS_CONF_OPT:=--disable-gnome-vfs --program-prefix=""
+NTFSPROGS_CONF_OPT:=--disable-gnome-vfs --program-prefix="" --disable-crypto
 NTFSPROGS_INSTALL_STAGING:=yes
 
 NTFSPROGS_BIN:=ntfscat ntfscluster ntfscmp ntfsfix ntfsinfo ntfsls
-- 
1.7.1
