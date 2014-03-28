From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Mar 2014 09:59:49 +0100
Subject: [Buildroot] [git commit] netsnmp: fix tab/space formatting in
	init.d script
Message-ID: <20140328090050.4B39A9C3EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ef8f8e9c5ca219fedad926c61316e99bc49aa2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The S59snmpd script has a strange mix of tabs and spaces.  Replace
tabs with spaces, and also remove unnecessary line continuations
from the start-stop-daemon lines, as none of them go beyond 80
columns.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/S59snmpd |   27 ++++++++++++---------------
 1 files changed, 12 insertions(+), 15 deletions(-)

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
