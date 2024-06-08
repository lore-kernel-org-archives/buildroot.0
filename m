Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55897C27C5F
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EDF784695;
	Sat,  8 Jun 2024 19:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mndxflnE5UXR; Sat,  8 Jun 2024 19:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6358F847ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6358F847ED;
	Sat,  8 Jun 2024 19:15:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D3D31BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDAC2846C5
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BB7CuSG2A24 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01A30846BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01A30846BD
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F06EB814F1; Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 19:04:38 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b89394cb629eb123af24765f1b20adba4a10ade2
X-Git-Newrev: 5d9c54de0c48be3a616db5e3c2f6c7112ff635bf
X-Patchwork-Hint: ignore
Message-Id: <20240608191459.F06EB814F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gcc: update to
 13.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d9c54de0c48be3a616db5e3c2f6c7112ff635bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

See here for changes made to this release:
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=13.3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f3b2f0f9859b4bcb422d69437ecb01ee9038d3c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                   | 2 +-
 .../0001-disable-split-stack-for-non-thread-builds.patch              | 0
 .../0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch                  | 0
 package/gcc/Config.in.host                                            | 2 +-
 package/gcc/gcc.hash                                                  | 4 ++--
 5 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b3d2d6d8d5..d7681a4db6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -422,7 +422,7 @@ package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch Upstream
 package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstream
 package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
-package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
+package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch Upstream
diff --git a/package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
similarity index 100%
rename from package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
rename to package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d294e8da30..8efea378fb 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -78,7 +78,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "11.4.0"    if BR2_GCC_VERSION_11_X
 	default "12.3.0"    if BR2_GCC_VERSION_12_X
-	default "13.2.0"    if BR2_GCC_VERSION_13_X
+	default "13.3.0"    if BR2_GCC_VERSION_13_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 5061a603bc..964fbc97df 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,8 +6,8 @@ sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3c
 sha512  a5018bf1f1fa25ddf33f46e720675d261987763db48e7a5fdf4c26d3150a8abcb82fdc413402df1c32f2e6b057d9bae6bdfa026defc4030e10144a8532e60f14  gcc-11.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
 sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.2.0/sha512.sum
-sha512  d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b789e1232a34a20be1a0b60097de9280efe47bdb71c73251e30b0862a2  gcc-13.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
+sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  4dca20f517a42bb027fec605965b09fb917a535eebf3fe3e811d93476b02b1962df5ad4665f117bd44c2ec8e8015d51a44c00591761fe5f259c201ac5c7d920f  gcc-arc-2023.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
