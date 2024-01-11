Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33252C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 11:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 574BD41E1E;
	Thu, 11 Jan 2024 11:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 574BD41E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OUjHkttYOBf; Thu, 11 Jan 2024 11:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33DC2421FC;
	Thu, 11 Jan 2024 11:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33DC2421FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D9DA1BF990
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E75BA83EF9
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E75BA83EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlCyzzF20JbC for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 11:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFDFC83EFD
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 11:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDFC83EFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDF4385E8E; Thu, 11 Jan 2024 11:40:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 12:00:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fbd3d85745fdf32dac06355e9c524270ae034bb
X-Git-Newrev: 529b62f261ce01b347759d9516bf0852d968f751
X-Patchwork-Hint: ignore
Message-Id: <20240111114057.DDF4385E8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ripgrep: bump to version 14.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=529b62f261ce01b347759d9516bf0852d968f751
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md

The patch has been rebased to ripgrep 14.1.0.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...loc-allocator-behind-a-cargo-feature-flag.patch | 52 +++++++++++-----------
 package/ripgrep/ripgrep.hash                       |  2 +-
 package/ripgrep/ripgrep.mk                         |  6 +--
 3 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
index e2ba68f389..e665a6570e 100644
--- a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
+++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
@@ -1,4 +1,4 @@
-From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
+From 77f850969433b14769ade4281899373f3ebabf86 Mon Sep 17 00:00:00 2001
 From: Jonathan Stites <mail@jonstites.com>
 Date: Wed, 6 May 2020 12:55:35 +0000
 Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
@@ -9,6 +9,8 @@ Moves jemalloc behind a feature for musl builds, where it is not
 supported by the upstream project, so ripgrep will fail to build.
 
 Signed-off-by: Sam Voss <sam.voss@gmail.com>
+[Antoine: update for 14.1.0]
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
 ---
  .github/workflows/ci.yml      | 6 ++++++
  .github/workflows/release.yml | 8 +++++++-
@@ -18,10 +20,10 @@ Signed-off-by: Sam Voss <sam.voss@gmail.com>
  5 files changed, 35 insertions(+), 4 deletions(-)
 
 diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
-index ab154ec..aa567d9 100644
+index d21b85a..0c9ecb9 100644
 --- a/.github/workflows/ci.yml
 +++ b/.github/workflows/ci.yml
-@@ -149,6 +149,12 @@ jobs:
+@@ -172,6 +172,12 @@ jobs:
        if: matrix.target != ''
        run: ${{ env.CARGO }} test --verbose --workspace ${{ env.TARGET_FLAGS }}
  
@@ -31,14 +33,14 @@ index ab154ec..aa567d9 100644
 +      if: matrix.os == 'nightly-musl'
 +      run: ${{ env.CARGO }} test --verbose --all --features jemalloc ${{ env.TARGET_FLAGS }}
 +
-     - name: Test for existence of build artifacts (Windows)
-       if: matrix.os == 'windows-2019'
-       shell: bash
+     - name: Test zsh shell completions (Unix, sans cross)
+       # We could test this when using Cross, but we'd have to execute the
+       # 'rg' binary (done in test-complete) with qemu, which is a pain and
 diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
-index 7cfb6a4..ad6b82d 100644
+index f6ea3d9..ac18129 100644
 --- a/.github/workflows/release.yml
 +++ b/.github/workflows/release.yml
-@@ -133,7 +133,13 @@ jobs:
+@@ -171,7 +171,13 @@ jobs:
          echo "target flag is: ${{ env.TARGET_FLAGS }}"
          echo "target dir is: ${{ env.TARGET_DIR }}"
  
@@ -50,25 +52,25 @@ index 7cfb6a4..ad6b82d 100644
 +
 +    - name: Build release binary (non-linux)
 +      if: matrix.build != 'linux'
-       run: ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
- 
-     - name: Strip release binary (linux and macos)
+       shell: bash
+       run: |
+         ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
 diff --git a/Cargo.toml b/Cargo.toml
-index fb78fcb..0d34b1e 100644
+index da350bc..1a0a48f 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -56,8 +56,9 @@ version = "2.33.0"
- default-features = false
- features = ["suggestions"]
+@@ -59,8 +59,9 @@ serde_json = "1.0.23"
+ termcolor = "1.1.0"
+ textwrap = { version = "0.16.0", default-features = false }
  
 -[target.'cfg(all(target_env = "musl", target_pointer_width = "64"))'.dependencies.jemallocator]
 +[dependencies.jemallocator]
- version = "0.3.0"
+ version = "0.5.0"
 +optional = true
  
- [build-dependencies]
- lazy_static = "1.1.0"
-@@ -75,6 +76,11 @@ walkdir = "2"
+ [dev-dependencies]
+ serde = "1.0.77"
+@@ -70,6 +71,11 @@ walkdir = "2"
  [features]
  simd-accel = ["grep/simd-accel"]
  pcre2 = ["grep/pcre2"]
@@ -81,10 +83,10 @@ index fb78fcb..0d34b1e 100644
  [profile.release]
  debug = 1
 diff --git a/README.md b/README.md
-index 46938bc..9917b29 100644
+index 0821fab..fdb9fb5 100644
 --- a/README.md
 +++ b/README.md
-@@ -406,6 +406,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
+@@ -478,6 +478,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
  `musl-gcc` installed, which might be in a separate package from the actual
  MUSL library, depending on your Linux distribution.
  
@@ -101,10 +103,10 @@ index 46938bc..9917b29 100644
  ### Running tests
  
 diff --git a/crates/core/main.rs b/crates/core/main.rs
-index 47385de..c9dae5a 100644
+index 64f35ce..9aa6663 100644
 --- a/crates/core/main.rs
 +++ b/crates/core/main.rs
-@@ -31,7 +31,7 @@ mod subject;
+@@ -27,7 +27,7 @@ mod search;
  // have the fastest version of everything. Its goal is to be small and amenable
  // to static compilation.) Even though ripgrep isn't particularly allocation
  // heavy, musl's allocator appears to slow down ripgrep quite a bit. Therefore,
@@ -113,7 +115,7 @@ index 47385de..c9dae5a 100644
  //
  // We don't unconditionally use jemalloc because it can be nice to use the
  // system's default allocator by default. Moreover, jemalloc seems to increase
-@@ -39,7 +39,11 @@ mod subject;
+@@ -35,7 +35,11 @@ mod search;
  //
  // Moreover, we only do this on 64-bit systems since jemalloc doesn't support
  // i686.
@@ -127,5 +129,5 @@ index 47385de..c9dae5a 100644
  static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
  
 -- 
-2.32.0
+2.25.1
 
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 71e74e1bcf..9d5b869a9c 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8  ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz
+sha256  6dfa5e8346b041749b9d7467efb794fcd15cf5b7d3ccec530940dcb1aa4ab590  ripgrep-14.1.0.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index d587441cfa..05b8d5c48e 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,11 +4,7 @@
 #
 ################################################################################
 
-# Same as 13.0.0, we use a Git commit hash because the hash of this
-# tarball changed when moving to the cargo-package infrastructure, and
-# we can't change the hash of existing tarball. Please switch back to
-# a Git tag at the next version bump.
-RIPGREP_VERSION = af6b6c543b224d348a8876f0c06245d9ea7929c5
+RIPGREP_VERSION = 14.1.0
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
