From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Mar 2021 23:29:30 +0000
Subject: [Buildroot] [Bug 13576] Issues compiling buildroot for 5x86
In-Reply-To: <bug-13576-163@https.bugs.busybox.net/>
References: <bug-13576-163@https.bugs.busybox.net/>
Message-ID: <bug-13576-163-ecmPRBMGRE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13576

--- Comment #4 from ingineru_de_sistem at yahoo.com ---
7) stopping the "transmission" service fails.
This is fully documented in here:
https://forum.transmissionbt.com/viewtopic.php?t=11561

I tried that solution and it works fine (file /etc/init.d/S92transmission) : 

# diff -u S92transmission~ S92transmission
--- S92transmission~
+++ S92transmission
@@ -93,7 +93,7 @@
         #   1 if daemon was already stopped
         #   2 if daemon could not be stopped
         #   other if a failure occurred
-        start-stop-daemon --stop --quiet --retry=TERM/10/KILL/5 --pidfile
$PIDFILE --name $NAME
+        start-stop-daemon --stop --quiet --retry=TERM/10/KILL/5 --pidfile
$PIDFILE --exec $DAEMON
         RETVAL="$?"
         [ "$RETVAL" = 2 ] && return 2


(I mean it starts, stops without error and if I check the process afterwards it
is indeed starter or stopped as requested.)

It may be an upstream bug, but a simple patch in buildroot won't hurt it either
(if they fix it upstream, the patch will just skip, no biggie).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
