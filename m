From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 17 Nov 2014 14:19:10 -0300
Subject: [Buildroot] [PATCH v3 5/5] package: linux-fusion: use install
	instead of cp
In-Reply-To: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1416244750-24256-6-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in order to not depend on the previous permissions of the file

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 package/linux-fusion/linux-fusion.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index c5e7976..001388c 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -36,8 +36,8 @@ define LINUX_FUSION_INSTALL_TARGET_CMDS
 		$(LINUX_FUSION_MAKE_OPTS) \
 		INSTALL_MOD_PATH=$(TARGET_DIR) \
 		-C $(@D) install
-	mkdir -p $(LINUX_FUSION_ETC_DIR)
-	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
+	$(INSTALL) -D -m 644 package/linux-fusion/40-fusion.rules \
+		$(LINUX_FUSION_ETC_DIR)/40-fusion.rules
 endef
 
 $(eval $(generic-package))
-- 
2.1.3
