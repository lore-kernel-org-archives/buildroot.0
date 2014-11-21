From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 21 Nov 2014 13:19:04 -0300
Subject: [Buildroot] [PATCH v4 5/9] package: matchbox-keyboard: use install
	instead of cp
In-Reply-To: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1416586748-12936-6-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in order to not depend on the previous permissions of the file

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index ebf23e4..bdcc32f 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -15,7 +15,7 @@ MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expa
 MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
 
 define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
-	cp -dpf ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -D -m 0755 package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/mb-applet-kbd-wrapper.sh
 endef
 
 MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
-- 
2.1.3
