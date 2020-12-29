From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:06:01 +0100
Subject: [Buildroot] [git commit] package/wpa_supplicant: add SELinux module
Message-ID: <20201229134643.928E782830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=289a715a4059ea45075a7ae08f890a4f0ab558c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for wpa_supplicant is added by the services/networkmanager
module in the SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpa_supplicant/wpa_supplicant.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 7170db0d07..38af11625a 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -14,6 +14,7 @@ WPA_SUPPLICANT_DBUS_OLD_SERVICE = fi.epitest.hostap.WPASupplicant
 WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
+WPA_SUPPLICANT_SELINUX_MODULES = networkmanager
 
 # 0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
 WPA_SUPPLICANT_IGNORE_CVES += CVE-2019-16275
