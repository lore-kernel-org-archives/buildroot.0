From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri,  1 Jul 2016 21:57:30 +0300
Subject: [Buildroot] [PATCH v1 1/1] package/busybox: enable ttyUSB[0-9] when
	using mdev
Message-ID: <1467399450-1005-1-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of our systems are using ttyUSB0 devices as a serial console.
Add them to mdev.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
-- 
2.8.1
