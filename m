From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:17:36 +0100
Subject: [Buildroot] [git commit] arch/arm: only expose EABIhf when the CPU
	*has* a VFP unit
Message-ID: <20151227112454.69EA381917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b08723087d2a3ae08b437ccac5bc954ae2f47ac8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's no point in offering the user an option to select EABIhf when
the CPU does not really have a VFP unit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index f2c5a58..d63a26c 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -238,7 +238,7 @@ config BR2_ARM_EABI
 
 config BR2_ARM_EABIHF
 	bool "EABIhf"
-	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2
+	depends on BR2_ARM_CPU_HAS_VFPV2
 	help
 	  The EABIhf is an extension of EABI which supports the 'hard'
 	  floating point model. This model uses the floating point
