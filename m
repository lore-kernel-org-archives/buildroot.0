Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C0FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54B9E40529;
	Sun, 10 Apr 2022 14:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y62JNphFAiNE; Sun, 10 Apr 2022 14:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F31940217;
	Sun, 10 Apr 2022 14:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3C81BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42A534088A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOJ21zFbXsdt for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47017404B6
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 82ACB837C6; Sun, 10 Apr 2022 14:38:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:15:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f986b265511e6f4748595c8b7ea83f1f616ddd64
X-Git-Newrev: 718574186190e23c45c6f3e92000f1e36dfe6c95
X-Patchwork-Hint: ignore
Message-Id: <20220410143837.82ACB837C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rustc,
 rust-bin}: add s390x target arch support
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

commit: https://git.buildroot.net/buildroot/commit/?id=718574186190e23c45c6f3e92000f1e36dfe6c95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rust-bin/rust-bin.hash | 3 +++
 package/rustc/Config.in.host   | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index bac2f21c5c..b2a4502cd9 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -112,6 +112,9 @@ sha256  a85f5f42918e8b140d7093ba49fc46a21625863538c95d2db03f831cc445f025  rust-s
 # From https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
 sha256  2d7276fe261478c377913177dcec3e0aeed84f2c567db0ae8e415efee7bb9ce0  rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  e990778d618a213a0825625277505850e222df9ab5b514fec927fbf2d2d21a66  rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.asc
 sha256  7a7cd002c63179f3f47d64b1140c180986322a7cc0d31de61d7c4728cedacba0  rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 4ea66c2d2d..a86d95236d 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -62,6 +62,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
 			BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC && \
 			BR2_TOOLCHAIN_USES_GLIBC
+	# s390x-unknown-linux-gnu
+	default y if BR2_s390x && BR2_TOOLCHAIN_USES_GLIBC
 	# x86_64-unknown-linux-musl
 	default y if BR2_x86_64 && BR2_TOOLCHAIN_USES_MUSL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
