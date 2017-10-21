From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: supports only the real
	OpenSSL, not LibreSSL
Message-ID: <20171021192125.C4A5D81112@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=346483306d896828fd05cd45b280027e8736b779
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wpa_supplicant will not build with LibreSSL without patches, so let's
support only OpenSSL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index da757aa..75ecbaa 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -97,8 +97,8 @@ WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
 endif
 
 # Try to use openssl if it's already available
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-WPA_SUPPLICANT_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+WPA_SUPPLICANT_DEPENDENCIES += libopenssl
 WPA_SUPPLICANT_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
