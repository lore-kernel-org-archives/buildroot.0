From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 30 Jul 2012 08:22:20 +0100
Subject: [Buildroot] [PATCH] gpsd: PPS feature depends on NTPSHM feature
Message-ID: <1343632940-8604-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The PPS feature of gpsd depends on the NTP shared memory time hinting feature.

This patch caused the NTPSHM feature to be enabled whenever the PPS feature
is enabled. This should fix build failures such as the following.

  http://autobuild.buildroot.net/results/e58a9a9f884acb6834a8afe4a8a3d056dc509359/build-end.log

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gpsd/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 8643492..a11c553 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_GPSD_NTP_SHM
 
 config BR2_PACKAGE_GPSD_PPS
 	bool "PPS time syncing support"
+	select BR2_PACKAGE_GPSD_NTP_SHM
 
 config BR2_PACKAGE_GPSD_USER
 	bool "GPSD privilege revocation user"
-- 
1.7.9.5
