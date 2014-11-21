From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 21 Nov 2014 13:19:02 -0300
Subject: [Buildroot] [PATCH v4 3/9] toolchain/helpers.mk: use --chmod on
	rsync
In-Reply-To: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1416586748-12936-4-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This makes sure we don't have any weird permissions on the staging dir,
which could affect the target.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..46f5f22 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -139,7 +139,7 @@ copy_toolchain_sysroot = \
 	SUPPORT_LIB_DIR="$(strip $5)" ; \
 	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
-			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' \
+			rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
 				--exclude lib --exclude lib32 --exclude lib64 \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
-- 
2.1.3
