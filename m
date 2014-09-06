From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Sep 2014 15:50:39 +0200
Subject: [Buildroot] [PATCH] nfs-utils: create /var/lock/subsys
Message-ID: <1410011439-15274-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The NFS server needs to create files in /var/lock/subsys/, but this
directory doesn't exist in our skeleton. This commit makes sure it
gets created by the S60nfs startup script, which fixes the operation
of the NFS server (tested with rpcbind).

Reported-by: Ofer Heifetz <oferh@marvell.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfs-utils/S60nfs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 49dab70..4afee55 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -16,6 +16,7 @@
 # The /var/lib/nfs directory is actually on a tmpfs filesystem.
 mkdir -p /var/lib/nfs/sm
 mkdir -p /var/lib/nfs/sm.bak
+mkdir -p /var/lock/subsys
 touch /var/lib/nfs/etab
 touch /var/lib/nfs/rmtab
 touch /var/lib/nfs/state
-- 
2.0.0
