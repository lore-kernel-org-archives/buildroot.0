From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  5 Jun 2014 17:24:19 +0300
Subject: [Buildroot] [PATCH v2 2/2] hostapd: explain internal TLS version
	selection
In-Reply-To: <beac89df1d15b9b192b30dbd1e1363d5a11c7833.1401978259.git.baruch@tkos.co.il>
References: <beac89df1d15b9b192b30dbd1e1363d5a11c7833.1401978259.git.baruch@tkos.co.il>
Message-ID: <c6ae0f8450cc9e667beec4ee183ad727eb70a670.1401978259.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Should have no functional change.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
	New patch
---
 package/hostapd/hostapd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 8c5db418e24e..90f2e9679a86 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -53,7 +53,9 @@ ifeq ($(BR2_PACKAGE_HOSTAPD_EAP),y)
 	HOSTAPD_CONFIG_ENABLE += \
 		CONFIG_EAP \
 		CONFIG_RADIUS_SERVER \
-		CONFIG_TLSV1
+
+	# Enable both TLS v1.1 (CONFIG_TLSV11) and v1.2 (CONFIG_TLSV12)
+	HOSTAPD_CONFIG_ENABLE += CONFIG_TLSV1
 else
 	HOSTAPD_CONFIG_DISABLE += CONFIG_EAP
 	HOSTAPD_CONFIG_ENABLE += \
-- 
2.0.0.rc2
