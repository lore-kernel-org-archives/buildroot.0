From: =?UTF-8?q?Oscar=20Hellstr=C3=B6m?= <oscar.hellstrom@vinnter.se>
Date: Mon, 12 May 2014 18:16:09 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: detect readline support in
	wpa_cli
Message-ID: <1399911369-3165-1-git-send-email-oscar.hellstrom@vinnter.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Oscar Hellstr?m <oscar.hellstrom@vinnter.se>
---
 package/wpa_supplicant/wpa_supplicant.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9fcda2e..9321f08 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -105,6 +105,11 @@ define WPA_SUPPLICANT_DEBUG_CONFIG
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+	WPA_SUPPLICANT_DEPENDENCIES += readline
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
+endif
+
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
 	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
-- 
1.9.1
