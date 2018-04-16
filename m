From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:50 +0200
Subject: [Buildroot] [git commit] nfs-utils: don't test if the binary exists
 in the init script
Message-ID: <20180416053718.8317C88325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=089e1fe414408c82a584c2ebec868e1cbc3f9c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nfs-utils/S60nfs | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 893b1e49a6..4183ff6268 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -3,11 +3,6 @@
 # nfs           This shell script takes care of starting and stopping
 #               the NFS services. Stolen from RedHat FC5.
 
-[ -x /usr/sbin/rpc.statd ] || exit 0
-[ -x /usr/sbin/rpc.nfsd ] || exit 0
-[ -x /usr/sbin/rpc.mountd ] || exit 0
-[ -x /usr/sbin/exportfs ] || exit 0
-
 mkdir -p /var/lock/subsys
 mkdir -p /run/nfs/sm
 mkdir -p /run/nfs/sm.bak
