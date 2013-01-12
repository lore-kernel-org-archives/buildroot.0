From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:50:53 +0100
Subject: [Buildroot] [git commit] torsmo: fix X.org dependency
Message-ID: <20130112215438.EC5BC996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d4a588cac1927bb2cfd6a638a0573e77562f274
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/torsmo/Config.in |    2 ++
 package/torsmo/torsmo.mk |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/torsmo/Config.in b/package/torsmo/Config.in
index b3aba39..7d309da 100644
--- a/package/torsmo/Config.in
+++ b/package/torsmo/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_TORSMO
 	bool "torsmo"
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
 	  Torsmo is a system monitor that sits in the corner of your desktop.
 
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index c42ce11..eedb6f7 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -11,7 +11,7 @@ TORSMO_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Torsmo
 TORSMO_CONF_ENV = ac_cv_path_HELP2MAN=''
 TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries="-I$(STAGING_DIR)/usr/lib" --with-x
 
-TORSMO_DEPENDENCIES = xserver_xorg-server
+TORSMO_DEPENDENCIES = xlib_libX11 xlib_libXext
 
 $(eval $(autotools-package))
 
