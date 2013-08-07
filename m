From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  7 Aug 2013 13:39:55 +0200
Subject: [Buildroot] [PATCH] gcc: fix !BR2_LARGEFILE builds
Message-ID: <1375875595-3155-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://lists.busybox.net/pipermail/buildroot/2013-August/076278.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gcc/gcc-final/gcc-final.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 0d9d581..9f54c68 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -41,6 +41,7 @@ GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGE
 HOST_GCC_FINAL_CONF_OPT = \
 	$(HOST_GCC_COMMON_CONF_OPT) \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
+	$(DISABLE_LARGEFILE) \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
-- 
1.7.9.5
