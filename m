From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Dec 2016 19:14:23 +0100
Subject: [Buildroot] [PATCH] package/jpeg: better indentation
Message-ID: <1481480063-1189-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use easier-to-read layout; fix leading spaces.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 8de45a3..a4a63cc 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -5,10 +5,11 @@ config BR2_PACKAGE_JPEG
 
 # jpeg-turbo has simd support for some architectures
 config BR2_PACKAGE_JPEG_SIMD_SUPPORT
-       bool
-       default y if BR2_X86_CPU_HAS_MMX || BR2_ARM_CPU_HAS_NEON || \
-		 BR2_POWERPC_CPU_HAS_ALTIVEC || \
-		 BR2_aarch64 || BR2_aarch64_be
+	bool
+	default y if BR2_X86_CPU_HAS_MMX
+	default y if BR2_ARM_CPU_HAS_NEON
+	default y if BR2_POWERPC_CPU_HAS_ALTIVEC
+	default y if BR2_aarch64 || BR2_aarch64_be
 
 if BR2_PACKAGE_JPEG
 
-- 
2.7.4
