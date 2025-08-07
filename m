Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA30FC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22826068C;
	Thu,  7 Aug 2025 17:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGxpgmWuDyeR; Thu,  7 Aug 2025 17:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2C806068D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C806068D;
	Thu,  7 Aug 2025 17:20:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D44B4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98B0540099
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CmyBNh-d5ws for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AA24400AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AA24400AC
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7905985C8D; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:09:38 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 1d299888fe8fb27824c76e00b81e7b0df0f3fd36
X-Git-Newrev: 5d3485b24edd0852a704cba088b5e1ba02612629
X-Patchwork-Hint: ignore
Message-Id: <20250807171916.7905985C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/gcc: update to
 14.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d3485b24edd0852a704cba088b5e1ba02612629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Release announcement:
https://gcc.gnu.org/pipermail/gcc-announce/2025/000186.html

List of bugs which were resolved in 14.3.0:
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=14.3

Drop upstream patch 0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
https://gcc.gnu.org/cgit/gcc/commit/?id=3fe5720430a9ba61ed7562aac4d758cc77d49a28

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
[Julien:
 - rebase on branch next
 - fix patch 0003 upstream merge URL
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e9227311d9a63c9a829316e2ffb91cb70ed127f1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  2 +-
 ...-Fix-up-libquadmath-math-sqrtq.c-compilat.patch | 57 ----------------------
 ...disable-split-stack-for-non-thread-builds.patch |  0
 ...r-also-undef-_TIME_BITS-in-sanitizer_proc.patch |  0
 package/gcc/Config.in.host                         |  2 +-
 package/gcc/gcc.hash                               |  4 +-
 6 files changed, 4 insertions(+), 61 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5536f3c3ee..0ad81f3bd6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -476,7 +476,7 @@ package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch li
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
-package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
diff --git a/package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch b/package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
deleted file mode 100644
index b6ed2ffed8..0000000000
--- a/package/gcc/14.2.0/0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From ba9356565695728ce0c852f7de3de27f8745611d Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Sat, 3 Aug 2024 20:37:54 +0200
-Subject: [PATCH] libquadmath: Fix up libquadmath/math/sqrtq.c compilation in
- some powerpc* configurations [PR116007]
-
-My PR114623 change started using soft-fp.h and quad.h for the sqrtq implementation.
-Unfortunately, that seems to fail building in some powerpc* configurations, where
-TFmode isn't available.
-quad.h has:
- #ifndef TFtype
- typedef float TFtype __attribute__ ((mode (TF)));
- #endif
-and uses TFtype.  quad.h has:
- /* Define the complex type corresponding to __float128
-    ("_Complex __float128" is not allowed) */
- #if (!defined(_ARCH_PPC)) || defined(__LONG_DOUBLE_IEEE128__)
- typedef _Complex float __attribute__((mode(TC))) __complex128;
- #else
- typedef _Complex float __attribute__((mode(KC))) __complex128;
- #endif
-with the conditional and KCmode use added during porting of libquadmath
-to powerpc*, so I've just defined TFtype for powerpc when __LONG_DOUBLE_IEEE128__
-isn't defined; I could define it to float __attribute__ ((mode (KF))) but it
-seemed easier to just define it to __float128 which should do the same thing.
-
-2024-08-03  Jakub Jelinek  <jakub@redhat.com>
-
-	PR target/116007
-	* math/sqrtq.c (TFtype): For PowerPC without __LONG_DOUBLE_IEEE128__
-	define to __float128 before including soft-fp.h and quad.h.
-
-(cherry picked from commit 3ac02e67503ccffa3dfeeffc0a60fce6bdaca43b)
-Upstream: https://gcc.gnu.org/g:3ac02e67503ccffa3dfeeffc0a60fce6bdaca43b
-Upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116007
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libquadmath/math/sqrtq.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libquadmath/math/sqrtq.c b/libquadmath/math/sqrtq.c
-index 8ca2828d42c..a58998a0667 100644
---- a/libquadmath/math/sqrtq.c
-+++ b/libquadmath/math/sqrtq.c
-@@ -9,6 +9,9 @@
-     && defined(FE_TOWARDZERO) \
-     && defined(FE_INEXACT)
- #define USE_SOFT_FP 1
-+#if defined(_ARCH_PPC) && !defined(__LONG_DOUBLE_IEEE128__)
-+#define TFtype __float128
-+#endif
- #include "../../libgcc/soft-fp/soft-fp.h"
- #include "../../libgcc/soft-fp/quad.h"
- #endif
--- 
-2.46.0
-
diff --git a/package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/14.2.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
similarity index 100%
rename from package/gcc/14.2.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
rename to package/gcc/14.3.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1cbfaad59b..ebd6e073c0 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -75,7 +75,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "12.4.0"    if BR2_GCC_VERSION_12_X
 	default "13.4.0"    if BR2_GCC_VERSION_13_X
-	default "14.2.0"    if BR2_GCC_VERSION_14_X
+	default "14.3.0"    if BR2_GCC_VERSION_14_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 0da5cd26e8..168c6643ce 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
 sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.2.0/sha512.sum
-sha512  932bdef0cda94bacedf452ab17f103c0cb511ff2cec55e9112fc0328cbf1d803b42595728ea7b200e0a057c03e85626f937012e49a7515bc5dd256b2bf4bc396  gcc-14.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
+sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  4dca20f517a42bb027fec605965b09fb917a535eebf3fe3e811d93476b02b1962df5ad4665f117bd44c2ec8e8015d51a44c00591761fe5f259c201ac5c7d920f  gcc-arc-2023.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
