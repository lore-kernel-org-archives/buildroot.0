From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 10:44:56 +0100
Subject: [Buildroot] [PATCH 2/3] package/libhdhomerun: fix header install
	path
In-Reply-To: <1453542297-12086-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453542297-12086-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453542297-12086-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Header files are expected to be installed in usr/include/libhdhomerun/

https://packages.debian.org/sid/i386/libhdhomerun-dev/filelist
https://github.com/tvheadend/tvheadend/blob/master/src/input/mpegts/tvhdhomerun/tvhdhomerun_private.h#L27

This patch will fix a build error with hdhomerun support enabled in
tvheadend.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libhdhomerun/libhdhomerun.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index e3e5f06..16e34c2 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -19,8 +19,9 @@ endef
 define LIBHDHOMERUN_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libhdhomerun.so \
 		$(STAGING_DIR)/usr/lib/libhdhomerun.so
+	mkdir -p $(STAGING_DIR)/usr/include/libhdhomerun/
 	$(INSTALL) -m 0644 $(@D)/*.h \
-		$(STAGING_DIR)/usr/include/
+		$(STAGING_DIR)/usr/include/libhdhomerun/
 endef
 
 define LIBHDHOMERUN_INSTALL_TARGET_CMDS
-- 
2.7.0.rc3
