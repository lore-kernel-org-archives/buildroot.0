From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 23:38:17 +0200
Subject: [Buildroot] [git commit] build: use find -perm /mode,
	instead of -perm +mode STRIP_FIND_CMD
Message-ID: <20130727213808.9FA439AD2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88418bd2de3e2161fc5085a68c5e558a95644a07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -perm +mode is deprecated, and sometimes yields suprising results.
It can be confused with permission in symbolic mode, for example '+u+g',
as POSIX spec suggests.

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index f477124..0cd7f55 100644
--- a/Makefile
+++ b/Makefile
@@ -449,7 +449,7 @@ STRIP_FIND_CMD = find $(TARGET_DIR)
 ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
 STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
 endif
-STRIP_FIND_CMD += -type f -perm +111
+STRIP_FIND_CMD += -type f -perm /111
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
 target-finalize:
