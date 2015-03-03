From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:09 +0100
Subject: [Buildroot] [RFC v3 04/30] opentyrian: use TARGET_LDFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/opentyrian/opentyrian.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index f00a52b..5a4f278 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -24,7 +24,7 @@ define OPENTYRIAN_BUILD_CMDS
 		CC="$(TARGET_CC)" \
 		STRIP="/bin/true" \
 		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
-		LDFLAGS="-lm" \
+		LDFLAGS="-lm $(TARGET_LDFLAGS)" \
 		WITH_NETWORK="$(OPENTYRIAN_NETWORK)" \
 		-C $(@D) release
 endef
-- 
2.3.1
