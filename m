From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  6 Jul 2012 00:42:32 +0200
Subject: [Buildroot] [PATCH v4 1/5] target: add symbols for i386/x86_64 cpu
	features
In-Reply-To: <1341528156-4197-1-git-send-email-s.martin49@gmail.com>
References: <1341528156-4197-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1341528156-4197-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Selecting the target architecture variant automatically selects the
appropriated set of features.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/target/Config.in.arch b/target/Config.in.arch
index c9bbc12..590726a 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -325,6 +325,31 @@ endchoice
 # gcc builds libstdc++ differently depending on the
 # host tuplet given to it, so let people choose
 #
+
+# i386/x86_64 cpu features
+config BR2_X86_CPU_HAS_MMX
+	bool
+config BR2_X86_CPU_HAS_SSE
+	bool
+config BR2_X86_CPU_HAS_SSE2
+	bool
+config BR2_X86_CPU_HAS_SSE3
+	bool
+config BR2_X86_CPU_HAS_SSSE3
+	bool
+config BR2_X86_CPU_HAS_SSE41
+	bool
+config BR2_X86_CPU_HAS_SSE42
+	bool
+config BR2_X86_CPU_HAS_SSE4
+	bool
+config BR2_X86_CPU_HAS_SSE4A
+	bool
+config BR2_X86_CPU_HAS_3DNOW
+	bool
+config BR2_X86_CPU_HAS_ABM
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_i386
@@ -344,46 +369,106 @@ config BR2_x86_pentiumpro
 	bool "pentium pro"
 config BR2_x86_pentium_mmx
 	bool "pentium MMX"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_pentium_m
 	bool "pentium mobile"
 config BR2_x86_pentium2
 	bool "pentium2"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_pentium3
 	bool "pentium3"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
 config BR2_x86_pentium4
 	bool "pentium4"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
 config BR2_x86_prescott
 	bool "prescott"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_nocona
 	bool "nocona"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_core2
 	bool "core2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_atom
 	bool "atom"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_k6
 	bool "k6"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_k6_2
 	bool "k6-2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_athlon
 	bool "athlon"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_athlon_4
 	bool "athlon-4"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
+	select BR2_X86_CPU_HAS_SSE
 config BR2_x86_opteron
 	bool "opteron"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
 config BR2_x86_opteron_sse3
 	bool "opteron w/ SSE3"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_barcelona
 	bool "barcelona"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSE4A
+	select BR2_X86_CPU_HAS_ABM
 config BR2_x86_geode
 	bool "geode"
+	# Don't include MMX support because there several variant of geode
+	# processor, some with MMX support, some without.
+	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 config BR2_x86_c32
 	bool "Via C3-2 (Nehemiah cores)"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
 config BR2_x86_winchip_c6
 	bool "IDT Winchip C6"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_winchip2
 	bool "IDT Winchip 2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
 endchoice
 
 choice
@@ -397,16 +482,46 @@ config BR2_x86_64_generic
 	bool "generic"
 config BR2_x86_64_barcelona
 	bool "barcelona"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSE4A
+	select BR2_X86_CPU_HAS_ABM
 config BR2_x86_64_opteron_sse3
 	bool "opteron w/ sse3"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_64_opteron
 	bool "opteron"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
 config BR2_x86_64_nocona
 	bool "nocona"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_64_core2
 	bool "core2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_64_atom
 	bool "atom"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 endchoice
 
 choice
-- 
1.7.11.1
