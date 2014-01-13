From: Adrien =?utf-8?Q?B=C3=A9raud?= <adrien.beraud@savoirfairelinux.com>
Date: Mon, 13 Jan 2014 11:37:37 -0500 (EST)
Subject: [Buildroot] [PATCH] arch: add support for "jaguar" AMD CPU
 optimisations.
In-Reply-To: <1368377135.187677.1389630463088.JavaMail.root@mail>
Message-ID: <1818192605.238804.1389631057174.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AMD Jaguar ( https://en.wikipedia.org/wiki/Jaguar_%28microarchitecture%29 ) is suddenly 
a popular architecture since it is used in the PS4 and the XBox One.
Many embedded systems are also likely to use it in the next years.

This patch adds support for GCC architecture-specific optimizations and tuning for these CPUs.

Signed-off-by: Adrien Beraud <adrien.beraud@savoirfairelinux.com>
---
 arch/Config.in.x86 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ce30605..1884251 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -120,6 +120,13 @@ config BR2_x86_barcelona
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+config BR2_x86_jaguar
+	bool "jaguar"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_geode
 	bool "geode"
 	# Don't include MMX support because there several variant of geode
@@ -168,6 +175,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_opteron && BR2_i386
 	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
 	default "i686"		if BR2_x86_barcelona && BR2_i386
+	default "i686"		if BR2_x86_jaguar && BR2_i386
 	default "i686"		if BR2_x86_k6
 	default "i686"		if BR2_x86_k6_2
 	default "i686"		if BR2_x86_athlon
@@ -196,6 +204,7 @@ config BR2_GCC_TARGET_TUNE
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver2"	if BR2_x86_jaguar
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
@@ -225,6 +234,7 @@ config BR2_GCC_TARGET_ARCH
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver2"	if BR2_x86_jaguar
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
-- 
1.8.5.2
