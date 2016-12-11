From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Dec 2016 16:52:18 +0100
Subject: [Buildroot] [PATCH 3/4] jpeg-turbo: add simd support for powerpc
	cores with altivec
In-Reply-To: <20161211155219.22814-1-peter@korsgaard.com>
References: <20161211155219.22814-1-peter@korsgaard.com>
Message-ID: <20161211155219.22814-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the 1.5-b1 release notes:

Added full SIMD acceleration for PowerPC platforms using AltiVec VMX
(128-bit SIMD) instructions.  Although the performance of libjpeg-turbo on
PowerPC was already good, due to the increased number of registers available
to the compiler vs.  x86, it was still possible to speed up compression by
about 3-4x and decompression by about 2-2.5x (relative to libjpeg v6b)
through the use of AltiVec instructions.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 170e58c..926f12e 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -6,7 +6,8 @@ config BR2_PACKAGE_JPEG
 # jpeg-turbo has simd support for some architectures
 config BR2_PACKAGE_JPEG_SIMD_SUPPORT
        bool
-       default y if BR2_X86_CPU_HAS_MMX || BR2_ARM_CPU_HAS_NEON
+       default y if BR2_X86_CPU_HAS_MMX || BR2_ARM_CPU_HAS_NEON || \
+       	       	 BR2_POWERPC_CPU_HAS_ALTIVEC
 
 if BR2_PACKAGE_JPEG
 
-- 
2.10.2
