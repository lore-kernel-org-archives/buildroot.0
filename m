From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:51:00 +0100
Subject: [Buildroot] [git commit] sysv init scripts: remove gettext
	invocations
Message-ID: <20141026175105.D94F9B0B75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2113ed46b2ea6ce7e44c7af566059d4d1a1504ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$"str" is supposed to translate str (depending on the current locale).
In ash/dash/..., it cannot be expanded, so commands like

 echo  $"Usage: $0 start|stop"

are printed as '$Usage: SCRIPT start|stop' in [d]ash,
and as 'Usage: SCRIPT start|stop' in bash.

This patch removes the '$' in front of '"'.

Command(s) used for editing:

  find . -type f -name '[SK][0-9][0-9]*' | \
     xargs sed -r -e 's@[$](["])@\1 at g' -i

Signed-off-by: Andr?? Erdmann <dywi@mailerd.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/S15watchdog  |    2 +-
 package/inadyn/S70inadyn     |    2 +-
 package/netatalk/S50netatalk |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/busybox/S15watchdog b/package/busybox/S15watchdog
index 7f1110c..470c6d7 100644
--- a/package/busybox/S15watchdog
+++ b/package/busybox/S15watchdog
@@ -13,7 +13,7 @@ case "$1" in
   restart|reload)
 	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
index b5d7eed..96e7532 100644
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -29,7 +29,7 @@ case "$1" in
 		"$0" start
 		;;
 		*)
-		echo $"Usage: $0 {start|stop|restart}"
+		echo "Usage: $0 {start|stop|restart}"
 		exit 1
 esac
 
diff --git a/package/netatalk/S50netatalk b/package/netatalk/S50netatalk
index f109174..287b20d 100755
--- a/package/netatalk/S50netatalk
+++ b/package/netatalk/S50netatalk
@@ -25,7 +25,7 @@ case "$1" in
         stop
     ;;
     *)
-        echo $"Usage: $0 {start|stop|restart}"
+        echo "Usage: $0 {start|stop|restart}"
         exit 1
 esac
 
