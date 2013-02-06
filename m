From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Feb 2013 10:36:57 -0300
Subject: [Buildroot] [PATCH 2/2] mdadm: use BR2_KERNEL_MIRROR for SITE
In-Reply-To: <1360157817-18509-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360157817-18509-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1360157817-18509-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mdadm/mdadm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 7e93449..dd2b49f 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -6,7 +6,7 @@
 
 MDADM_VERSION = 2.6.9
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.bz2
-MDADM_SITE = http://www.kernel.org/pub/linux/utils/raid/mdadm
+MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 
 MDADM_MAKE_OPT = \
 	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MDADM_DIR) mdadm
-- 
1.7.12.4
