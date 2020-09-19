From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:15:38 +0200
Subject: [Buildroot] [git commit] package/minidlna: use /run for PIDFile
Message-ID: <20200919130826.E1CA581581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad46c0ac3681bbf84d564c2825b24cd619f6f5dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

PIDFile= references a path below legacy directory /var/run/, updating
/var/run/minidlna.pid ??? /run/minidlna.pid; please update the unit file
accordingly.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minidlna/minidlnad.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlnad.service b/package/minidlna/minidlnad.service
index f69476b303..4e968d3858 100644
--- a/package/minidlna/minidlnad.service
+++ b/package/minidlna/minidlnad.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 ExecStart=/usr/sbin/minidlnad
-PIDFile=/var/run/minidlna/minidlna.pid
+PIDFile=/run/minidlna/minidlna.pid
 
 [Install]
 WantedBy=multi-user.target
