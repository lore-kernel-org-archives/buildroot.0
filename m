From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Jul 2013 11:15:52 -0300
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper when
	selected
Message-ID: <1375020952-31696-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's also done in the kernel configuration, however users may be using
some other pre-built kernel and miss functionality like firmware
loading.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/S10mdev | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index c06aa20..d386d42 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -6,6 +6,7 @@
 case "$1" in
   start)
 	echo "Starting mdev..."
+	echo /sbin/mdev >/proc/sys/kernel/hotplug
 	/sbin/mdev -s
 	;;
   stop)
-- 
1.8.1.5
