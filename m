From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Dec 2018 17:56:26 +0000
Subject: [Buildroot] [Bug 11566] New: Fix init script
Message-ID: <bug-11566-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11566

            Bug ID: 11566
           Summary: Fix init script
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: yangtze31 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

The init script restart and stop don't work. 

Thanks,
Bin Zhang 

--- S99shairport-sync.orig      2018-12-18 18:46:22.096225172 +0100
+++ S99shairport-sync   2018-12-18 18:47:30.360227688 +0100
@@ -6,16 +6,17 @@
 case "$1" in
     start)
        printf "Starting shairport-sync: "
-       start-stop-daemon -S -q -p /var/run/shairport-sync.pid --exec
/usr/bin/shairport-sync -- $OPTIONS
+       start-stop-daemon -S -q --exec /usr/bin/shairport-sync -- $OPTIONS
        [ $? = 0 ] && echo "OK" || echo "FAIL"
        ;;
     stop)
        printf "Stopping shairport-sync: "
-       start-stop-daemon -K -q -p /var/run/shairport-sync.pid
+       start-stop-daemon -K -q -p /var/run/shairport-sync/shairport-sync.pid
        [ $? = 0 ] && echo "OK" || echo "FAIL"
        ;;
     restart)
        $0 stop
+       sleep 1
        $0 start
        ;;
     *)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
