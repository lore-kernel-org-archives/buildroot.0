From: Andreas Ehmanns <universeII@gmx.de>
Date: Thu, 25 Feb 2016 22:24:42 +0100
Subject: [Buildroot] [PATCH 2/4] Package netsnmp: Removed 'set -e'
In-Reply-To: <1456435484-4723-1-git-send-email-universeII@gmx.de>
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
Message-ID: <1456435484-4723-2-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

set -e has been removed from init script since
it causes the init script to terminate if an
error occurs. This prevents the script to create
an "FAIL" printout in case of an error.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
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
 
-- 
2.1.4
