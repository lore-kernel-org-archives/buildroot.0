From: Esben Haabendal <esben@geanix.com>
Date: Tue, 11 Jun 2019 10:44:09 +0200
Subject: [Buildroot] [PATCH v2 1/2] arch: Add support for Westmere targets
Message-ID: <20190611084410.4422-1-esben@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The westmere line of x86_64 targets lies between nehalem (corei7) and
sandybridge (corei7-avx).  Allowing use of -march=westmere enables use of
AES instruction set on these targets.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 arch/Config.in.x86 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 3f6983ac1b63..eb655adbca24 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -101,6 +101,15 @@ config BR2_x86_corei7
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+config BR2_x86_westmere
+	bool "westmere"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_corei7_avx
 	bool "corei7-avx"
 	select BR2_X86_CPU_HAS_MMX
@@ -235,6 +244,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_nocona && BR2_i386
 	default "i686"		if BR2_x86_core2 && BR2_i386
 	default "i686"		if BR2_x86_corei7 && BR2_i386
+	default "i686"		if BR2_x86_westmere && BR2_i386
 	default "i686"		if BR2_x86_corei7_avx && BR2_i386
 	default "i686"		if BR2_x86_core_avx2 && BR2_i386
 	default "i686"		if BR2_x86_atom && BR2_i386
@@ -271,6 +281,7 @@ config BR2_GCC_TARGET_ARCH
 	default "corei7-avx"	if BR2_x86_corei7_avx
 	default "core-avx2"	if BR2_x86_core_avx2
 	default "atom"		if BR2_x86_atom
+	default "westmere"	if BR2_x86_westmere
 	default "silvermont"	if BR2_x86_silvermont
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
-- 
2.21.0
