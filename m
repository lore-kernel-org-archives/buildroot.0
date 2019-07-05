From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Jul 2019 22:50:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: fix build with NLS
Message-ID: <20190705205048.18441-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/cd61be84dc9781ea645f7667c2bd29908484692f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
