From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 14:47:58 +0200
Subject: [Buildroot] [git commit] netsnmp: remove 'set -e' from init script
Message-ID: <20160701124910.A844E81D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11d99e7257094606d36e86429f08ae4fdd6471c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch removes 'set -e' from the netsnmp init script since it causes
the init script to terminate if an error occurs. This prevents the
script to create an "FAIL" printout in case of an error.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/S59snmpd | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index cfda625..2762082 100755
--- a/package/netsnmp/S59snmpd
+++ b/package/netsnmp/S59snmpd
@@ -1,4 +1,4 @@
-#! /bin/sh -e
+#! /bin/sh
 ### BEGIN INIT INFO
 # Provides:           snmpd snmptrapd
 # Required-Start:     $network $local_fs
@@ -11,7 +11,6 @@
 #
 # Author:    Jochen Friedrich <jochen@scram.de>
 #
-set -e
 
 export PATH=/sbin:/usr/sbin:/bin:/usr/bin
 
