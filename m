From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 22:51:44 +0200
Subject: [Buildroot] [git commit] package/busybox: enable ttyUSB[0-9] when
	using mdev
Message-ID: <20160701205153.F109381D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=567627700a26f4a3a5f835bd113afeb8f4a9e10d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some of our systems are using ttyUSB0 devices as a serial console.
Add them to mdev.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/mdev.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
index 4fafe63..241c1c2 100644
--- a/package/busybox/mdev.conf
+++ b/package/busybox/mdev.conf
@@ -20,6 +20,7 @@ tty		root:tty 666
 tty[0-9]*	root:tty 660
 vcsa*[0-9]*	root:tty 660
 ttyS[0-9]*	root:root 660
+ttyUSB[0-9]*	root:root 660
 
 # alsa sound devices
 pcm.*		root:audio 660 =snd/
