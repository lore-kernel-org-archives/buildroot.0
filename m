From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 16:29:26 +0200
Subject: [Buildroot] [git commit] qemu x86/x86_64: Add kernel IPC support
Message-ID: <20140509143213.E73C29CB4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1865331edcc5f328d941ad7615126541598f6f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The alsa utils packages require a kernel with IPC support to run.  The
kernel config for the x86 and x86_64 qemu build includes sound support
using the hda driver but without the IPC support the alsa utils won't work.
This patch adds IPC support to the x86 and x86_64 kernel to allow alsa
utils to run and brings the kernel config inline with kernel configs for
other qemu boards.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/x86/linux-3.13.config    |    1 +
 board/qemu/x86_64/linux-3.13.config |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

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
