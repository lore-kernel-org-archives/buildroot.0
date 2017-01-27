From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jan 2017 10:01:50 -0300
Subject: [Buildroot] [PATCH] configs/qemu: enable tmpfs for or1k
Message-ID: <20170127130150.32712-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is used by buildroot default initscripts and results in some ugly
errors on startup otherwise.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/or1k/linux-4.9.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/or1k/linux-4.9.config b/board/qemu/or1k/linux-4.9.config
index 5ba03c3..0a817b1 100644
--- a/board/qemu/or1k/linux-4.9.config
+++ b/board/qemu/or1k/linux-4.9.config
@@ -14,6 +14,7 @@ CONFIG_IP_MULTICAST=y
 # CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_TMPFS=y
 CONFIG_NETDEVICES=y
 CONFIG_ETHOC=y
 # CONFIG_WLAN is not set
-- 
2.10.2
