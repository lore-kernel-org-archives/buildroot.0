From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 18:11:49 +0100
Subject: [Buildroot] [git commit] use avr32linux.org mirror
Message-ID: <20121103171645.8F21499A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51f3425e3d6c69758c071b9327eecaa14b5e053a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The avr32linux.org mirror has vanished and is replaced by a spam site
that returns HTML pages for whatever URL you request from it.  So the
download helper thinks that download has succeeded, while actually it
failed.

Fortunately, there is still a mirror of the site alive, so we can use
that one.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gadgetfs-test/gadgetfs-test.mk |    2 +-
 package/games/rubix/Config.in          |    2 +-
 package/games/rubix/rubix.mk           |    2 +-
 package/torsmo/Config.in               |    2 +-
 package/torsmo/torsmo.mk               |    2 +-
 package/xstroke/Config.in              |    2 +-
 package/xstroke/xstroke.mk             |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 808618b..0fc8221 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 GADGETFS_TEST_SOURCE=gadgetfs-test.tar.bz2
-GADGETFS_TEST_SITE=http://avr32linux.org/twiki/pub/Main/GadgetFsTest/
+GADGETFS_TEST_SITE=http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/
 
 GADGETFS_TEST_MAKEOPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
 
diff --git a/package/games/rubix/Config.in b/package/games/rubix/Config.in
index 6da8c71..9cf5b46 100644
--- a/package/games/rubix/Config.in
+++ b/package/games/rubix/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_RUBIX
 	help
 	  A 3D rubiks cube game for X
 
-	  http://avr32linux.org/twiki/pub/Main/Rubix
+	  http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Rubix
diff --git a/package/games/rubix/rubix.mk b/package/games/rubix/rubix.mk
index 2087b51..d39d353 100644
--- a/package/games/rubix/rubix.mk
+++ b/package/games/rubix/rubix.mk
@@ -5,7 +5,7 @@
 #############################################################
 RUBIX_VERSION = 1.0.5
 RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
-RUBIX_SITE = http://avr32linux.org/twiki/pub/Main/Rubix
+RUBIX_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Rubix
 RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
 
 RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
diff --git a/package/torsmo/Config.in b/package/torsmo/Config.in
index ec9cb22..b3aba39 100644
--- a/package/torsmo/Config.in
+++ b/package/torsmo/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_TORSMO
 	help
 	  Torsmo is a system monitor that sits in the corner of your desktop.
 
-	  http://avr32linux.org/twiki/pub/Main/Torsmo
+	  http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Torsmo
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index 1e3bd28..c42ce11 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -5,7 +5,7 @@
 #############################################################
 TORSMO_VERSION = 0.18
 TORSMO_SOURCE = torsmo-$(TORSMO_VERSION).tar.gz
-TORSMO_SITE = http://avr32linux.org/twiki/pub/Main/Torsmo
+TORSMO_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Torsmo
 
 # help2man doesn't work when cross compiling
 TORSMO_CONF_ENV = ac_cv_path_HELP2MAN=''
diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index 5589fe6..54cb38e 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_XSTROKE
 	help
 	  Handwriting recognition for X
 
-	  http://avr32linux.org/twiki/pub/Main/XStroke
+	  http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/XStroke
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index d7d18db..3459545 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -5,7 +5,7 @@
 #############################################################
 XSTROKE_VERSION = 0.6
 XSTROKE_SOURCE = xstroke-$(XSTROKE_VERSION).tar.gz
-XSTROKE_SITE = http://avr32linux.org/twiki/pub/Main/XStroke
+XSTROKE_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/XStroke
 
 XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm
 
