From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 22:55:15 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/bandwithd: use
 /run for PIDFile
Message-ID: <20200928211157.337187FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab8123c18a43c2602882dee20302390469b91001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/bandwithd.pid ??? /run/bandwithd.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cdc183eef026ecfc3f2ae2afc02440b549829be4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
