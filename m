From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri,  7 Nov 2014 00:50:37 -0300
Subject: [Buildroot] [PATCH v2 4/5] package: matchbox-keyboard: use install
	instead of cp
In-Reply-To: <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1415332238-31677-5-git-send-email-guido@vanguardiasur.com.ar>
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
index ebf23e4..ab6dd30 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -15,7 +15,7 @@ MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expa
 MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
 
 define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
-	cp -dpf ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
+	install -m 0755 ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
 endef
 
 MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
-- 
2.1.1
