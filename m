Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A44C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 052C860C51
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 052C860C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD85B82FE4;
	Sat,  4 Sep 2021 18:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QaDFMlQ9q-8Q; Sat,  4 Sep 2021 18:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE5E181002;
	Sat,  4 Sep 2021 18:40:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 870FB1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31C4F4023C
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHJw4TrGFSQI for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAF6D401B2
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BFD238834A; Sat,  4 Sep 2021 18:23:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:36:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daa90d691844c2fc3c853d5e45f81a5530bbbed2
X-Git-Newrev: 5d4cf52204b7c5c4366ec029f83c87610722f6f0
X-Patchwork-Hint: ignore
Message-Id: <20210904182354.BFD238834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ripgrep: bump to version 13.0.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d4cf52204b7c5c4366ec029f83c87610722f6f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also adds patch to make the jemalloc feature optional on musl, due to
toolchains not being supported by upstream project.

Signed-off-by: Sam Voss <sam.voss@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...loc-allocator-behind-a-cargo-feature-flag.patch | 131 +++++++++++++++++++++
 package/ripgrep/ripgrep.hash                       |   4 +-
 package/ripgrep/ripgrep.mk                         |   2 +-
 3 files changed, 134 insertions(+), 3 deletions(-)

diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
new file mode 100644
index 0000000000..e2ba68f389
--- /dev/null
+++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
@@ -0,0 +1,131 @@
+From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
+From: Jonathan Stites <mail@jonstites.com>
+Date: Wed, 6 May 2020 12:55:35 +0000
+Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
+
+Retrieved from: https://github.com/BurntSushi/ripgrep/pull/1569
+
+Moves jemalloc behind a feature for musl builds, where it is not
+supported by the upstream project, so ripgrep will fail to build.
+
+Signed-off-by: Sam Voss <sam.voss@gmail.com>
+---
+ .github/workflows/ci.yml      | 6 ++++++
+ .github/workflows/release.yml | 8 +++++++-
+ Cargo.toml                    | 8 +++++++-
+ README.md                     | 9 +++++++++
+ crates/core/main.rs           | 8 ++++++--
+ 5 files changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
+index ab154ec..aa567d9 100644
+--- a/.github/workflows/ci.yml
++++ b/.github/workflows/ci.yml
+@@ -149,6 +149,12 @@ jobs:
+       if: matrix.target != ''
+       run: ${{ env.CARGO }} test --verbose --workspace ${{ env.TARGET_FLAGS }}
+ 
++    - name: Run tests with jemalloc (Musl)
++      # We only use the jemalloc allocator when building with musl.
++      # The system allocator is good enough for other platforms.
++      if: matrix.os == 'nightly-musl'
++      run: ${{ env.CARGO }} test --verbose --all --features jemalloc ${{ env.TARGET_FLAGS }}
++
+     - name: Test for existence of build artifacts (Windows)
+       if: matrix.os == 'windows-2019'
+       shell: bash
+diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
+index 7cfb6a4..ad6b82d 100644
+--- a/.github/workflows/release.yml
++++ b/.github/workflows/release.yml
+@@ -133,7 +133,13 @@ jobs:
+         echo "target flag is: ${{ env.TARGET_FLAGS }}"
+         echo "target dir is: ${{ env.TARGET_DIR }}"
+ 
+-    - name: Build release binary
++    - name: Build release binary (linux)
++      if: matrix.build == 'linux'
++      # Use jemalloc allocator for much better performance over the musl default allocator
++      run: ${{ env.CARGO }} build --verbose --release --features "pcre2 jemalloc" ${{ env.TARGET_FLAGS }}
++
++    - name: Build release binary (non-linux)
++      if: matrix.build != 'linux'
+       run: ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
+ 
+     - name: Strip release binary (linux and macos)
+diff --git a/Cargo.toml b/Cargo.toml
+index fb78fcb..0d34b1e 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -56,8 +56,9 @@ version = "2.33.0"
+ default-features = false
+ features = ["suggestions"]
+ 
+-[target.'cfg(all(target_env = "musl", target_pointer_width = "64"))'.dependencies.jemallocator]
++[dependencies.jemallocator]
+ version = "0.3.0"
++optional = true
+ 
+ [build-dependencies]
+ lazy_static = "1.1.0"
+@@ -75,6 +76,11 @@ walkdir = "2"
+ [features]
+ simd-accel = ["grep/simd-accel"]
+ pcre2 = ["grep/pcre2"]
++# The jemalloc allocator is used for improved
++# performance on x86 musl builds.
++# Cargo does not yet support platform-specific features
++# https://github.com/rust-lang/cargo/issues/1197
++jemalloc = ["jemallocator"]
+ 
+ [profile.release]
+ debug = 1
+diff --git a/README.md b/README.md
+index 46938bc..9917b29 100644
+--- a/README.md
++++ b/README.md
+@@ -406,6 +406,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
+ `musl-gcc` installed, which might be in a separate package from the actual
+ MUSL library, depending on your Linux distribution.
+ 
++When building with the MUSL target on Linux, it is recommended to use the
++jemalloc allocator for performance:
++
++```
++$ rustup target add x86_64-unknown-linux-musl
++$ cargo build --release --target x86_64-unknown-linux-musl --features jemalloc
++```
++
++
+ 
+ ### Running tests
+ 
+diff --git a/crates/core/main.rs b/crates/core/main.rs
+index 47385de..c9dae5a 100644
+--- a/crates/core/main.rs
++++ b/crates/core/main.rs
+@@ -31,7 +31,7 @@ mod subject;
+ // have the fastest version of everything. Its goal is to be small and amenable
+ // to static compilation.) Even though ripgrep isn't particularly allocation
+ // heavy, musl's allocator appears to slow down ripgrep quite a bit. Therefore,
+-// when building with musl, we use jemalloc.
++// we expose a feature for using jemalloc when building with musl.
+ //
+ // We don't unconditionally use jemalloc because it can be nice to use the
+ // system's default allocator by default. Moreover, jemalloc seems to increase
+@@ -39,7 +39,11 @@ mod subject;
+ //
+ // Moreover, we only do this on 64-bit systems since jemalloc doesn't support
+ // i686.
+-#[cfg(all(target_env = "musl", target_pointer_width = "64"))]
++#[cfg(all(
++    target_env = "musl",
++    target_pointer_width = "64",
++    feature = "jemalloc"
++))]
+ #[global_allocator]
+ static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
+ 
+-- 
+2.32.0
+
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 0841c0185c..b2f03a95e6 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3 ripgrep-0.8.1.tar.gz
-sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f LICENSE-MIT
+sha256 0fb17aaf285b3eee8ddab17b833af1e190d73de317ff9648751ab0660d763ed2  ripgrep-13.0.0.tar.gz
+sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 450bb020e3..2d9dd3ee2f 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RIPGREP_VERSION = 0.8.1
+RIPGREP_VERSION = 13.0.0
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
