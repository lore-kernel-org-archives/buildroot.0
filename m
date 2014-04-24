From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 15:21:13 +0200
Subject: [Buildroot] [git commit] toolchain: enable internal for aarch64
Message-ID: <20140424132247.E251D9C9C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97b25caecdd269033c8f39b2b865ea7b603367dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the internal toolchain backend for aarch64.
Tested with arm_foundationv8_defconfig and ARMs foundation v8 emulator.
Both glibc & eglibc work.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a1065ac..54b5d17 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -43,7 +43,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
