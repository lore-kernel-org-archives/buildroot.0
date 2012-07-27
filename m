From: Jonathan Liu <net147@gmail.com>
Date: Fri, 27 Jul 2012 23:51:57 +1000
Subject: [Buildroot] [PATCH 2/2] udev: use /dev if udev_root not defined in
	init.d script
In-Reply-To: <1343397117-1864-1-git-send-email-net147@gmail.com>
References: <1343397117-1864-1-git-send-email-net147@gmail.com>
Message-ID: <1343397117-1864-2-git-send-email-net147@gmail.com>
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
index 13dfdf5..7bb4309 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -27,7 +27,7 @@ test -r $UDEV_CONFIG || exit 6
 
 case "$1" in
     start)
-        echo -n "Populating $udev_root using udev: "
+        echo -n "Populating ${udev_root:-/dev} using udev: "
         echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
         echo "done"
-- 
1.7.11.2
