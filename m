From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 23:05:58 +0200
Subject: [Buildroot] [git commit master] wpa-supplicant: create
	target-install-hook stamp file
Message-ID: <20091003210638.5E14D776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7c1c71f91913827bb8558e1ad9ba96ccad2837f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/wpa_supplicant.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index d553bc7..4195b1c 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -60,6 +60,7 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 	  $(WPA_SUPPLICANT_DIR)/wpa_supplicant/dbus-wpa_supplicant.service \
 	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
 endif
+	touch $@
 
 $(WPA_SUPPLICANT_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
-- 
1.6.3.3
