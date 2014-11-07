From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri,  7 Nov 2014 00:50:38 -0300
Subject: [Buildroot] [PATCH v2 5/5] package: linux-fusion: use install
	instead of cp
In-Reply-To: <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1415332238-31677-6-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in order to not depend on the previous permissions of the file

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 package/linux-fusion/linux-fusion.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index c5e7976..81ecd8a 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -37,7 +37,7 @@ define LINUX_FUSION_INSTALL_TARGET_CMDS
 		INSTALL_MOD_PATH=$(TARGET_DIR) \
 		-C $(@D) install
 	mkdir -p $(LINUX_FUSION_ETC_DIR)
-	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
+	install -m 644 package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
 endef
 
 $(eval $(generic-package))
-- 
2.1.1
