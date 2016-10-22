From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] ux500-firmware: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
Message-ID: <20161022132037.7A63C819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e71dd6ec76b62bb1938cd68edbcd5540c59b23b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And remove whitespace.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ux500-firmware/ux500-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ux500-firmware/ux500-firmware.mk b/package/ux500-firmware/ux500-firmware.mk
index 7e947f3..428ed34 100644
--- a/package/ux500-firmware/ux500-firmware.mk
+++ b/package/ux500-firmware/ux500-firmware.mk
@@ -8,13 +8,13 @@ UX500_FIRMWARE_VERSION = 1.1.3-6
 UX500_FIRMWARE_SOURCE = ux500-firmware_$(UX500_FIRMWARE_VERSION)linaro1.tar.gz
 UX500_FIRMWARE_SITE = https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files
 UX500_FIRMWARE_LICENSE = Snowball click-wrap license
-UX500_FIRMWARE_LICENSE_FILES = license.txt 
+UX500_FIRMWARE_LICENSE_FILES = license.txt
 UX500_FIRMWARE_REDISTRIBUTE = NO
 
 # The CG2900 linux driver has to load firmware named CG29XX_* but the firmware
 # filenames contained in this package are CG2900_* hence the code below
 define UX500_FIRMWARE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	for f in $(TARGET_DIR)/lib/firmware/CG2900* ; do \
 		mv $$f $${f/CG2900/CG29XX}; \
 	done
