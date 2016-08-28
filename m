From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Aug 2016 23:08:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfreeimage: Fix build with gcc6
Message-ID: <20160828210811.21315-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix was proposed on upstream bug tracker:
https://sourceforge.net/p/freeimage/bugs/267/

Fixes
http://autobuild.buildroot.net/results/081/0811531872f69f9febbdc482dfbdd7fb5c35d1c8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libfreeimage/libfreeimage.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index 2849e94..56b02e8 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -18,7 +18,9 @@ define LIBFREEIMAGE_EXTRACT_CMDS
 endef
 
 define LIBFREEIMAGE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++98" \
+		$(MAKE) -C $(@D)
 endef
 
 define LIBFREEIMAGE_INSTALL_STAGING_CMDS
-- 
2.9.3
