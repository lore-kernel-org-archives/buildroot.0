From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Jun 2014 21:25:13 +0200
Subject: [Buildroot] [git commit] hostapd: explain internal TLS version
	selection
Message-ID: <20140605201506.B6B0599C9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b8d70807090eb58fc65de111bae1924b5297b72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should have no functional change.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/hostapd.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 8c5db41..90f2e96 100644
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
