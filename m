From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 27 Feb 2020 12:18:54 +0100
Subject: [Buildroot] [PATCH] package/git: make _BUG_ condition more clear
Message-ID: <20200227111854.16211-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed by Peter combined condition of the 2 gcc bugs is potentially
wrong, but as Thomas pointed in this case it's not harmful. Let's fix it
anyway since it's basically wrong even it doesn't cause harm.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index f32a2f8eb9..dd79c41e4a 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -67,7 +67,7 @@ endif
 
 GIT_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),)
 GIT_CFLAGS += -O0
 endif
 
-- 
2.20.1
