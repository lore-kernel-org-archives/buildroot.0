Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01388C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF08B4052E;
	Sun, 10 Apr 2022 14:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmD2CKiLuvKA; Sun, 10 Apr 2022 14:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7366F4051B;
	Sun, 10 Apr 2022 14:49:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77BF41BF990
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A0AC84006
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xufVkKPj69ie for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EE3983F33
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 78D00837C4; Sun, 10 Apr 2022 14:38:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:15:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aeee90ec109b83c42779e6a2617f7d57e25a2b65
X-Git-Newrev: f986b265511e6f4748595c8b7ea83f1f616ddd64
X-Patchwork-Hint: ignore
Message-Id: <20220410143837.78D00837C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: support additional host architectures
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

commit: https://git.buildroot.net/buildroot/commit/?id=f986b265511e6f4748595c8b7ea83f1f616ddd64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are host toolchains available for non-x86/x86_64 architectures,
add them as supported along with their toolchain hashes.

Note that the gcc riscv64-unknown-linux-gnu arch needs to be mapped
to the rust riscv64gc-unknown-linux-gnu arch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rust-bin/rust-bin.hash | 24 ++++++++++++++++++++++++
 package/rustc/Config.in.host   | 11 ++++++++++-
 package/rustc/rustc.mk         |  4 +++-
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 9f8788a295..bac2f21c5c 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,6 +1,30 @@
+# From https://static.rust-lang.org/dist/rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  0a80900aa160de4292b1174e25f183bd88f6c2fbb3056a59fcb4d658c70084cb  rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
 sha256  110ca4967351d8535f3d39e24f40e2941c20346c5765d3530270e134ae50568e  rust-1.58.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  01d2e69ed06fbc05a779a7d09f99d0b54a0d10fef9a7dcd0ea07866d57900ca2  rust-1.58.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  0b8fafb75e06ba9d4ca58f2cde3179a677908aed8be64e798fc107135839c480  rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  00216feea0a6468e9ce57c7d3ad50e22fe888dfc9aabc34128e1f4b02c5a09b9  rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  f6f870875d9adbe5a8b7bb6f61c44b6c54381e5dff50b4d2cdce50d18a8a541e  rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  45bf988d0337095a4d30bb237d552e3420b4381e208624f0d956e1caf6b90207  rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  488e30e926d1835c0140a01bff4d3fe6499be1e89e5c740b2ceace892ab4c2e6  rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  48cf31128a54551330f9c094f69d274adaab1ac506869dd65353aaea5bcbf33f  rust-1.58.1-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
 sha256  f71b077caf0becbd0af9fd22bc1fa31c4fdf7a21fe046da8a15a7bde1286da25  rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 80d1d1a3d8..4ea66c2d2d 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -1,7 +1,16 @@
 # All host rust packages should depend on this option
 config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "aarch64"
+	default y if BR2_HOSTARCH = "mips"
+	default y if BR2_HOSTARCH = "mipsel"
+	default y if BR2_HOSTARCH = "powerpc"
+	default y if BR2_HOSTARCH = "powerpc64"
+	default y if BR2_HOSTARCH = "powerpc64le"
+	default y if BR2_HOSTARCH = "riscv64"
+	default y if BR2_HOSTARCH = "s390x"
+	default y if BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "x86_64"
 
 # The pre-built Rust standard library is only available for a number
 # of architectures/C libraries combinations, with different levels of
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
index 0513dd0b40..b2cc131ee9 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -11,7 +11,9 @@ ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
 RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-$(LIBC)$(RUSTC_ABI)
 endif
 
-ifeq ($(HOSTARCH),x86)
+ifeq ($(HOSTARCH),riscv64)
+RUSTC_HOST_ARCH = riscv64gc
+else ifeq ($(HOSTARCH),x86)
 RUSTC_HOST_ARCH = i686
 else
 RUSTC_HOST_ARCH = $(HOSTARCH)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
