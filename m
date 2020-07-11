From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:53:47 +0200
Subject: [Buildroot] [git commit] board/qemu/aarch64-virt/linux.config:
 enable QEMU firmware configuration (fw_cfg)
Message-ID: <20200711135056.446BC81763@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61f60debcb71798cfa56bed8e5e115c3afca7847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]:
This kernel option allow exporting of the QEMU firmware configuration (fw_cfg)
file entries via sysfs. Entries are found under /sys/firmware/fw_cfg when this
option is enabled and loaded.

Enable the suboption to allow the qemu_fw_cfg device to be initialized via the
kernel command line or using a module parameter.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/firmware/Kconfig?h=v5.4.42#n187

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-virt/linux.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 129a200ab0..c21994076a 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -7,6 +7,8 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_VEXPRESS=y
 CONFIG_COMPAT=y
+CONFIG_FW_CFG_SYSFS=y
+CONFIG_FW_CFG_SYSFS_CMDLINE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
