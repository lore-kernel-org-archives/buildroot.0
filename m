From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:18:26 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] arch/x86: adds
 BR2_X86_CPU_HAS_3DNOW flag
Message-ID: <20200716161642.F2FB186303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce313033079d1ba3545778ad11ca52fcc2221f19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Nicolas Robin <nrosfs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f6cd56b9ce3587c3e56eaa5a8e5f44d777c41e60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index eb655adbca..7aae3cafb7 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -1,6 +1,8 @@
 # i386/x86_64 cpu features
 config BR2_X86_CPU_HAS_MMX
 	bool
+config BR2_X86_CPU_HAS_3DNOW
+	bool
 config BR2_X86_CPU_HAS_SSE
 	bool
 config BR2_X86_CPU_HAS_SSE2
@@ -155,15 +157,18 @@ config BR2_x86_k6_2
 	bool "k6-2"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_athlon
 	bool "athlon"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_athlon_4
 	bool "athlon-4"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_opteron
 	bool "opteron"
 	select BR2_X86_CPU_HAS_MMX
@@ -209,6 +214,7 @@ config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_c32
 	bool "Via C3-2 (Nehemiah cores)"
 	depends on !BR2_x86_64
