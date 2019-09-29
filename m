From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 29 Sep 2019 20:16:05 +0200
Subject: [Buildroot] [PATCH] linux: fix indentation
Message-ID: <1569780965-1224-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 $: ./utils/check-package linux/*
 linux/linux.mk:528: expected indent with tabs
 1318 lines processed
 1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index b9e7210..89ac31c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -525,7 +525,7 @@ include $(sort $(wildcard linux/linux-ext-*.mk))
 
 # Import linux-kernel-extensions from br2-externals
 include $(sort $(wildcard $(foreach ext,$(BR2_EXTERNAL_DIRS), \
-       $(ext)/linux/linux-ext-*.mk)))
+	$(ext)/linux/linux-ext-*.mk)))
 
 LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
-- 
2.7.4
