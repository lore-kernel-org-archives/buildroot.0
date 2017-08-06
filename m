From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  6 Aug 2017 12:56:08 +0200
Subject: [Buildroot] [PATCH] ficl: fix build with gcc 7
Message-ID: <20170806105608.24535-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

same issue seen with squashfs, gcc7 with -Os remove the code of inline functions.

see http://autobuild.buildroot.org/results/d72/d72a7e9775a10bc884b9953dd2eba3ad32100cca

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ficl/ficl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index 5d2d600a8..af900fa2c 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -39,7 +39,7 @@ endif
 
 define FICL_BUILD_CMDS
 	$(MAKE) -C $(@D) -f Makefile.linux $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -fPIC -I. -Dlinux" CPPFLAGS="" $(FICL_BUILD_TARGETS)
+		CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline -fPIC -I. -Dlinux" CPPFLAGS="" $(FICL_BUILD_TARGETS)
 endef
 
 define FICL_INSTALL_STAGING_CMDS
-- 
2.11.0
