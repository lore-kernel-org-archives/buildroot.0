From: Mirza Krak <mirza.krak@northern.tech>
Date: Tue, 14 May 2019 11:04:49 +0200
Subject: [Buildroot] [PATCH 1/2] package/mender: update rootfs parts in
 mender.conf
In-Reply-To: <20190514090450.20142-1-mirza.krak@northern.tech>
References: <20190514090450.20142-1-mirza.krak@northern.tech>
Message-ID: <20190514090450.20142-2-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configuration options (RootfsPartA/RootfsPartB) must
provide a valid path to a block devices.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
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
-- 
2.11.0
