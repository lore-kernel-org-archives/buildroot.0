From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:32 -0300
Subject: [Buildroot] [PATCH 14/26] nfs-utils: don't test if the binary
 exists in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-15-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
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
-- 
2.14.3
