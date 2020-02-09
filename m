From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 09:45:37 +0100
Subject: [Buildroot] [git commit] package/Config.in: fix make failure by
 removing gstreamer/Config.in
Message-ID: <20200209083445.A5F268D6EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48cd1b88d0bf9474d4c0464e171348998804742d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After commit:
https://git.buildroot.net/buildroot/commit/?id=fb49c7a26182f9d48f8283e7328fddc216962c94
gstreamer entry in package/Config.in was left behind resulting in every
make call to fail. So let's remove orphaned gstreamer entry from
package/Config.in

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 72630d4ee9..dfa3f34b9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -26,7 +26,6 @@ menu "Audio and video applications"
 	source "package/fluid-soundfont/Config.in"
 	source "package/fluidsynth/Config.in"
 	source "package/gmrender-resurrect/Config.in"
-	source "package/gstreamer/Config.in"
 	source "package/gstreamer1/Config.in"
 	source "package/jack1/Config.in"
 	source "package/jack2/Config.in"
