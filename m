From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:16 -0300
Subject: [Buildroot] [PATCH 29/93] ux500-firmware: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-30-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

And remove whitespace.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
