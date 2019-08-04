From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:19:51 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libvips: fix
 build with NLS
Message-ID: <20190804201500.18CD089098@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44b6fda22d2a4ec7e8f39cad7fa6b5c3b5335c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - http://autobuild.buildroot.org/results/cd61be84dc9781ea645f7667c2bd29908484692f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b96acd52aface4a7367ccdded65c4d933b6059eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvips/libvips.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 7622f32fbc..72fcf6003e 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -20,7 +20,8 @@ ifeq ($(BR2_sparc64),y)
 LIBVIPS_CXXFLAGS += -O0
 endif
 
-LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)"
+LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 LIBVIPS_CONF_OPTS = \
 	--disable-introspection \
