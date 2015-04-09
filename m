From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:34:08 +0200
Subject: [Buildroot] [git commit] arch: add corei7-avx
Message-ID: <20150409213424.8E66A7FBC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c060425f67e9e7399fb38c50ea2ec24fff8f26b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.x86 |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

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
