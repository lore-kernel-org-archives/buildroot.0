From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 23:15:37 +0100
Subject: [Buildroot] [git commit branch/next] package/cups-filters: fix
 daemon path for cups service
Message-ID: <20201117203827.778B87FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfc63898f4dbdf7d9eb7c01252ea8ba4c5242229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix a typo in service location, the right location is indeed /usr/sbin.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
