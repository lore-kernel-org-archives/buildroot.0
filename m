From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 12:18:00 +0000
Subject: [Buildroot] [PATCH 2/2] rubix: make the rubix.mk file more readable
In-Reply-To: <1448453880-62053-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448453880-62053-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1448453880-62053-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.4.10
