From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:16:08 +0100
Subject: [Buildroot] [git commit] package/libhdhomerun: fix header install
	path
Message-ID: <20160201224702.00B6D7F9DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca7c9d459752b799eda13e86ba9241c06b056635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Header files are expected to be installed in usr/include/libhdhomerun/

https://packages.debian.org/sid/i386/libhdhomerun-dev/filelist
https://github.com/tvheadend/tvheadend/blob/master/src/input/mpegts/tvhdhomerun/tvhdhomerun_private.h#L27

This patch will fix a build error with hdhomerun support enabled in
tvheadend.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
