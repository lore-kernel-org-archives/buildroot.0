From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Jun 2010 21:45:51 +0200
Subject: [Buildroot] [git commit master 1/1] libart: fix staging install
Message-ID: <20100616202337.02D1A80DC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b767b8d1abe8969597fcadbfdae3f2906d192187
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libart package had a couple of typos so it never really installed to
staging. So fix it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    4 ++--
 package/libart/libart.mk |    3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 77ecf02..fb32f5b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,8 +14,8 @@
 	luasocket, rings, wsapi, xavante
 
 	Updated/fixed packages: busybox, cdrkit, file, gawk,
-	gstreamer, intltool, ipsec-tools, iptables, libidn, lmbench,
-	netperf, openssl, php, qt, sqlite, tn5250, usbutils,
+	gstreamer, intltool, ipsec-tools, iptables, libart, libidn,
+	lmbench, netperf, openssl, php, qt, sqlite, tn5250, usbutils,
 	xkeyboard-config
 
 	Removed packages: modutils
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 47ff59e..e21899d 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -8,7 +8,6 @@ LIBART_VERSION = 2.3.20
 LIBART_SOURCE = libart_lgpl-$(LIBART_VERSION).tar.gz
 LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/
 LIBART_AUTORECONF = YES
-LIBART_STAGING = YES
-LIBART_TARGET = YES
+LIBART_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package,libart))
-- 
1.7.1
