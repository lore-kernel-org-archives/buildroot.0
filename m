From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Aug 2014 17:12:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/fbv: Fix linking against libpng
Message-ID: <1407683528-2780-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/9ca/9cacec257f979745a7d4a43224b243ee4e16f9ac/
http://autobuild.buildroot.net/results/996/996e42396546555e9fcf0c7135aac610ccca4eee/
http://autobuild.buildroot.net/results/c91/c918046900045c34c73e16578026cce3e6bcccf8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fbv/fbv.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 6f41d9f..980bb9e 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -15,6 +15,7 @@ FBV_DEPENDENCIES = # empty
 FBV_CONFIGURE_OPTS = # empty
 ifeq ($(BR2_PACKAGE_FBV_PNG),y)
 FBV_DEPENDENCIES += libpng
+FBV_CONFIGURE_OPTS += "--libs=$(shell $(PKG_CONFIG_HOST_BINARY) --libs libpng)"
 else
 FBV_CONFIGURE_OPTS += --without-libpng
 endif
-- 
1.7.10.4
