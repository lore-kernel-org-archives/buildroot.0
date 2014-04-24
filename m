From: Martin Bark <martin@barkynet.com>
Date: Thu, 24 Apr 2014 19:47:40 +0100
Subject: [Buildroot] [PATCH 1/1] qemu x86/x86_64: Add kernel IPC support
Message-ID: <1398365260-1595-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The alsa utils packages require a kernel with IPC support to run.  The
kernel config for the x86 and x86_64 qemu build includes sound support
using the hda driver but without the IPC support the alsa utils won't work.
This patch adds IPC support to the x86 and x86_64 kernel to allow alsa
utils to run and brings the kernel config inline with kernel configs for
other qemu boards.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 board/qemu/x86/linux-3.13.config    |    1 +
 board/qemu/x86_64/linux-3.13.config |    1 +
 2 files changed, 2 insertions(+)

diff --git a/board/qemu/x86/linux-3.13.config b/board/qemu/x86/linux-3.13.config
index ad9517c..d738e4d 100644
--- a/board/qemu/x86/linux-3.13.config
+++ b/board/qemu/x86/linux-3.13.config
@@ -1,5 +1,6 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 # CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
diff --git a/board/qemu/x86_64/linux-3.13.config b/board/qemu/x86_64/linux-3.13.config
index ad9517c..d738e4d 100644
--- a/board/qemu/x86_64/linux-3.13.config
+++ b/board/qemu/x86_64/linux-3.13.config
@@ -1,5 +1,6 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 # CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
-- 
1.7.9.5
