From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Mar 2013 21:22:04 +0100
Subject: [Buildroot] [git commit] package/tvheadend: fix startup script
Message-ID: <20130309202200.00D269AF55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f46682109b4cb01d91cbbeb6f269f084058995ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Obvious fix to the startup script: 'restart' is 'stop+start',
not 'stop+stop'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
