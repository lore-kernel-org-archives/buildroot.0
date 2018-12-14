From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:05:45 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: install all Qlogic
 QED binaries
Message-ID: <20181214210152.D87E680304@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a6f9306d8788829bcd1febc820c5b231f06fbb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are various versions shipped in linux-firmware. In the past we
decided that it was up to the developer to filter out the ones they want
for their specific kernel version, so install them all.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 60f39804a2..e5cd56d9a5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -383,7 +383,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X),y)
 LINUX_FIRMWARE_FILES += \
-	qed/qed_init_values_zipped-8.33.11.0.bin
+	qed/qed_init_values_zipped-*.bin
 # No license file; the license is in the file WHENCE
 # which is installed unconditionally
 endif
