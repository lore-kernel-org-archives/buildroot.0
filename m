From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 21:18:06 +0200
Subject: [Buildroot] [git commit branch/next] udev: use /dev if udev_root
	not defined in init.d script
Message-ID: <20120802195302.BE46F8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b08fd56ae82ad2d003512e6128ae60016d0186df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udev/S10udev |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
