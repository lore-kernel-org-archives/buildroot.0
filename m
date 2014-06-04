From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Jun 2014 19:12:21 +0200
Subject: [Buildroot] [PATCH] package/xbmc: use poweroff to poweroff the RPi
Message-ID: <1401901941-21009-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Using "poweroff" instead of "halt" has the side advantage of flashing
the "ACT" LED 10 times (@ ~1Hz) to instruct the user when it is safe
to unplug the power supply.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xbmc/br-xbmc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xbmc/br-xbmc b/package/xbmc/br-xbmc
index 922b511..fee5d51 100755
--- a/package/xbmc/br-xbmc
+++ b/package/xbmc/br-xbmc
@@ -26,8 +26,8 @@ while [ ${LOOP} -eq 1 ]; do
     ret=$?
     case "${ret}" in
         0)  ;;
-        64) halt;   LOOP=0;;
-        66) reboot; LOOP=0;;
+        64) poweroff; LOOP=0;;
+        66) reboot;   LOOP=0;;
         *)  # Crash
             sleep 1
             ;;
-- 
1.8.3.2
