From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 15 Mar 2012 22:08:09 +0100
Subject: [Buildroot] [PATCH] Remove stray $ character from a bunch of init
	scripts
Message-ID: <1331845689-5261-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---

I cluelessly wonder how they got there in the beginning and got unnoticed for
such a long time...

---

 fs/skeleton/etc/init.d/S40network |    2 +-
 package/at/S99at                  |    2 +-
 package/busybox/S01logging        |    2 +-
 package/busybox/S10mdev           |    2 +-
 package/dbus/S30dbus              |    2 +-
 package/dropbear/S50dropbear      |    2 +-
 package/gpsd/S50gpsd              |    2 +-
 package/multimedia/mpd/S95mpd     |    2 +-
 package/netplug/S29netplug        |    6 +++---
 package/openssh/S50sshd           |    2 +-
 package/rsyslog/S01rsyslog        |    2 +-
 package/stunnel/S50stunnel        |    2 +-
 12 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/skeleton/etc/init.d/S40network b/fs/skeleton/etc/init.d/S40network
index ad6d250..e69e613 100755
--- a/fs/skeleton/etc/init.d/S40network
+++ b/fs/skeleton/etc/init.d/S40network
@@ -17,7 +17,7 @@ case "$1" in
 	"$0" start
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/at/S99at b/package/at/S99at
index c3be80c..accaa31 100755
--- a/package/at/S99at
+++ b/package/at/S99at
@@ -31,7 +31,7 @@ case "$1" in
 	restart
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index 581f192..edece39 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -19,7 +19,7 @@ case "$1" in
   restart|reload)
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index d2643d0..c06aa20 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -13,7 +13,7 @@ case "$1" in
   restart|reload)
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
index d764e29..0d15c73 100755
--- a/package/dbus/S30dbus
+++ b/package/dbus/S30dbus
@@ -72,7 +72,7 @@ case "$1" in
         RETVAL=$?
         ;;
     *)
-        echo $"Usage: $0 {start|stop|status|restart|condrestart|reload}"
+        echo "Usage: $0 {start|stop|status|restart|condrestart|reload}"
         ;;
 esac
 exit $RETVAL
diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index 14101d8..991a121 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -48,7 +48,7 @@ case "$1" in
   	restart
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/gpsd/S50gpsd b/package/gpsd/S50gpsd
index 31727eb..6e5ce88 100644
--- a/package/gpsd/S50gpsd
+++ b/package/gpsd/S50gpsd
@@ -33,7 +33,7 @@ case "$1" in
         restart
         ;;
   *)
-        echo $"Usage: $0 {start|stop|restart}"
+        echo "Usage: $0 {start|stop|restart}"
         exit 1
 esac
 
diff --git a/package/multimedia/mpd/S95mpd b/package/multimedia/mpd/S95mpd
index 7c242f4..a4f1271 100644
--- a/package/multimedia/mpd/S95mpd
+++ b/package/multimedia/mpd/S95mpd
@@ -25,6 +25,6 @@ case "$1" in
 		start
 		;;
 	*)
-		echo $"Usage: $0 {start|stop|restart}"
+		echo "Usage: $0 {start|stop|restart}"
 		exit 1
 esac
diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
index e246674..d95554e 100755
--- a/package/netplug/S29netplug
+++ b/package/netplug/S29netplug
@@ -39,7 +39,7 @@ fi
 case "$1" in
   start)
 	# Start daemon.
-	echo -n $"Starting network plug daemon: "
+	echo -n "Starting network plug daemon: "
 	start-stop-daemon -S -q -p /var/run/netplugd.pid -x /sbin/netplugd ${NETPLUGDARGS}
 	RETVAL=$?
 	echo
@@ -47,7 +47,7 @@ case "$1" in
 	;;
   stop)
 	# Stop daemon.
-	echo -n $"Shutting down network plug daemon: "
+	echo -n "Shutting down network plug daemon: "
 	start-stop-daemon -K -n netplugd
 	RETVAL=$?
 	echo
@@ -61,7 +61,7 @@ case "$1" in
 	[ -f /var/lock/subsys/netplugd ] && $0 restart || :
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	RETVAL=1
 	;;
 esac
diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index f0d2aef..89f1b9a 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -64,7 +64,7 @@ case "$1" in
   	restart
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/rsyslog/S01rsyslog b/package/rsyslog/S01rsyslog
index 8c28e02..0c4bbc7 100644
--- a/package/rsyslog/S01rsyslog
+++ b/package/rsyslog/S01rsyslog
@@ -30,7 +30,7 @@ case "$1" in
 	restart
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/stunnel/S50stunnel b/package/stunnel/S50stunnel
index 5033e96..95bb301 100644
--- a/package/stunnel/S50stunnel
+++ b/package/stunnel/S50stunnel
@@ -29,7 +29,7 @@ case "$1" in
 	restart
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
-- 
1.7.5.4
