From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 13:05:16 +0100
Subject: [Buildroot] [git commit] arch: add Atom CPUs as Silvermont
 Architecture target
Message-ID: <20180101120521.885418393B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1eecd462ae052cbb056de2d89419f445c4cbd4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old Atom target is not really fitting for recent Atom CPUs based
on Silvermont, Airmont or Goldmont. Those have more in common with
older Desktop CPUs than old Atoms.

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.x86         | 11 +++++++++++
 package/openblas/Config.in |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 0d9e93b..8e623b3 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -129,6 +129,15 @@ config BR2_x86_atom
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+config BR2_x86_silvermont
+	bool "silvermont"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_k6
 	bool "k6"
 	select BR2_X86_CPU_HAS_MMX
@@ -229,6 +238,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_corei7_avx && BR2_i386
 	default "i686"		if BR2_x86_corei7_avx2 && BR2_i386
 	default "i686"		if BR2_x86_atom && BR2_i386
+	default "i686"		if BR2_x86_silvermont && BR2_i386
 	default "i686"		if BR2_x86_opteron && BR2_i386
 	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
 	default "i686"		if BR2_x86_barcelona && BR2_i386
@@ -261,6 +271,7 @@ config BR2_GCC_TARGET_ARCH
 	default "corei7-avx"	if BR2_x86_corei7_avx
 	default "core-avx2"	if BR2_x86_core_avx2
 	default "atom"		if BR2_x86_atom
+	default "silvermont"	if BR2_x86_silvermont
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index bc62896..eb93e31 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PRESCOTT"     if BR2_x86_prescott
 	default "BANIAS"       if BR2_x86_pentium_m
 	default "CORE2"        if BR2_x86_core2
-	default "NEHALEM"      if BR2_x86_corei7
+	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont
 	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
 	default "HASWELL"      if BR2_x86_core_avx2
 	default "ATOM"         if BR2_x86_atom
