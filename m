From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:25:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/rsyslog: fix
 S01rsyslogd indentation
Message-ID: <20190426130222.AEC4B838A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f1f524fa29bac1c9adacaa840dde11f3906d943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Don't mix spaces and tabs, only use tabs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 95a8655fe21c99806861a049e982bbec4a9cf6d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/S01rsyslogd | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rsyslog/S01rsyslogd b/package/rsyslog/S01rsyslogd
index e9922d932d..78421876de 100644
--- a/package/rsyslog/S01rsyslogd
+++ b/package/rsyslog/S01rsyslogd
@@ -41,13 +41,13 @@ restart() {
 }
 
 case "$1" in
-        start|stop|restart)
+	start|stop|restart)
 		"$1";;
 	reload)
 		# Restart, since there is no true "reload" feature (does not
 		# reconfigure/restart on SIGHUP, just closes all open files).
 		restart;;
-        *)
-                echo "Usage: $0 {start|stop|restart|reload}"
-                exit 1
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
