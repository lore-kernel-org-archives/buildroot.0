From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 18:10:19 +0100
Subject: [Buildroot] [git commit] rubix: make the rubix.mk file more readable
Message-ID: <20151201232123.90FE381952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8a834b4170a8769c8e160eebeff72d867386ca5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rubix/rubix.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/rubix/rubix.mk b/package/rubix/rubix.mk
index dd23edf..b808bc0 100644
--- a/package/rubix/rubix.mk
+++ b/package/rubix/rubix.mk
@@ -7,12 +7,15 @@
 RUBIX_VERSION = 1.0.5
 RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
 RUBIX_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Rubix
-RUBIX_INSTALL_TARGET_OPTS = GAMESDIR=$(TARGET_DIR)/usr/games install
 RUBIX_LICENSE = Public Domain
 RUBIX_LICENSE_FILES = LICENCE
+RUBIX_DEPENDENCIES = xlib_libX11
 
-RUBIX_MAKE_OPTS = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
+RUBIX_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	XINC="-I$(STAGING_DIR)/usr/include/X11" \
+	XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
 
-RUBIX_DEPENDENCIES = xlib_libX11
+RUBIX_INSTALL_TARGET_OPTS = GAMESDIR=$(TARGET_DIR)/usr/games install
 
 $(eval $(autotools-package))
