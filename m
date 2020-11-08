From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun,  8 Nov 2020 17:33:49 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/cups-filters: fix deamon path
 for cups service
Message-ID: <20201108163350.1138873-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a typo in service location, the right location is indeed /usr/bin.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1 -> v2:
  Fixing author

 package/cups-filters/S82cups-browsed | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cups-filters/S82cups-browsed b/package/cups-filters/S82cups-browsed
index 08909c7f98..f17bbe7465 100644
--- a/package/cups-filters/S82cups-browsed
+++ b/package/cups-filters/S82cups-browsed
@@ -6,7 +6,7 @@ PIDFILE="/var/run/$DAEMON.pid"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- -c /etc/cups/cups-browsed.conf
 	status=$?
 	if [ "$status" -eq 0 ]; then
-- 
2.25.1
