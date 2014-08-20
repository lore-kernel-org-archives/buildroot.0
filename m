From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 19 Aug 2014 21:20:46 -0400
Subject: [Buildroot] [PATCH 1/2] ntp: fix undefined variable in error print
Message-ID: <1408497647-2258-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variable "$SCRIPTNAME" is undefined; replace with "$0".

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/ntp/S49ntp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
index 6f9ec75..5721f59 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -36,7 +36,7 @@ case "$1" in
 	sleep 1
 	$0 start
 	;;
-  *) echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
+  *) echo "Usage: $0 {start|stop|restart|reload|force-reload}" >&2
 	exit 1
 	;;
 esac
-- 
1.7.9.5
