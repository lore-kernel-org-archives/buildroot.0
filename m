From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jan 2017 14:17:11 +0100
Subject: [Buildroot] [git commit] configs/qemu: enable tmpfs for or1k
Message-ID: <20170127134326.B4D76820F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03b93b6c1cc329fc1c40a94a4daba3571e45e6f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is used by buildroot default initscripts and results in some ugly
errors on startup otherwise.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
