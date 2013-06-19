From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Wed, 19 Jun 2013 17:24:50 +0800
Subject: [Buildroot] [PATCH] build: use find -perm /mode,
	instead of -perm +mode STRIP_FIND_CMD
Message-ID: <1371633890-21646-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -perm +mode is deprecated, and sometimes yields suprising results.
It can be confused with permission in symbolic mode, for example '+u+g',
as POSIX spec suggests.

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c514e4f..d4be0d8 100644
--- a/Makefile
+++ b/Makefile
@@ -444,7 +444,7 @@ STRIP_FIND_CMD = find $(TARGET_DIR)
 ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
 STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
 endif
-STRIP_FIND_CMD += -type f -perm +111
+STRIP_FIND_CMD += -type f -perm /111
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
 target-finalize:
-- 
1.8.2.1
