Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48B9C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D82E4038E;
	Thu,  7 Aug 2025 17:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31WHpS8a5kRi; Thu,  7 Aug 2025 17:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890CE4048F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 890CE4048F;
	Thu,  7 Aug 2025 17:01:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1317E233
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE44980C10
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHmLAZ1kPKcE for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF9FD80C3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF9FD80C3E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC5A286C99; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 12:18:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d0d834372957b35efc862667c058683fabaa47c2
X-Git-Newrev: d4c8beb62d8f1a166abad720fa980fcf790de88b
X-Patchwork-Hint: ignore
Message-Id: <20250807170023.DC5A286C99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gcc: drop stale
 13.3.0 patches
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4c8beb62d8f1a166abad720fa980fcf790de88b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit 0b8b72d2fe2c8fa6a9d2859ceb8d29b6389cf894 bumped gcc 13.x from
13.3.0 to 13.4.0 but forgot to drop the gcc 13.3.0, so let's remove
those patches.

Cc: Kadambini Nema <kadambini.nema@gmail.com>
Fixes: 0b8b72d2fe2c8fa6a9d2859ceb8d29b6389cf894
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2fbf98da7c393ded3032c7fef95385653f96eddc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ..._BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 44 ------------------
 ...r-also-undef-_TIME_BITS-in-sanitizer_proc.patch | 53 ----------------------
 2 files changed, 97 deletions(-)

diff --git a/package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
deleted file mode 100644
index a3be0914b9..0000000000
--- a/package/gcc/13.3.0/0004-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 88b73eedcfa0fc58aee2555377e6f7d4de153282 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Feb 2023 11:48:35 -0800
-Subject: [PATCH] Undef _TIME_BITS along with _FILE_OFFSET_BITS on Linux
-
-On 32-bit glibc>=2.34 systems using 64bit time_t build fails because
-_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
-
-Fixes
-
-```
-/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
- only with _FILE_OFFSET_BITS=64"
-| #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-|     ^
-| 1 error generated.
-```
-
-Reviewed By: thesamesam, MaskRay
-
-Differential Revision: https://reviews.llvm.org/D140812
-
-Upstream: https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d53b3d94aaf211ffb2159614f5aaaf03ceb861cc
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- .../sanitizer_common/sanitizer_platform_limits_posix.cpp         | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index bcbd143d19d..1b23898b374 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -18,6 +18,7 @@
- // depends on _FILE_OFFSET_BITS setting.
- // To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
- #undef _FILE_OFFSET_BITS
-+#undef _TIME_BITS
- #endif
- 
- // Must go after undef _FILE_OFFSET_BITS.
--- 
-2.45.2
-
diff --git a/package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
deleted file mode 100644
index 73b09ac389..0000000000
--- a/package/gcc/13.3.0/0005-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 7ad54084a2c07cca6d03dfe274893e903852d359 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 18 Jul 2024 23:13:41 +0200
-Subject: [PATCH] libsanitizer: also undef _TIME_BITS in
- sanitizer_procmaps_solaris.cpp
-
-Upstream commit
-https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
-of LLVM added a #undef _TIME_BITS in
-libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
-fix the build on 32-bit Linux platforms that have enabled 64-bit
-time_t using _TIME_BITS=64.
-
-Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
-sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
-including any header file. To fix this, the upstream fix was to also
-undef _TIME_BITS.
-
-This commit simply does the same in sanitizer_procmaps_solaris.cpp,
-which also gets compiled under Linux (despite what the file name
-says). In practice on Linux hosts (where _TIME_BITS=64 matters),
-sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
-the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
-the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
-before including sanitizer_platform.h, which will set the
-SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
-
-Fixes:
-
-armeb-buildroot-linux-gnueabi/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-
-Upstream: https://gcc.gnu.org/pipermail/gcc-patches/2024-July/657811.html
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
-index eeb49e2afe3..1b23fd4d512 100644
---- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
-@@ -11,6 +11,7 @@
- 
- // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
- #undef _FILE_OFFSET_BITS
-+#undef _TIME_BITS
- #include "sanitizer_platform.h"
- #if SANITIZER_SOLARIS
- #  include <fcntl.h>
--- 
-2.45.2
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
