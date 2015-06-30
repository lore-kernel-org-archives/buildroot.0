From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 30 Jun 2015 12:55:20 +0200
Subject: [Buildroot] [PATCH] monkey: fix building with debugging symbols
Message-ID: <1435661720-25725-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a typo in the monkey package - should be MONKEY_CONF_OPTS
instead of MONKEY_CONF_OPT.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/monkey/monkey.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 2344f8c..419750e 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -47,7 +47,7 @@ MONKEY_POST_INSTALL_TARGET_HOOKS += MONKEY_REMOVE_DANGLING_SYMLINK
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-MONKEY_CONF_OPT += --debug
+MONKEY_CONF_OPTS += --debug
 endif
 
 define MONKEY_CONFIGURE_CMDS
-- 
2.1.4
