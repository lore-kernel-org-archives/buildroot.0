From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 May 2018 20:51:18 +0300
Subject: [Buildroot] [PATCH] lrzsz: install symlinks for XMODEM and YMODEM
Message-ID: <22856a59ac4af71690638f10f2117cd83c853928.1527184278.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This sets the protocol choice according to the program invocation name.
That is the common lrzsz installation practice.

Cc: Matthew Starr <mstarr@hedonline.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lrzsz/lrzsz.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 5dac07a2953e..25ecf3deade0 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -24,6 +24,10 @@ define LRZSZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
 	ln -sf rz $(TARGET_DIR)/usr/bin/lrz
 	ln -sf sz $(TARGET_DIR)/usr/bin/lsz
+	ln -sf rz $(TARGET_DIR)/usr/bin/rb
+	ln -sf sz $(TARGET_DIR)/usr/bin/sb
+	ln -sf rz $(TARGET_DIR)/usr/bin/rx
+	ln -sf sz $(TARGET_DIR)/usr/bin/sx
 endef
 
 $(eval $(autotools-package))
-- 
2.17.0
