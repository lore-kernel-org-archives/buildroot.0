From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 27 Mar 2014 22:08:46 -0400
Subject: [Buildroot] [PATCH 1/1] netsnmp: fix tab/space formatting in init.d
	script
Message-ID: <1395972526-2048-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The S59snmpd script has a strange mix of tabs and spaces.  Replace
tabs with spaces, and also remove unnecessary line continuations
from the start-stop-daemon lines, as none of them go beyond 80
columns.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/netsnmp/S59snmpd |   27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index 5df4b85..868be26 100755
--- a/package/netsnmp/S59snmpd
+++ b/package/netsnmp/S59snmpd
@@ -42,14 +42,12 @@ case "$1" in
   start)
     echo -n "Starting network management services:"
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-	start-stop-daemon -q -S -x /usr/sbin/snmpd \
-	    -- $SNMPDOPTS
-	echo -n " snmpd"
+      start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
+      echo -n " snmpd"
     fi
     if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
-	start-stop-daemon -q -S -x /usr/sbin/snmptrapd \
-	    -- $TRAPDOPTS
-	echo -n " snmptrapd"
+      start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
+      echo -n " snmptrapd"
     fi
     echo "."
     ;;
@@ -68,23 +66,22 @@ case "$1" in
     # Allow the daemons time to exit completely.
     sleep 2
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-	start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
-	echo -n " snmpd"
+      start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
+      echo -n " snmpd"
     fi
     if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
-	# Allow snmpd time to start up.
-	sleep 1
-	start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
-	echo -n " snmptrapd"
+      # Allow snmpd time to start up.
+      sleep 1
+      start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
+      echo -n " snmptrapd"
     fi
     echo "."
     ;;
   reload|force-reload)
     echo -n "Reloading network management services:"
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-        start-stop-daemon -q -K -s 1 \
-	    -p /var/run/snmpd.pid -x /usr/sbin/snmpd
-	echo -n " snmpd"
+      start-stop-daemon -q -K -s 1 -p /var/run/snmpd.pid -x /usr/sbin/snmpd
+      echo -n " snmpd"
     fi
     echo "."
     ;;
-- 
1.7.9.5
