From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 22:48:10 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/openvmtools: use
 /run for PIDFile
Message-ID: <20200928211214.4FD1A7FD7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa78ca567ce268b3209732ba67d24247e944c566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/vmtoolsd.pid ??? /run/vmtoolsd.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e97fe4f28cc2015775bdd85251396674826227fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvmtools/vmtoolsd.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/vmtoolsd.service b/package/openvmtools/vmtoolsd.service
index cb97357ec2..1d2a3566cf 100644
--- a/package/openvmtools/vmtoolsd.service
+++ b/package/openvmtools/vmtoolsd.service
@@ -5,8 +5,8 @@ ConditionVirtualization=vmware
 
 [Service]
 Type=forking
-PIDFile=/var/run/vmtoolsd.pid
-ExecStart=/usr/bin/vmtoolsd -b /var/run/vmtoolsd.pid
+PIDFile=/run/vmtoolsd.pid
+ExecStart=/usr/bin/vmtoolsd -b /run/vmtoolsd.pid
 Restart=on-failure
 KillMode=process
 KillSignal=SIGKILL
