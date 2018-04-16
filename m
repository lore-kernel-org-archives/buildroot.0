From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:47 +0200
Subject: [Buildroot] [git commit] netsnmp: don't test if the binaries exist
 in the init script
Message-ID: <20180416053718.5ADC488325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddd035b87e647bc95fdfe42c59ee931d55822a22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
