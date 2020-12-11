From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 13:59:43 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/vsftpd:
 S70vsftpd: correct -x argument to start-stop-daemon
Message-ID: <20201211124418.5EEAA80E34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c40a0a4ef6b4d0c9e7209c9310a3d4d00bd121e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes #13341

The -x / --exec start-stop-daemon option expects the path to the executable,
not just the name, leading to errors when running the init script:

Starting vsftpd: start-stop-daemon: unable to stat //vsftpd (No such file or directory)

Reported-by: tochansky at tochlab.net
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 405f76425d20ef2f84006f2f6db798c338691c13)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vsftpd/S70vsftpd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vsftpd/S70vsftpd b/package/vsftpd/S70vsftpd
index 38bcfd431f..62f9a1b744 100644
--- a/package/vsftpd/S70vsftpd
+++ b/package/vsftpd/S70vsftpd
@@ -9,12 +9,12 @@ DAEMON=/usr/sbin/$NAME
 case "$1" in
   start)
 	printf "Starting $DESC: "
-	start-stop-daemon -S -b -x $NAME
+	start-stop-daemon -S -b -x $DAEMON
 	echo "OK"
 	;;
   stop)
 	printf "Stopping $DESC: "
-	start-stop-daemon -K -x $NAME
+	start-stop-daemon -K -x $DAEMON
 	echo "OK"
 	;;
   restart|force-reload)
