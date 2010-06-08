From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 8 Jun 2010 23:32:40 +0200
Subject: [Buildroot] [git commit master] gstreamer: remove
	--disable-registry from configure options
Message-ID: <20100608220139.9E699909FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=726616a8efb6a1c9bcc5566689caefc15cc27679
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-registry has no dependency on libxml2 and should not be
linked to BR2_PACKAGE_GSTREAMER_LIBXML2. If we want to disable
registry then we should add another option.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                   |    2 +-
 package/multimedia/gstreamer/gstreamer.mk |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5569267..0c4b9d6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, file, gawk, intltool,
+	Updated/fixed packages: cdrkit, file, gawk, gstreamer, intltool,
 	iptables, libidn, lmbench, netperf, openssl, php, qt, sqlite,
 	tn5250, usbutils, xkeyboard-config
 
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 0391b14..49ac0df 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -27,7 +27,6 @@ ifeq ($(BR2_PACKAGE_GSTREAMER_LIBXML2),y)
 GSTREAMER_DEPENDENCIES += libxml2
 else
 GSTREAMER_CONF_OPT += \
-	--disable-registry \
 	--disable-loadsave
 endif
 
-- 
1.6.3.3
