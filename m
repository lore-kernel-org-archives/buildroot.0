From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Tue, 24 Feb 2015 00:39:23 +0100
Subject: [Buildroot] [PATCH 2/2] minidlna: install the config file on the
	target
In-Reply-To: <1424734763-23491-1-git-send-email-aurelien@chabot.fr>
References: <1424734763-23491-1-git-send-email-aurelien@chabot.fr>
Message-ID: <1424734763-23491-2-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/minidlna/minidlna.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 1ff76e3..7adb832 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -24,6 +24,12 @@ MINIDLNA_CONF_OPTS = \
 	--disable-static
 endif
 
+define MINIDLNA_INSTALL_CONF
+	$(INSTALL) -D -m 644 $(@D)/minidlna.conf $(TARGET_DIR)/etc/minidlna.conf
+endef
+
+MINIDLNA_POST_INSTALL_TARGET_HOOKS += MINIDLNA_INSTALL_CONF
+
 define MINIDLNA_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/minidlna/S60minidlnad \
 		$(TARGET_DIR)/etc/init.d/S60minidlnad
-- 
2.3.0
