From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:36 +0100
Subject: [Buildroot] [PATCH 24/28] torsmo: fix X.org dependency
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <05ba03d94cd3c371c77dc41c18395c0d95793006.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/torsmo/Config.in |    2 ++
 package/torsmo/torsmo.mk |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

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
 
-- 
1.7.9.5
