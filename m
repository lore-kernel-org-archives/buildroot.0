From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:30 -0300
Subject: [Buildroot] [PATCH 23/51] opentyrian: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-24-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/opentyrian/opentyrian.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index b74e4cf..6efbe4e 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -20,7 +20,7 @@ OPENTYRIAN_NETWORK = false
 endif
 
 define OPENTYRIAN_BUILD_CMDS
-	$(MAKE) PLATFORM=UNIX \
+	$(TARGET_MAKE_ENV) $(MAKE) PLATFORM=UNIX \
 		CC="$(TARGET_CC)" \
 		STRIP="/bin/true" \
 		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
-- 
2.7.3
