From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Dec 2019 16:30:43 +0100
Subject: [Buildroot] [PATCH] package/gpsd: remove bogus select of
 BR2_PACKAGE_GPSD_NTP_SHM
Message-ID: <20191213153044.1382229-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 57f85e52a7b29363e76735930bc1bb51a38718ac ("package/gpsd:
unconditionally enable NTP time hinting support"), the option
BR2_PACKAGE_GPSD_NTP_SHM was removed, because NTP time hinting support
is now enabled unconditionally.

However, in one place, a select of this option was kept, which is
obviously no longer needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 22f7e6e1d9..ea0dea3ba6 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -46,7 +46,6 @@ comment "profiling support not available with uClibc-based toolchain"
 
 config BR2_PACKAGE_GPSD_PPS
 	bool "PPS time syncing support"
-	select BR2_PACKAGE_GPSD_NTP_SHM
 
 config BR2_PACKAGE_GPSD_USER
 	bool "GPSD privilege revocation user"
-- 
2.23.0
