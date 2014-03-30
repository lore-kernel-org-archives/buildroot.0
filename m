From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 21:57:51 +0400
Subject: [Buildroot] [PATCH v3 07/10] Revert "lmbench: fix build for xtensa"
In-Reply-To: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396202274-5109-8-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 7c04932603476f3adf474f3bc47c35bdb59d947a.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2 -> v3:
- new patch

 package/lmbench/lmbench.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 529026f..c3a6c09 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -19,10 +19,6 @@ LMBENCH_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
 LMBENCH_LDFLAGS += -ltirpc
 endif
 
-ifeq ($(BR2_xtensa),y)
-LMBENCH_CFLAGS += -mtext-section-literals
-endif
-
 define LMBENCH_CONFIGURE_CMDS
 	$(call CONFIG_UPDATE,$(@D))
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
-- 
1.8.1.4
