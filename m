From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:41:14 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: fix
	BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG option
Message-ID: <20140608154128.3BC129CF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0d089b0eb9f65bfe65ae13125065ca0fa93ccc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 2df4f5e..0ca2ce5 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -105,9 +105,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
-define WPA_SUPPLICANT_DEBUG_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_DEBUG_SYSLOG.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
-endef
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DEBUG_SYSLOG
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
