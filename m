From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:48:05 +0200
Subject: [Buildroot] [git commit] package/xbmc: use poweroff to poweroff the
	RPi
Message-ID: <20140608134811.9EF4A9CB8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04be2f426ff89a1306fb2c8160c142b4c910efc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using "poweroff" instead of "halt" has the side advantage of flashing
the "ACT" LED 10 times (@ ~1Hz) to instruct the user when it is safe
to unplug the power supply.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/br-xbmc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
