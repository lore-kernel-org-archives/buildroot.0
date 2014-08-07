From: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
Date: Thu, 7 Aug 2014 13:07:23 -0700
Subject: [Buildroot] [PATCH 1/1] linux: fix LINUX_SITE for release candidates
Message-ID: <1407442043-11591-1-git-send-email-jtheou@adeneo-embedded.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e433e0d..2fb7437 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -34,7 +34,7 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 endif
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)
-LINUX_SITE := $(LINUX_SITE)testing/
+LINUX_SITE := $(LINUX_SITE)/testing/
 endif # -rc
 endif
 
-- 
2.0.3
