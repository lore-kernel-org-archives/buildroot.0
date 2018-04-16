From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:30 -0300
Subject: [Buildroot] [PATCH 12/26] netsnmp: don't test if the binaries exist
 in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-13-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/netsnmp/S59snmpd | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index 4ff844ee3a..96ed8237ac 100755
--- a/package/netsnmp/S59snmpd
+++ b/package/netsnmp/S59snmpd
@@ -14,9 +14,6 @@
 
 export PATH=/sbin:/usr/sbin:/bin:/usr/bin
 
-test -x /usr/sbin/snmpd || exit 0
-test -x /usr/sbin/snmptrapd || exit 0
-
 # Defaults
 export MIBDIRS=/usr/share/snmp/mibs
 SNMPDRUN=yes
-- 
2.14.3
