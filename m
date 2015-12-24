From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:00:38 +0100
Subject: [Buildroot] [git commit] package/dhcp/S80dhcp-server: support extra
	options
Message-ID: <20151224140054.D7A96826F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80965e30eb492c8453e94f44adbc2ecf233ad465
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an OPTIONS configuration variable in order to make it possible to
pass custom extra options to dhcpd.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/S80dhcp-server | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index f52ca98..2538d42 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -7,6 +7,9 @@
 #       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
 INTERFACES=""
 
+# Additional options that are passed to the DHCP server daemon?
+OPTIONS=""
+
 NAME="dhcpd"
 DAEMON="/usr/sbin/${NAME}"
 CFG_FILE="/etc/default/${NAME}"
@@ -24,7 +27,7 @@ case "$1" in
 		printf "Starting DHCP server: "
 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
 		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases
-		start-stop-daemon -S -x ${DAEMON} -- -q $INTERFACES
+		start-stop-daemon -S -x ${DAEMON} -- -q $OPTIONS $INTERFACES
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
