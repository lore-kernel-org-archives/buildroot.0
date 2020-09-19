From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:15:16 +0200
Subject: [Buildroot] [git commit] package/bandwithd: use /run for PIDFile
Message-ID: <20200919130826.BB50881581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdc183eef026ecfc3f2ae2afc02440b549829be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/bandwithd.pid ??? /run/bandwithd.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bandwidthd/bandwidthd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bandwidthd/bandwidthd.service b/package/bandwidthd/bandwidthd.service
index 9c03d42946..ab7f05a2e8 100644
--- a/package/bandwidthd/bandwidthd.service
+++ b/package/bandwidthd/bandwidthd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 ExecStart=/usr/bin/bandwidthd
-PIDFile=/var/run/bandwidthd.pid
+PIDFile=/run/bandwidthd.pid
 
 [Install]
 WantedBy=multi-user.target
