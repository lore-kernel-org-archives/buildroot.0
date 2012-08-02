From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:06 -0000
Subject: [Buildroot] [git commit branch/next] synergy: fix dependencies
Message-ID: <20120802195238.0D96496EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e12d78e2bc2d0e36dbdf1ced099ae924f7a82ca2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Synergy can be used without a local X server, and Xinerama is an optional
dependency.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/synergy/synergy.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 5a09359..c86fb8b 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -10,6 +10,7 @@ SYNERGY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/s
 SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
                    --x-libraries=$(STAGING_DIR)/usr/lib
 
-SYNERGY_DEPENDENCIES = xserver_xorg-server xlib_libXtst
+SYNERGY_DEPENDENCIES = xlib_libXtst \
+		$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
 
 $(eval $(call AUTOTARGETS))
