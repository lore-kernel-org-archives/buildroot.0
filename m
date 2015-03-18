From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 15:01:08 -0700
Subject: [Buildroot] [PATCH 1/3] arch: add corei7-avx
Message-ID: <1426716071-27570-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 arch/Config.in.x86 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index d5788b1..9767bc1 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -13,6 +13,8 @@ config BR2_X86_CPU_HAS_SSE4
 	bool
 config BR2_X86_CPU_HAS_SSE42
 	bool
+config BR2_X86_CPU_HAS_AVX
+	bool
 
 choice
 	prompt "Target Architecture Variant"
@@ -89,6 +91,16 @@ config BR2_x86_corei7
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+config BR2_x86_corei7_avx
+	bool "corei7-avx"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
 config BR2_x86_atom
 	bool "atom"
 	select BR2_X86_CPU_HAS_MMX
@@ -226,6 +238,7 @@ config BR2_GCC_TARGET_ARCH
 	default "nocona"	if BR2_x86_nocona
 	default "core2"		if BR2_x86_core2
 	default "corei7"	if BR2_x86_corei7
+	default "corei7-avx"	if BR2_x86_corei7_avx
 	default "atom"		if BR2_x86_atom
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
-- 
2.3.3
