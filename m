From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Jan 2014 21:04:58 +0200
Subject: [Buildroot] [PATCH] busybox: udhcpc script: create resolv.conf
Message-ID: <2c4d5dc2aabdcbea6f0b2395f90f30dd4d2a3710.1389812698.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eliminate the following error message on every boot:

grep: /etc/resolv.conf: No such file or directory

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/busybox/udhcpc.script | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 43742fbd5302..9e08dadf5f4e 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -5,6 +5,7 @@
 [ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
 
 RESOLV_CONF="/etc/resolv.conf"
+[ -e $RESOLV_CONF ] || touch $RESOLV_CONF
 [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
 [ -n "$subnet" ] && NETMASK="netmask $subnet"
 
-- 
1.8.5.2
