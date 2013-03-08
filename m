From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 Mar 2013 22:53:29 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: fix startup script
Message-ID: <1362779609-29725-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Obvious fix to the startup script: 'restart' is 'stop+start',
not 'stop+stop'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/S99tvheadend |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
index 407b873..c29e32d 100644
--- a/package/tvheadend/S99tvheadend
+++ b/package/tvheadend/S99tvheadend
@@ -43,7 +43,7 @@ case "$1" in
     restart|force-reload)
         "${0}" stop
         sleep 2
-        "${0}" stop
+        "${0}" start
         ;;
     *)
         echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
-- 
1.7.2.5
