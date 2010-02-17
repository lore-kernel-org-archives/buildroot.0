From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Feb 2010 12:03:56 +0100
Subject: [Buildroot] [git commit master] at91boostrap makefile,
	correct typo in line continuation character.
Message-ID: <20100217110441.7B6B9776C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6c9d3873c0cc9f55bf3f1ddd409d496734d9a158
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rule to copy the resulting binary file into the binary directory had
a typo in the line continuation character that results in a spurious error
message being produced.

Signed-off-by: Rob Alley <Rob.Alley@navmanwireless.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    4 ++++
 target/device/Atmel/at91bootstrap/at91bootstrap.mk |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 37bc22c..05cb4ae 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,6 +5,10 @@
 	Updated/fixed packages: alsa-lib, argus, at, gst-plugins-good,
 	libpcap, rsync, tcl, xproto_trapproto
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#1069: [PATCH] The AT91BOOTSTRAP makefile contains a typo
+
 2010.02-rc1, Released February 9th, 2010:
 
 	Fixes all over the tree and new features.
diff --git a/target/device/Atmel/at91bootstrap/at91bootstrap.mk b/target/device/Atmel/at91bootstrap/at91bootstrap.mk
index 32ed3e2..f681fa9 100644
--- a/target/device/Atmel/at91bootstrap/at91bootstrap.mk
+++ b/target/device/Atmel/at91bootstrap/at91bootstrap.mk
@@ -68,7 +68,7 @@ else
 	make MEMORY=$(AT91BOOTSTRAP_MEMORY) \
 		CROSS_COMPILE=$(TARGET_CROSS) \
 		-C $(AT91BOOTSTRAP_DIR) boot
-	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install || ??
+	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install || \
 		echo "Could not copy bootstrap to BINARIES_DIR"
 ifneq ($(BR2_TARGET_ATMEL_COPYTO),)
 	make DESTDIR=$(BR2_TARGET_ATMEL_COPYTO) -C $(AT91BOOTSTRAP_DIR) install || \
-- 
1.6.3.3
