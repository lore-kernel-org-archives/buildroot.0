Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92751C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 561A442D09;
	Fri,  2 May 2025 11:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVAjnRQbfRgy; Fri,  2 May 2025 11:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EDBD42D08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EDBD42D08;
	Fri,  2 May 2025 11:14:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E23DEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09011419DB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3RY-G-iVkFL for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F62741A08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F62741A08
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D67C812BB; Fri,  2 May 2025 11:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f1214d75b1acbf9182d0f42cb11f24124332f133
X-Git-Newrev: 6364ed5c3e4f0e086dcc58d27dda7152a7d4e74c
X-Patchwork-Hint: ignore
Message-Id: <20250502111138.2D67C812BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ripgrep: bump to
 version 14.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6364ed5c3e4f0e086dcc58d27dda7152a7d4e74c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Changelog:
https://github.com/BurntSushi/ripgrep/blob/14.1.1/CHANGELOG.md

The commit also rebase he package patch on this new version.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Julien:
 - squash patch rebase and version bump in a single commit
 - update changelog link to use the tag
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 259af5589ccdd722295395d120875f4b8cd667cf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...loc-allocator-behind-a-cargo-feature-flag.patch | 29 +++++++++++-----------
 package/ripgrep/ripgrep.hash                       |  2 +-
 package/ripgrep/ripgrep.mk                         |  2 +-
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
index e665a6570e..8df1491e40 100644
--- a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
+++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
@@ -1,4 +1,4 @@
-From 77f850969433b14769ade4281899373f3ebabf86 Mon Sep 17 00:00:00 2001
+From 3199b83995a9e3a180664c03db6b301641d8f3ea Mon Sep 17 00:00:00 2001
 From: Jonathan Stites <mail@jonstites.com>
 Date: Wed, 6 May 2020 12:55:35 +0000
 Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
@@ -11,16 +11,18 @@ supported by the upstream project, so ripgrep will fail to build.
 Signed-off-by: Sam Voss <sam.voss@gmail.com>
 [Antoine: update for 14.1.0]
 Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
+[Mehdi: update for 14.1.1]
+Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
 ---
  .github/workflows/ci.yml      | 6 ++++++
  .github/workflows/release.yml | 8 +++++++-
  Cargo.toml                    | 8 +++++++-
- README.md                     | 9 +++++++++
+ README.md                     | 8 ++++++++
  crates/core/main.rs           | 8 ++++++--
- 5 files changed, 35 insertions(+), 4 deletions(-)
+ 5 files changed, 34 insertions(+), 4 deletions(-)
 
 diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
-index d21b85a..0c9ecb9 100644
+index 532e2e9..744e2bc 100644
 --- a/.github/workflows/ci.yml
 +++ b/.github/workflows/ci.yml
 @@ -172,6 +172,12 @@ jobs:
@@ -37,7 +39,7 @@ index d21b85a..0c9ecb9 100644
        # We could test this when using Cross, but we'd have to execute the
        # 'rg' binary (done in test-complete) with qemu, which is a pain and
 diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
-index f6ea3d9..ac18129 100644
+index f6ea3d9..b9ac802 100644
 --- a/.github/workflows/release.yml
 +++ b/.github/workflows/release.yml
 @@ -171,7 +171,13 @@ jobs:
@@ -45,8 +47,8 @@ index f6ea3d9..ac18129 100644
          echo "target dir is: ${{ env.TARGET_DIR }}"
  
 -    - name: Build release binary
-+    - name: Build release binary (linux)
-+      if: matrix.build == 'linux'
++    - name : Build release binary (linux)
++      if: matrix.build == 'linux
 +      # Use jemalloc allocator for much better performance over the musl default allocator
 +      run: ${{ env.CARGO }} build --verbose --release --features "pcre2 jemalloc" ${{ env.TARGET_FLAGS }}
 +
@@ -56,7 +58,7 @@ index f6ea3d9..ac18129 100644
        run: |
          ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
 diff --git a/Cargo.toml b/Cargo.toml
-index da350bc..1a0a48f 100644
+index 2ec69c9..2785c12 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -59,8 +59,9 @@ serde_json = "1.0.23"
@@ -70,9 +72,9 @@ index da350bc..1a0a48f 100644
  
  [dev-dependencies]
  serde = "1.0.77"
-@@ -70,6 +71,11 @@ walkdir = "2"
+@@ -69,6 +70,11 @@ walkdir = "2"
+ 
  [features]
- simd-accel = ["grep/simd-accel"]
  pcre2 = ["grep/pcre2"]
 +# The jemalloc allocator is used for improved
 +# performance on x86 musl builds.
@@ -83,16 +85,15 @@ index da350bc..1a0a48f 100644
  [profile.release]
  debug = 1
 diff --git a/README.md b/README.md
-index 0821fab..fdb9fb5 100644
+index a429087..f017864 100644
 --- a/README.md
 +++ b/README.md
-@@ -478,6 +478,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
+@@ -486,6 +486,14 @@ build a static executable with MUSL and with PCRE2, then you will need to have
  `musl-gcc` installed, which might be in a separate package from the actual
  MUSL library, depending on your Linux distribution.
  
 +When building with the MUSL target on Linux, it is recommended to use the
 +jemalloc allocator for performance:
-+
 +```
 +$ rustup target add x86_64-unknown-linux-musl
 +$ cargo build --release --target x86_64-unknown-linux-musl --features jemalloc
@@ -129,5 +130,5 @@ index 64f35ce..9aa6663 100644
  static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
  
 -- 
-2.25.1
+2.43.0
 
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 39165770dc..eec532d240 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e1e66e2e9a7290a0a9445a82886a678ee8b2583b296fb851e1472c7403a681a  ripgrep-14.1.0-cargo2.tar.gz
+sha256  64e79c29ca21c9faf699f7241919f05bba89e5732ca5ec6d506fb4ddd1245d9e  ripgrep-14.1.1-cargo2.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 288c20ee95..fd5b3b882e 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RIPGREP_VERSION = 14.1.0
+RIPGREP_VERSION = 14.1.1
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
