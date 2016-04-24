From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:34:51 +0200
Subject: [Buildroot] [git commit] linux-firmware: allow LINUX_FIRMWARE_FILES
	to contain wildcards
Message-ID: <20160424214206.EB61381D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=095c04f47cea1a3449ae0552c59e164d1f5d8422
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit will allow the LINUX_FIRMWARE_FILES variable to contain
wildcards, which will simplify the handling of firmware that are
available in numerous revisions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 28fe66c..c33eb95 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -356,7 +356,8 @@ endif
 
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
-	$(TAR) c -C $(@D) $(sort $(LINUX_FIRMWARE_FILES)) | \
+	cd $(@D) ; \
+	$(TAR) c $(sort $(LINUX_FIRMWARE_FILES)) | \
 		$(TAR) x -C $(TARGET_DIR)/lib/firmware
 endef
 endif
