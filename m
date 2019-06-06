From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:26:23 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/mender: update
 rootfs parts in mender.conf
Message-ID: <20190606154047.D619B81922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=175c0bb03d01595e659f1039c3b2d48059127d47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The configuration options (RootfsPartA/RootfsPartB) must
provide a valid path to a block devices.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 637352b50b622bb4c2f1a529dd7565d4e573d1a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/mender.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/mender.conf b/package/mender/mender.conf
index 979f16aaf6..f89118ac1b 100644
--- a/package/mender/mender.conf
+++ b/package/mender/mender.conf
@@ -2,8 +2,8 @@
   "InventoryPollIntervalSeconds": 1800,
   "UpdatePollIntervalSeconds": 1800,
   "RetryPollIntervalSeconds": 300,
-  "RootfsPartA": "mmcblk0p2",
-  "RootfsPartB": "mmcblk0p3",
+  "RootfsPartA": "/dev/mmcblk0p2",
+  "RootfsPartB": "/dev/mmcblk0p3",
   "ServerCertificate": "/etc/mender/server.crt",
   "ServerURL": "https://docker.mender.io",
   "TenantToken": "dummy"
