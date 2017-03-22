From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:05:54 +0100
Subject: [Buildroot] [git commit] arch/Config.in.arc: fix
	BR2_READELF_ARCH_NAME
Message-ID: <20170322211342.ADE398226E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69f57593ac775d07b83230b8d309b69cbcfcf316
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On ARC, depending on the CPU selected, the ELF machine number might be
different. Take this into account when defining BR2_READELF_ARCH_NAME.

Fixes:

   http://autobuild.buildroot.net/results/0a1957056e07cedc4839439c0ea8ebd1f646b904/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index dcdba68..840d472 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -39,7 +39,8 @@ config BR2_GCC_TARGET_CPU
 	default "archs"	 if BR2_archs38
 
 config BR2_READELF_ARCH_NAME
-	default "ARCv2"
+	default "ARCompact" 	if BR2_arc750d || BR2_arc770d
+	default "ARCv2"		if BR2_archs38
 
 choice
 	prompt "MMU Page Size"
