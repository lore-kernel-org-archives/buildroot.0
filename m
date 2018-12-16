From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:51:23 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/linux-firmware:
 install all Qlogic QED binaries
Message-ID: <20181216214719.3D6A68D5B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62897bf0518ab8cb074d901f69edeebb4838ff19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

There are various versions shipped in linux-firmware. In the past we
decided that it was up to the developer to filter out the ones they want
for their specific kernel version, so install them all.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6a6f9306d8788829bcd1febc820c5b231f06fbb5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c9866fd1bb..f6fcad0ef8 100644
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
