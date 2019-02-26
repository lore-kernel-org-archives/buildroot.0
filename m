From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Feb 2019 14:48:45 +0100
Subject: [Buildroot] [git commit] package/cryptopp: fix dos/unix newlines in
 patch
Message-ID: <20190226134915.0434082A01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b2fff01c0ec98f538632d14da82a9a295319560
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/0a26265961747600388258d32ba7dc9226c9249b/

Commit 40005b9a0da6 (package/cryptopp: fix build with gcc < 4.9) added a
patch to fix building with old toolchains.  The source code unfortunately
contains a mix of DOS and UNIX newlines, and the DOS new lines got stripped
by the mailing list, causing the patch to no longer apply.

Fix up the patch manually.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch b/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch
index fd8b3c5ff2..7f93bceacf 100644
--- a/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch
+++ b/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch
@@ -27,14 +27,14 @@ index eccba009..4516d2b3 100644
 --- a/config.h
 +++ b/config.h
 @@ -591,7 +591,7 @@ NAMESPACE_END
- // Requires Binutils 2.24
- #if !defined(CRYPTOPP_DISABLE_AVX2) && defined(CRYPTOPP_AVX_AVAILABLE) && \
- 	(defined(__AVX2__) || (CRYPTOPP_MSC_VERSION >= 1800) || (__SUNPRO_CC >= 0x5130) || \
--	(CRYPTOPP_GCC_VERSION >= 40700) || (__INTEL_COMPILER >= 1400) || \
-+	(CRYPTOPP_GCC_VERSION >= 40900) || (__INTEL_COMPILER >= 1400) || \
- 	(CRYPTOPP_LLVM_CLANG_VERSION >= 30100) || (CRYPTOPP_APPLE_CLANG_VERSION >= 40600))
- #define CRYPTOPP_AVX2_AVAILABLE 1
- #endif
+ // Requires Binutils 2.24
+ #if !defined(CRYPTOPP_DISABLE_AVX2) && defined(CRYPTOPP_AVX_AVAILABLE) && \
+ 	(defined(__AVX2__) || (CRYPTOPP_MSC_VERSION >= 1800) || (__SUNPRO_CC >= 0x5130) || \
+-	(CRYPTOPP_GCC_VERSION >= 40700) || (__INTEL_COMPILER >= 1400) || \
++	(CRYPTOPP_GCC_VERSION >= 40900) || (__INTEL_COMPILER >= 1400) || \
+ 	(CRYPTOPP_LLVM_CLANG_VERSION >= 30100) || (CRYPTOPP_APPLE_CLANG_VERSION >= 40600))
+ #define CRYPTOPP_AVX2_AVAILABLE 1
+ #endif
 -- 
 2.14.1
 
