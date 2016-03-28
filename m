From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 18:03:58 -0300
Subject: [Buildroot] [PATCH] configs/qemu: enable modules for x86 and x86_64
Message-ID: <1459199038-26889-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's useful for demo configs which have more features, like
automatically loaded (module) drivers.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86/linux-4.5.config    | 2 ++
 board/qemu/x86_64/linux-4.5.config | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/board/qemu/x86/linux-4.5.config b/board/qemu/x86/linux-4.5.config
index 9cd64f7..c630f02 100644
--- a/board/qemu/x86/linux-4.5.config
+++ b/board/qemu/x86/linux-4.5.config
@@ -1,4 +1,6 @@
 CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_SMP=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/board/qemu/x86_64/linux-4.5.config b/board/qemu/x86_64/linux-4.5.config
index 9cd64f7..c630f02 100644
--- a/board/qemu/x86_64/linux-4.5.config
+++ b/board/qemu/x86_64/linux-4.5.config
@@ -1,4 +1,6 @@
 CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_SMP=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-- 
2.7.3
