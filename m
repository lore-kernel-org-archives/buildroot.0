From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:20:53 +0100
Subject: [Buildroot] [git commit] configs/qemu: enable tmpfs for microblaze
Message-ID: <20151117202100.6B7B481E1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90d1299a18a375602b98a8e6d2ad9a651a4d8a61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the tmpfs-backed filesystems fail:
mount: mounting tmpfs on /dev/shm failed: Invalid argument
mount: mounting tmpfs on /tmp failed: Invalid argument
mount: mounting tmpfs on /run failed: Invalid argument

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/microblazebe-mmu/linux-4.3.config |    1 +
 board/qemu/microblazeel-mmu/linux-4.3.config |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

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
