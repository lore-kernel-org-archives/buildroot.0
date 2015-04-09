From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:34:14 +0200
Subject: [Buildroot] [git commit] arch: add core-avx2
Message-ID: <20150409213424.986627FBC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f92e6219cf7b08adb3b621c4686528a327a16e86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.x86 |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 9767bc1..43f6abc 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -15,6 +15,8 @@ config BR2_X86_CPU_HAS_SSE42
 	bool
 config BR2_X86_CPU_HAS_AVX
 	bool
+config BR2_X86_CPU_HAS_AVX2
+	bool
 
 choice
 	prompt "Target Architecture Variant"
@@ -101,6 +103,17 @@ config BR2_x86_corei7_avx
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
+config BR2_x86_core_avx2
+	bool "core-avx2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
 config BR2_x86_atom
 	bool "atom"
 	select BR2_X86_CPU_HAS_MMX
@@ -239,6 +252,7 @@ config BR2_GCC_TARGET_ARCH
 	default "core2"		if BR2_x86_core2
 	default "corei7"	if BR2_x86_corei7
 	default "corei7-avx"	if BR2_x86_corei7_avx
+	default "core-avx2"	if BR2_x86_core_avx2
 	default "atom"		if BR2_x86_atom
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
