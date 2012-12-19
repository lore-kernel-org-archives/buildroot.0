From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Dec 2012 14:52:18 +0100
Subject: [Buildroot] [git commit] pcmanfm: replace dependency on X.org
	server by dependency on libX11
Message-ID: <20121219140106.7BAE49A3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=043ba78869b09da6f1bfa0daaa66fc0960163371
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no reason for a client program like pcmanfm to depend on the
X.org server. Instead, it should depend on the appropriate X
client libraries, in this case libX11.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pcmanfm/Config.in  |    1 +
 package/pcmanfm/pcmanfm.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index c8b4deb..484192b 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
+	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_LIBGTK2
 	help
 	  An extremly fast and lightweight file manager which features
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 3b0b727..392e3ad 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -7,7 +7,7 @@ PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%20%28Old%200.5%20series%29/PCManFM%20$(PCMANFM_VERSION)
 PCMANFM_CONF_OPT = --disable-hal
-PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xserver_xorg-server
+PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xlib_libX11
 PCMANFM_AUTORECONF = YES
 
 $(eval $(autotools-package))
