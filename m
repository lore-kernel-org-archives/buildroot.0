From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:12:47 +0200
Subject: [Buildroot] [git commit branch/next] gpsd: PPS feature depends on
	NTPSHM feature
Message-ID: <20120802195301.E5ABD8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=522772bd337ecadd00427c3738c4ebb100d91866
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The PPS feature of gpsd depends on the NTP shared memory time hinting feature.

This patch caused the NTPSHM feature to be enabled whenever the PPS feature
is enabled. This should fix build failures such as the following.

  http://autobuild.buildroot.net/results/e58a9a9f884acb6834a8afe4a8a3d056dc509359/build-end.log

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
