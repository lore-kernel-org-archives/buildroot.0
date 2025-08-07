Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF3BC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EDCF80C51;
	Thu,  7 Aug 2025 17:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udsdY35o-dsb; Thu,  7 Aug 2025 17:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5148580C5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5148580C5D;
	Thu,  7 Aug 2025 17:01:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0377C31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B261B80BE1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUjjX7rJPj_Z for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC4A780C29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC4A780C29
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAAE282AE0; Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:52:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cd1a23727f83f7f19f71fe10cc74ed287696c226
X-Git-Newrev: 3f87cfca26c0b3c4ac594ec73a273a0c2a8a68f1
X-Patchwork-Hint: ignore
Message-Id: <20250807170022.AAAE282AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gcc: update to
 13.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f87cfca26c0b3c4ac594ec73a273a0c2a8a68f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release announcement:
https://gcc.gnu.org/pipermail/gcc-announce/2025/000187.html

Changelog:
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=13.4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
[Julien: fix check-package error by fixing .checkpackageignore entry]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0b8b72d2fe2c8fa6a9d2859ceb8d29b6389cf894)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                                   | 2 +-
 .../0001-disable-split-stack-for-non-thread-builds.patch              | 0
 .../0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch                  | 0
 .../0003-Remove-crypt-and-crypt_r-interceptors.patch                  | 0
 package/gcc/Config.in.host                                            | 2 +-
 package/gcc/gcc.hash                                                  | 4 ++--
 6 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8d2de48d32..42594dace2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -478,7 +478,7 @@ package/fwts/0001-build-do-not-use-Werror.patch lib_patch.Upstream
 package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch lib_patch.Upstream
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
-package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
diff --git a/package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
similarity index 100%
rename from package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
rename to package/gcc/13.4.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
diff --git a/package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
similarity index 100%
rename from package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
rename to package/gcc/13.4.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4623b20b45..1cbfaad59b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -74,7 +74,7 @@ config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "12.4.0"    if BR2_GCC_VERSION_12_X
-	default "13.3.0"    if BR2_GCC_VERSION_13_X
+	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.2.0"    if BR2_GCC_VERSION_14_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 08e7b28700..0da5cd26e8 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -2,8 +2,8 @@
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.4.0/sha512.sum
 sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
-sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
+sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.2.0/sha512.sum
 sha512  932bdef0cda94bacedf452ab17f103c0cb511ff2cec55e9112fc0328cbf1d803b42595728ea7b200e0a057c03e85626f937012e49a7515bc5dd256b2bf4bc396  gcc-14.2.0.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
