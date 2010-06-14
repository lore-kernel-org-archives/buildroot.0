From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: fix
	AT91BOOTSTRAP_BINARY
Message-ID: <20100614203443.30323804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=793f5faa3384146beda496fad75ddb15e2ee5a93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use AT91BOOTSTRAP_BOARD instead of BOARD_NAME. Remove
AT91BOOTSTRAP_VERSION from the final binary image name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index fc7206e..9030696 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -12,13 +12,9 @@ AT91BOOTSTRAP:=$(call qstrip,$(BR2_AT91BOOTSTRAP))
 AT91BOOTSTRAP_ZCAT:=$(BZCAT)
 
 AT91BOOTSTRAP_BOARD:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
-
 AT91BOOTSTRAP_MEMORY:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
-
-AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_VERSION).bin
-
+AT91BOOTSTRAP_BINARY:=$(AT91BOOTSTRAP_BOARD)-$(AT91BOOTSTRAP_MEMORY)boot.bin
 AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_DIR)/binaries/$(AT91BOOTSTRAP_BINARY)
-
 AT91BOOTSTRAP_JUMP_ADDR:=$(call qstrip,$(BR2_AT91BOOTSTRAP_JUMP_ADDR))
 AT91BOOTSTRAP_IMG_SIZE:=$(call qstrip,$(BR2_AT91BOOTSTRAP_IMG_SIZE))
 
-- 
1.7.1
