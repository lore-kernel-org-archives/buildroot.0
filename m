Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE87C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 15:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77FEE40522;
	Thu, 28 Dec 2023 15:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77FEE40522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jw896r3Ke_7m; Thu, 28 Dec 2023 15:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E75C641A56;
	Thu, 28 Dec 2023 15:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E75C641A56
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCD91BF31A
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 15:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14B8D419C3
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 15:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B8D419C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QolelpCNgD3Z for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 15:27:32 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BEC94192C
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 15:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BEC94192C
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d4103aed7so74764535e9.3
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 07:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703777250; x=1704382050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=77foYZhoNgMq9cUSGu45qWHuYzisk/DvrlWPXqk6IGA=;
 b=PPEFe5TKGWQGm7hv3ItsTnE5RDqNuFa8m5E7hI7PLnu0ledw+5SJUo7cI+v5Hjr5gt
 bzpnKh7W/XIT9APG5NphwRHaoV9FQ5JqN9oK4WyRXGpSjo7u1Squ+cCPeDobDlFBqYgs
 LBoiWhTYJIkIEmmdhdtQdV74T9JsHKWVNvKDxsgGnKniOWXKwoACOyFLbTWYrVu738K9
 A6ETMq44dAiI3dlNqD+/U+ShbJzBoglYE+AM2zMl9vDCMn5yCt3LR1W+8VrGQNjMMGxv
 Ycl9NVK4c/You60AqyciRR9U4v4fr+mxhrYNPavTCa/1qiVrVrKvo8E+lezOKaPSdeQv
 pA3Q==
X-Gm-Message-State: AOJu0YzqdBxqlmzj/FbHqX9k2nBwZTTb+E6s5opIX17WwXBdKYxe5Hw3
 MmKvC59HAW20smQNaGf2N68ZeSOqMkj/T2xNZP9B9ejPy+g=
X-Google-Smtp-Source: AGHT+IFfgr7Mba3vLqh9B4OVGRJX/kYue8+uccuyaE/ar/9jx5Arqkj1dJwbiZl5XRSRhuGOGgCP6A==
X-Received: by 2002:a05:600c:1c11:b0:40d:60ac:16f1 with SMTP id
 j17-20020a05600c1c1100b0040d60ac16f1mr1105748wms.55.1703777249781; 
 Thu, 28 Dec 2023 07:27:29 -0800 (PST)
Received: from P-NAN-KHNOUM.home
 (2a01cb088681650065579d49ec208dd1.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8681:6500:6557:9d49:ec20:8dd1])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b0040c2c5f5844sm27729591wmn.21.2023.12.28.07.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 07:27:29 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Dec 2023 16:26:56 +0100
Message-Id: <20231228152657.488457-2-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231228152657.488457-1-antoine.coutant@smile.fr>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1703777250; x=1704382050;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77foYZhoNgMq9cUSGu45qWHuYzisk/DvrlWPXqk6IGA=;
 b=pITHUfSJ5ucLqriIUr0O3oChZv8FeHGLWScB+Ob71Dij5nu00VwZwAr5T3sM8XOJlJ
 5nMav4VRdjA9zTOyfoOxncCwF9bnkDBv1JyyPqBUZup/tqXCz9I/W2IyFehsjDp8mRMT
 56r1AVg87RALMXrLc9+zEt7ZDnGYDrGMsyRpTeeooNxM3Ak4G63N64PfpzEZbkhj+b0S
 +TEfwrLhYo8eGq+tEn/y5tfRBJXHLlBJrmkH1IduLNStriZlFFB1BcIyI/HphcqtBFGb
 NSXB5AXgYAV0DmUoTKE1INkYl964UrXJncsv+CsJLvJwWR/1JyS3A9t/qvNdHTTjMt2/
 t5nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=pITHUfSJ
Subject: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version 14.0.3
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 sebastian.weyer@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ripgrep previous version hash is no longer valid.
The tarball is modified by rust vendoring so the hash
may change with rust versions.

The patch has been rebased to ripgrep 14.0.3.

Changelog:
https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---

Tested using qemu_aarch64_virt_defconfig and Arm AArch64 13.2.rel1
toolchain.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 ...llocator-behind-a-cargo-feature-flag.patch | 52 ++++++++++---------
 package/ripgrep/ripgrep.hash                  |  2 +-
 package/ripgrep/ripgrep.mk                    |  6 +--
 3 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
index e2ba68f389..aa073c6e7f 100644
--- a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
+++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
@@ -1,4 +1,4 @@
-From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
+From e4df6678e3e2d018acccafd47d1e484887d23323 Mon Sep 17 00:00:00 2001
 From: Jonathan Stites <mail@jonstites.com>
 Date: Wed, 6 May 2020 12:55:35 +0000
 Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
@@ -9,6 +9,8 @@ Moves jemalloc behind a feature for musl builds, where it is not
 supported by the upstream project, so ripgrep will fail to build.
 
 Signed-off-by: Sam Voss <sam.voss@gmail.com>
+[Antoine: update for 14.0.3]
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
 ---
  .github/workflows/ci.yml      | 6 ++++++
  .github/workflows/release.yml | 8 +++++++-
@@ -18,10 +20,10 @@ Signed-off-by: Sam Voss <sam.voss@gmail.com>
  5 files changed, 35 insertions(+), 4 deletions(-)
 
 diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
-index ab154ec..aa567d9 100644
+index b37753e..a2cdeee 100644
 --- a/.github/workflows/ci.yml
 +++ b/.github/workflows/ci.yml
-@@ -149,6 +149,12 @@ jobs:
+@@ -160,6 +160,12 @@ jobs:
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
+index b10c076..58a7a12 100644
 --- a/.github/workflows/release.yml
 +++ b/.github/workflows/release.yml
-@@ -133,7 +133,13 @@ jobs:
+@@ -153,7 +153,13 @@ jobs:
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
+index f30cc0b..6fe4c79 100644
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
+index 63c0725..3d35819 100644
 --- a/README.md
 +++ b/README.md
-@@ -406,6 +406,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
+@@ -442,6 +442,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
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
index 71e74e1bcf..ff86c12ad5 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8  ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz
+sha256  2f022889c999ffe00955e586fe24b334d1c79060978fc41b95b52a30946e65d0  ripgrep-14.0.3.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index d587441cfa..44662749bb 100644
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
+RIPGREP_VERSION = 14.0.3
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
