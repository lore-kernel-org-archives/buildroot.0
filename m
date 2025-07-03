Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2706FC83F0B
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4BEA83D5D;
	Fri,  4 Jul 2025 06:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVFml1FXu0_I; Fri,  4 Jul 2025 06:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E580C83D5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E580C83D5C;
	Fri,  4 Jul 2025 06:21:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B73FB0A
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9403083CC9
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_X_kX7Qyujs for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34EA783CCD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34EA783CCD
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1203285CB9; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 09:11:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 291415ced9c9f76a068ce23244a086d5758c84bd
X-Git-Newrev: 5c1230a90bca234259f0496fa1bb9c84d0c5edff
X-Patchwork-Hint: ignore
Message-Id: <20250704062126.1203285CB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mpv: remove stale
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c1230a90bca234259f0496fa1bb9c84d0c5edff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Buildroot commit 8f69974c20fbc7dc642be62a0ef3fb2941f5bb35 switched the
buildsystem of mpv from waf to meson but forgot to remove a patch which
fixed a waf-related build error.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 942b88e693e27c8ab39dc3e9931aa9d6909a3c7e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                          |  1 -
 package/mpv/0001-fix-powerpc64-altivec.patch | 32 ----------------------------
 2 files changed, 33 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fc682e5105..25ea61a43e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -826,7 +826,6 @@ package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch l
 package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
-package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
 package/mrouted/S41mrouted NotExecutable
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
diff --git a/package/mpv/0001-fix-powerpc64-altivec.patch b/package/mpv/0001-fix-powerpc64-altivec.patch
deleted file mode 100644
index 45983fec8f..0000000000
--- a/package/mpv/0001-fix-powerpc64-altivec.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH] Work around bool type redefinition by altivec
-
-On powerpc64le, the SDL header may include altivec.h and this
-(combined with -std=c99) will cause a compile failure due to bool
-being redefined as a vector type.
-
-Adjust the compiler flags to add -std=gnu99 (which is compatible with
-altivec) when using gcc. The generic flag '-std=c99' is left in place for other
-compilers (in the gcc case it is overridden by the (later) gnu flag).
-
-Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
----
- waftools/detections/compiler.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/waftools/detections/compiler.py b/waftools/detections/compiler.py
-index 5bbba87..50836a2 100644
---- a/waftools/detections/compiler.py
-+++ b/waftools/detections/compiler.py
-@@ -43,7 +43,8 @@ def __add_gcc_flags__(ctx):
-                        "-Wno-switch", "-Wparentheses", "-Wpointer-arith",
-                        "-Wno-pointer-sign",
-                        # GCC bug 66425
--                       "-Wno-unused-result"]
-+                       "-Wno-unused-result",
-+                       "-std=gnu99"]
- 
- def __add_clang_flags__(ctx):
-     ctx.env.CFLAGS += ["-Wno-logical-op-parentheses", "-fcolor-diagnostics",
--- 
-2.10.0.297.gf6727b0
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
