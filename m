From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Nov 2015 13:37:14 -0300
Subject: [Buildroot] [PATCH 3/3] configs/qemu: enable tmpfs for microblaze
In-Reply-To: <1447778234-14246-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447778234-14246-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1447778234-14246-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the tmpfs-backed filesystems fail:
mount: mounting tmpfs on /dev/shm failed: Invalid argument
mount: mounting tmpfs on /tmp failed: Invalid argument
mount: mounting tmpfs on /run failed: Invalid argument

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/microblazebe-mmu/linux-4.3.config | 1 +
 board/qemu/microblazeel-mmu/linux-4.3.config | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/qemu/microblazebe-mmu/linux-4.3.config b/board/qemu/microblazebe-mmu/linux-4.3.config
index 6b4ff22..7bcd382 100644
--- a/board/qemu/microblazebe-mmu/linux-4.3.config
+++ b/board/qemu/microblazebe-mmu/linux-4.3.config
@@ -17,3 +17,4 @@ CONFIG_XILINX_EMACLITE=y
 CONFIG_SERIAL_UARTLITE=y
 CONFIG_SERIAL_UARTLITE_CONSOLE=y
 # CONFIG_VGA_CONSOLE is not set
+CONFIG_TMPFS=y
diff --git a/board/qemu/microblazeel-mmu/linux-4.3.config b/board/qemu/microblazeel-mmu/linux-4.3.config
index c7d6b30..a622828 100644
--- a/board/qemu/microblazeel-mmu/linux-4.3.config
+++ b/board/qemu/microblazeel-mmu/linux-4.3.config
@@ -16,3 +16,4 @@ CONFIG_XILINX_EMACLITE=y
 CONFIG_SERIAL_UARTLITE=y
 CONFIG_SERIAL_UARTLITE_CONSOLE=y
 # CONFIG_VGA_CONSOLE is not set
+CONFIG_TMPFS=y
-- 
2.4.10
