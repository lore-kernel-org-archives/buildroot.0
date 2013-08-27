From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 22:34:47 +0200
Subject: [Buildroot] [git commit] openssh: fix tab/spacing in init script
Message-ID: <20130827210259.D68CC9B3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0be2fe9a8c07d1f58ca9eb288cb75aaae40550cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several of the lines in S50sshd script have a strange mix of spaces
and tabs, that at least do not look consistent with neighboring lines.
This patch makes the spacing consistent, and also strips the trailing
spaces.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssh/S50sshd |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

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
