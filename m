From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 10:57:55 +0200
Subject: [Buildroot] [git commit] toolchain: drop the now-unused old
	BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
Message-ID: <20140818090640.142239D4A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6172ceb3cf779fb66aba01dee7a49184f7790c20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's now been replaced with BR2_ARCH_HAS_ATOMICS, annd all packages have
been changed to use that instead.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in                |    1 -
 toolchain/toolchain-common.in |    3 ---
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 5cee0d7..6bcafd4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -254,7 +254,6 @@ config BR2_GCC_TARGET_MODE
 config BR2_ARCH_HAS_ATOMICS
 	bool
 	default y if !BR2_arc
-	select BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 
 # Set up target binary format
 choice
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 2fa4f61..82ac26a 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -44,9 +44,6 @@ config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 config BR2_TOOLCHAIN_HAS_SSP
 	bool
 
-config BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
-	bool
-
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
