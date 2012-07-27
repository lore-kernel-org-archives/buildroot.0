From: Jonathan Liu <net147@gmail.com>
Date: Fri, 27 Jul 2012 23:51:56 +1000
Subject: [Buildroot] [PATCH 1/2] udev: fix stopping execution of udev events
	in init.d script
Message-ID: <1343397117-1864-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/udev/S10udev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udev/S10udev b/package/udev/S10udev
index 70a7c34..13dfdf5 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -34,7 +34,7 @@ case "$1" in
         ;;
     stop)
         # Stop execution of events
-        udevadm control --stop_exec_queue
+        udevadm control --stop-exec-queue
         killall udevd
         ;;
     *)
-- 
1.7.11.2
