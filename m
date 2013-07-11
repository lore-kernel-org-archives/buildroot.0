From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Jul 2013 17:30:54 -0300
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper
Message-ID: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Register mdev as hotplug helper for many goodies and expected behaviour
(like automatic firmware loading).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/S10mdev | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index c06aa20..c41f166 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -6,6 +6,7 @@
 case "$1" in
   start)
 	echo "Starting mdev..."
+	echo /sbin/mdev 2>/dev/null >/proc/sys/kernel/hotplug
 	/sbin/mdev -s
 	;;
   stop)
-- 
1.8.1.5
