From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:37 +0200
Subject: [Buildroot] [PATCH 26/30] package/matchbox: wrap long lines
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <2fac27965d9f2b0f1c261655a08ccf72b694716e.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk | 3 ++-
 package/matchbox/matchbox-lib/matchbox-lib.mk           | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 368a883..4d8359b 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -15,7 +15,8 @@ MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expa
 MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
 
 define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
-	$(INSTALL) -D -m 0755 package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/mb-applet-kbd-wrapper.sh
+	$(INSTALL) -D -m 0755 package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh \
+		$(TARGET_DIR)/usr/bin/mb-applet-kbd-wrapper.sh
 endef
 
 MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 3b697bb..d43e2b8 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -15,7 +15,8 @@ MATCHBOX_LIB_CONF_OPTS = --enable-expat --disable-doxygen-docs
 MATCHBOX_LIB_CONF_ENV = LIBS="-lX11"
 
 define MATCHBOX_LIB_POST_INSTALL_FIXES
-	$(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
+	$(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
 endef
 
 MATCHBOX_LIB_POST_INSTALL_STAGING_HOOKS += MATCHBOX_LIB_POST_INSTALL_FIXES
-- 
1.9.1
