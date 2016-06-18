From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 18 Jun 2016 17:43:26 +0100
Subject: [Buildroot] [PATCH] elfutils: do not override ELFUTILS_CFLAGS
	variable
Message-ID: <1466268206-62239-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/elfutils/elfutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index a2012d6..88837fb 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -18,11 +18,11 @@ ELFUTILS_CONF_OPTS += --disable-werror
 
 # sparc64 needs -fPIC instead of -fpic
 ifeq ($(BR2_sparc64),y)
-ELFUTILS_CFLAGS += -fPIC
+ELFUTILS_CFLAGS = -fPIC
 endif
 
 # elfutils gets confused when lfs mode is forced, so don't
-ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
+ELFUTILS_CFLAGS += $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
 ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
 
 ELFUTILS_CONF_ENV += \
-- 
2.7.3
