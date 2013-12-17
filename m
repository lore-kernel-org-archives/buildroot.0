From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 17 Dec 2013 02:14:15 +0100
Subject: [Buildroot] [PATCH] udev: Set the default action to "add" in the
	startup script
Message-ID: <1387242855-4882-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise, when udev starts a lot of hardware will not be configured.

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
---
 package/udev/S10udev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udev/S10udev b/package/udev/S10udev
index 2c7b7e9..fa669ea 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -30,7 +30,7 @@ case "$1" in
         echo -n "Populating ${udev_root:-/dev} using udev: "
         echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
-        udevadm trigger
+        udevadm trigger --action=add
         echo "done"
         ;;
     stop)
-- 
1.8.5.1
