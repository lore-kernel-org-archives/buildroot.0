From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:19 -0300
Subject: [Buildroot] [PATCH 12/51] irda-utils: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-13-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/irda-utils/irda-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 2c35dff..4b17007 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -15,7 +15,7 @@ IRDA_UTILS_CFLAGS += -DNO_FORK=1
 endif
 
 define IRDA_UTILS_BUILD_CMDS
-	$(MAKE) \
+	$(TARGET_MAKE_ENV) $(MAKE) \
 		CC="$(TARGET_CC)" \
 		CFLAGS="$(IRDA_UTILS_CFLAGS)" \
 		SYS_INCLUDES= \
-- 
2.7.3
