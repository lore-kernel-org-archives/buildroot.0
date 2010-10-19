From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Oct 2010 09:47:25 +0200
Subject: [Buildroot] [git commit master 1/1] wpa_supplicant: unbreak dbus
	support after 0.7.3 bump
Message-ID: <20101019074752.E548B8D281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=daf11d57975abd672e74bd60bf397a8a05d07366
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/wpa_supplicant.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index a47a42b..bfd20ab 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -90,10 +90,10 @@ endif
 
 define WPA_SUPPLICANT_INSTALL_DBUS
 	$(INSTALL) -D \
-	  $(@D)/wpa_supplicant/dbus-wpa_supplicant.conf \
+	  $(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
 	  $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
 	$(INSTALL) -D \
-	  $(@D)/wpa_supplicant/dbus-wpa_supplicant.service \
+	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_SERVICE).service \
 	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
 endef
 
-- 
1.7.1
