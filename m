From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:52:33 +0100
Subject: [Buildroot] [git commit] lighttpd: carry common keywords out to
	variables
Message-ID: <20170309205330.8AF6F822CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bee455bd805d19f0b591dfecb87d90ff64af571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

S50lighttpd contains repeating keywords that are worth carrying out as
variables: pid file name, daemon name, config file name.

Signed-off-by: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/S50lighttpd | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/S50lighttpd b/package/lighttpd/S50lighttpd
index 44ac257..7a14ec8 100644
--- a/package/lighttpd/S50lighttpd
+++ b/package/lighttpd/S50lighttpd
@@ -2,15 +2,19 @@
 #
 # Starts lighttpd.
 #
+NAME=lighttpd
+DAEMON=/usr/sbin/$NAME
+PID_FILE="/var/run/$NAME.pid"
+CONF_FILE="/etc/$NAME/$NAME.conf"
 
 start() {
 	printf "Starting lighttpd: "
-	start-stop-daemon -S -q -p /var/run/lighttpd.pid --exec /usr/sbin/lighttpd -- -f /etc/lighttpd/lighttpd.conf
+	start-stop-daemon -S -q -p $PID_FILE --exec $DAEMON -- -f $CONF_FILE
 	echo "OK"
 }
 stop() {
 	printf "Stopping lighttpd: "
-	start-stop-daemon -K -q -p /var/run/lighttpd.pid
+	start-stop-daemon -K -q -p $PID_FILE
 	echo "OK"
 }
 restart() {
