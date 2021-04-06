From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 11:46:09 +0200
Subject: [Buildroot] [git commit] boot/shim: re-enable on ARM32
Message-ID: <20210406092135.CD70B82ABC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1988ebd36c6073ef18dc032ec4e09b7d8e622782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

shim 15.4 builds just fine on ARM32.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/shim/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/boot/shim/Config.in b/boot/shim/Config.in
index 596ff5b2cf..2f74d6f332 100644
--- a/boot/shim/Config.in
+++ b/boot/shim/Config.in
@@ -2,8 +2,6 @@ config BR2_TARGET_SHIM
 	bool "shim"
 	# it includes gnu-efi
 	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
-	# ARM32 build currently broken
-	depends on !BR2_ARM_CPU_HAS_ARM
 	help
 	  Boot loader to chain-load signed boot loaders under Secure
 	  Boot.
