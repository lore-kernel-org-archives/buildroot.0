From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 22:38:27 +0200
Subject: [Buildroot] [git commit] udev: replace "echo -en" with printf
Message-ID: <20140516204123.B4D049CBC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec43c84ce8139644bbce260e17693c551baf4135
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

printf is POSIX-compliant, echo -e/n is not.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udev/S10udev |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udev/S10udev b/package/udev/S10udev
index 2c7b7e9..cf825b4 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -27,8 +27,8 @@ test -r $UDEV_CONFIG || exit 6
 
 case "$1" in
     start)
-        echo -n "Populating ${udev_root:-/dev} using udev: "
-        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+        printf "Populating ${udev_root:-/dev} using udev: "
+        printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
         udevadm trigger
         echo "done"
