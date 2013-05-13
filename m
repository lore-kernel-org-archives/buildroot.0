From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 08:01:07 -0300
Subject: [Buildroot] [PATCH] quota: fix dependencies
Message-ID: <1368442867-11405-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quota/quota.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index c89ed9b..9afc9e3 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -14,7 +14,7 @@ QUOTA_CFLAGS = $(TARGET_CFLAGS)
 QUOTA_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-QUOTA_DEPENDENCIES = gettext
+QUOTA_DEPENDENCIES += gettext
 QUOTA_LDFLAGS += -lintl
 endif
 
-- 
1.8.1.5
