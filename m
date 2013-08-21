From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 20 Aug 2013 21:11:00 -0400
Subject: [Buildroot] [PATCH] openssh: fix tab/spacing in init script
Message-ID: <1377047460-1937-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several of the lines in S50sshd script have a strange mix of spaces
and tabs, that at least do not look consistent with neighboring lines.
This patch makes the spacing consistent, and also strips the trailing
spaces.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/openssh/S50sshd |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 89f1b9a..b65b3c8 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -23,7 +23,7 @@ if [ ! -f /etc/ssh_host_dsa_key ] ; then
 	echo Generating DSA Key...
 	echo THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!
 	echo
-        /usr/bin/ssh-keygen -t dsa -f /etc/ssh_host_dsa_key -C '' -N ''
+	/usr/bin/ssh-keygen -t dsa -f /etc/ssh_host_dsa_key -C '' -N ''
 fi
 
 # Check for the SSH2 ECDSA key
@@ -33,35 +33,35 @@ if [ ! -f /etc/ssh_host_ecdsa_key ]; then
 	echo
 	/usr/bin/ssh-keygen -t ecdsa -f /etc/ssh_host_ecdsa_key -C '' -N ''
 fi
-                
+
 umask 077
 
 start() {
- 	echo -n "Starting sshd: "
+	echo -n "Starting sshd: "
 	/usr/sbin/sshd
 	touch /var/lock/sshd
 	echo "OK"
-}	
+}
 stop() {
 	echo -n "Stopping sshd: "
-        killall	sshd 
+	killall sshd
 	rm -f /var/lock/sshd
-	echo "OK" 
+	echo "OK"
 }
 restart() {
 	stop
 	start
-}	
+}
 
 case "$1" in
   start)
-  	start
+	start
 	;;
   stop)
-  	stop
+	stop
 	;;
   restart|reload)
-  	restart
+	restart
 	;;
   *)
 	echo "Usage: $0 {start|stop|restart}"
-- 
1.7.9.5
