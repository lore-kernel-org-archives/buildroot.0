From: Matt Johnson <mj1856@hotmail.com>
Date: Thu, 13 Jan 2011 21:18:33 -0700
Subject: [Buildroot] freetype: fix for multilib toolchain
Message-ID: <BAY145-w16379D55CDD8378B320C74C2F30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


FreeType's makefile needs to have the architecture (example, -march=armv4t) passed in the LDFLAGS in order to work properly with a multilib toolchain, like CodeSourcery.  This is the easiest way I could think of to do it.  Tested and works.
 
Signed-off-by: Matt Johnson <mj1856@hotmail.com>
---
 package/freetype/freetype.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ad4292f..7e59b57 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -8,6 +8,7 @@ FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
+FREETYPE_CONF_ENV = LDFLAGS="-march=$(CC_TARGET_ARCH_) $(TARGET_LDFLAGS)"
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_DEPENDENCIES = host-pkg-config $(if $(BR2_PACKAGE_ZLIB),zlib)
 
-- 
1.7.1 		 	   		  
