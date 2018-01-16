From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 23:24:13 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-firmware: fix
 install for Chelsio T[45]
Message-ID: <20180116222547.A76567FFAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ab9c34961624f01b433939a48dc70ddd66f3cd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

It's broken since 1c9846ec "linux-firmware: Bump to the latest version"

Fix it by updating the name of the file to install.
Do not use * since it would install also old versions that would take
1MB extra space in the target.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d238abe..3d18c6f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -324,14 +324,14 @@ LINUX_FIRMWARE_FILES += bnx2x/*
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
-# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.16.26.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.16.26.0.bin cxgb4/t4fw.bin
+# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.16.45.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.16.45.0.bin cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5),y)
-# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.16.26.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.16.26.0.bin cxgb4/t5fw.bin
+# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.16.45.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.16.45.0.bin cxgb4/t5fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
