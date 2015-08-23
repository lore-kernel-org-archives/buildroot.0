From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2015 00:43:12 +0200
Subject: [Buildroot] [git commit] arch/arm: add missing arm1136j-s variant
Message-ID: <20150823224543.2CC1F7FD02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7deaa277fd4c89c67de39ea21b4cd081ab85366f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Identical to arm1136jf-s, except that is doesn't have a vfp unit.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 9aa23a3..4d10f4c 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -78,6 +78,12 @@ config BR2_arm926t
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_arm1136j_s
+	bool "arm1136j-s"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV6
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1136jf_s
 	bool "arm1136jf-s"
 	select BR2_ARM_CPU_HAS_ARM
