From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 21:18:04 +0200
Subject: [Buildroot] [git commit] udev: fix stopping execution of udev
	events in init.d script
Message-ID: <20120730191827.9CBA981EC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f870c626dc128955be6a27b800465ab38059eb97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udev/S10udev |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
