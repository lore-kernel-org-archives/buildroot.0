From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Nov 2013 14:39:00 -0300
Subject: [Buildroot] [PATCH] wpa_supplicant: define BINDIR for systemd/dbus
	service files
Message-ID: <1385660340-2885-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BINDIR is used to point systemd/dbus service files to the correct binary
path where wpa_supplicant resides.
So define it to avoid the default /usr/local path that doesn't work.
Solves bug #6704

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 450e10f..4ae41c1 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -137,7 +137,7 @@ endef
 
 define WPA_SUPPLICANT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) CFLAGS="$(WPA_SUPPLICANT_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" BINDIR=/usr/sbin \
 		$(MAKE) CC="$(TARGET_CC)" -C $(@D)/$(WPA_SUPPLICANT_SUBDIR)
 endef
 
-- 
1.8.3.2
