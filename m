From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:20 +0100
Subject: [Buildroot] [RFC v3 15/30] mjpg-streamer: add support for the
	per-package staging directory
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-16-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -I$(STAGING_DIR)/usr/include to the CFLAGS environment variable and
$(TARGET_LDFLAGS) to the LFAGS environment variable of the make command.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/mjpg-streamer/mjpg-streamer.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 2385429..7f3c355 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -15,7 +15,8 @@ MJPG_STREAMER_LICENSE_FILES = LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
 
 define MJPG_STREAMER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+	$(TARGET_MAKE_ENV) CFLAGS="-I$(STAGING_DIR)/usr/include" \
+	LFLAGS="$(TARGET_LDFLAGS)" $(MAKE) CC=$(TARGET_CC) -C $(@D)
 endef
 
 define MJPG_STREAMER_INSTALL_TARGET_CMDS
-- 
2.3.1
