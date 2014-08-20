From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Aug 2014 15:06:43 +0200
Subject: [Buildroot] [PATCH 10/12] gcc: enable poison system directories
	option
In-Reply-To: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408540005-26934-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit enables the poison system directories option, which is now
available thanks to the gcc patches that have been added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 44b9561..b697e61 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -52,6 +52,7 @@ HOST_GCC_FINAL_CONF_OPT = \
 	$(HOST_GCC_COMMON_CONF_OPT) \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
 	$(DISABLE_LARGEFILE) \
+	--enable-poison-system-directories \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
 # Disable shared libs like libstdc++ if we do static since it confuses linking
-- 
2.0.0
