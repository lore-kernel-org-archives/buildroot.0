From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 23 Dec 2017 22:06:16 +0300
Subject: [Buildroot] [PATCH 3/4] hostapd: make ACS dependent on nl80211
In-Reply-To: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
Message-ID: <20171223190617.3981-4-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ACS is supported for nl80211 driver only.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/hostapd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 509797a44a..57cec469c6 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -39,6 +39,7 @@ comment "at least one driver must be selected"
 config BR2_PACKAGE_HOSTAPD_ACS
 	bool "Enable ACS"
 	default y
+	depends on BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
 	help
 	  Enable support for standard ACS (Automatic Channel Selection).
 	  Some propietary drivers use a custom algorithm which requires
@@ -46,6 +47,9 @@ config BR2_PACKAGE_HOSTAPD_ACS
 	  causing hostapd to use the standard one which doesn't work
 	  for those cases.
 
+comment "ACS is currently only supported through the nl80211 driver"
+	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
+
 config BR2_PACKAGE_HOSTAPD_EAP
 	bool "Enable EAP"
 	depends on !BR2_STATIC_LIBS
-- 
2.11.0
