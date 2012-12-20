From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 20 Dec 2012 15:16:31 +0100
Subject: [Buildroot] [PATCH] Makefile: fix cross target
Message-ID: <1356012991-32494-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cross target was laking some dependency.
Now it's possible to successfully use the target right
after the configuration.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4b09437..e163227 100644
--- a/Makefile
+++ b/Makefile
@@ -697,7 +697,7 @@ ifeq ($(O),output)
 endif
 	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
 
-cross: $(BASE_TARGETS)
+cross: prepare dirs dependencies $(BASE_TARGETS)
 
 help:
 	@echo 'Cleaning:'
-- 
1.8.0
