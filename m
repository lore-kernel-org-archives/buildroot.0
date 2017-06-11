From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:28:02 +0200
Subject: [Buildroot] [git commit] arm-trusted-firmware: exclude from hash
	when downloading from git
Message-ID: <20170611123753.16E8C802BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7010ae3ad4576b9ee2bef0e3c693614837bd0ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we will enable hash checks for git downloads soon, the hash check
for the custom git download should be disabled.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index aa19686..b5ee516 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -19,6 +19,7 @@ BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
 else ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y)
 ARM_TRUSTED_FIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL))
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
 else
 ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
 endif
