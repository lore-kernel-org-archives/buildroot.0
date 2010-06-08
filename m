From: Paul Jones <paul@pauljones.id.au>
Date: Tue, 8 Jun 2010 23:32:40 +0200
Subject: [Buildroot] [git commit master] xkeyboard-config: Depends on
	host-intltool
Message-ID: <20100608220139.03C50909FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d74be05226f63c548b8a6be7687d87e8c76ad4ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1813

Signed-off-by: Paul Jones <paul@pauljones.id.au>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 ++-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 226ffdf..5569267 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,7 @@
 
 	Updated/fixed packages: cdrkit, file, gawk, intltool,
 	iptables, libidn, lmbench, netperf, openssl, php, qt, sqlite,
-	tn5250, usbutils
+	tn5250, usbutils, xkeyboard-config
 
 	Removed packages: modutils
 
@@ -18,6 +18,7 @@
 	#1753: lmbench: convert to generic package infrastructure
 	#1771: Fakeroot and the target/generic/device_table.txt create bad...
 	#1807: LZMA 4.32.7, Required header file(s) are missing
+	#1813: xkeyboard-config fails to build because of intltool problem
 	#1879: Bump iptables to 1.4.8
 	#1885: Add a bunch of lua modules
 	#1897: Bump libusb to 1.0.7
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 9c9c8b5..eb790b8 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,7 @@ XKEYBOARD_CONFIG_AUTORECONF = NO
 XKEYBOARD_CONFIG_INSTALL_STAGING = NO
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
 XKEYBOARD_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool
 
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
-- 
1.6.3.3
