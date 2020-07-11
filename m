From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:53:55 +0200
Subject: [Buildroot] [git commit] board/qemu/aarch64-virt/linux.config:
 enable TPM tis support
Message-ID: <20200711135056.58CA686722@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=532bc001538cbae60b16574510d75e974a2c52aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qemu aarch64 virt machine support TPM using a swtmp [1] TPM emulator
provided on the qemu command line [2].

[1] https://github.com/stefanberger/swtpm/wiki
[2] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=c294ac327ca99342b90bd3a83d2cef9b447afaa7

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-virt/linux.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 88f4c43c9e..227723f855 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -47,6 +47,8 @@ CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_TCG_TPM=y
+CONFIG_TCG_TIS=y
 CONFIG_DRM=y
 CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_RTC_CLASS=y
