From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jun 2018 19:10:10 +0200
Subject: [Buildroot] [git commit] apache: add reload target to sysv init
 script
Message-ID: <20180622171913.46AA481558@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=876917689b32c5b65ba4e0b2014b79c55b6a45f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/S50apache | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/apache/S50apache b/package/apache/S50apache
index 623a7eef3b..b687419055 100644
--- a/package/apache/S50apache
+++ b/package/apache/S50apache
@@ -4,8 +4,11 @@ case "$1" in
   start|restart|graceful|graceful-stop|stop)
 	apachectl -k $1
 	;;
+  reload)
+	apachectl -k restart
+	;;
   *)
-	echo "Usage: $0 {start|restart|graceful|graceful-stop|stop}"
+	echo "Usage: $0 {start|restart|reload|graceful|graceful-stop|stop}"
 	exit 1
 esac
 
