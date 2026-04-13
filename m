Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1992F531C3
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 19:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABD641117;
	Mon, 13 Apr 2026 19:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6eBcQuD4utH; Mon, 13 Apr 2026 19:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A6641143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776107920;
	bh=qDCyOAr1LhTbml84R1TU+/PWoJt/fefNET636TSRn6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BdI2GSUG11raEECTMT2VvlcuA6zqZ/3XMzfcblvuAtyPZLrT8YWq+NTksqcWl0h4z
	 Rrf+vE2jma19omkvraBdc5BCb524sgWH8t2bDNul5rJekH93P+1HxPDBQnCavo5cKa
	 9hGblzFjkGbjhgd9h9l3uWA3eOeB1esd2fA/HEWN02agh1ePROe0SxgyQvbS/lzV1A
	 DvmGvNrBe68N7k/pwP/+I34WykGdEUCnic85CbO3YjPFhj1j8fSKTziF9EFeGZdEtZ
	 Q70WKuLjSc450tlNAF0NLA3hPCqGrASD2Rr9F1Yo6KvFpxct0lP8Mn3fVHWtidY2u2
	 FNM+9P6QuopdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A6641143;
	Mon, 13 Apr 2026 19:18:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95B1C237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BAF941144
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mzf80FDRNLi8 for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 19:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6407D41143
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6407D41143
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:18:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D420E81348; Mon, 13 Apr 2026 19:18:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 21:16:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1f96c1ad006c9a65ac39b500ccd1c8581dd2fc5
X-Git-Newrev: 1f6ec3ee7c4e6fb0ee467f2e618154cb640a1020
X-Patchwork-Hint: ignore
Message-Id: <20260413191836.D420E81348@busybox.osuosl.org>
Subject: [Buildroot] [git commit] rust: add support for
 riscv64gc-unknown-linux-musl target
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f6ec3ee7c4e6fb0ee467f2e618154cb640a1020
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Mariusz Bialonczyk <manio@skyboo.net>
[rebased for rust 1.94.1]
Signed-off-by: Nicolas Serafini <nicolas.serafini@flyability.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rust-bin/rust-bin.hash | 2 ++
 package/rustc/Config.in.host   | 5 +++++
 utils/update-rust              | 1 +
 3 files changed, 8 insertions(+)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index b1e4ef67a2..00621d01f9 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -57,6 +57,8 @@ sha256  1ffe28904e888f7884124f08f940a330b314a1c42b502c6458604dd7cd852e82  rust-s
 sha256  68060c6b0716eb9ab9aa0f570b508414362f509e29155b796a531c7e1c9543cc  rust-std-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
 sha256  8e223e480e8bb25aa8fec3bca936cb6343098b0af5b59a2c40abd5cca51aa3ab  rust-std-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  de9fcd9fc4e710ec74108dc3237a78f24fb4c1c6fdbc3a70682e73589933e5e5  rust-std-1.94.1-riscv64gc-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.94.1-s390x-unknown-linux-gnu.tar.xz.sha256
 sha256  391a713446c2ef5bccc3f90058b4eff4df42f8c996c399bb760a1565adfeb193  rust-std-1.94.1-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.94.1-sparc64-unknown-linux-gnu.tar.xz.sha256
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index c3e9a13f39..9cd912fc74 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -58,6 +58,11 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
 			BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC && \
 			BR2_TOOLCHAIN_USES_GLIBC
+	# riscv64gc-unknown-linux-musl
+	default y if BR2_RISCV_64 && BR2_RISCV_ISA_RVI && BR2_RISCV_ISA_RVM && \
+			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
+			BR2_RISCV_ISA_RVD && \
+			BR2_TOOLCHAIN_USES_MUSL
 	# s390x-unknown-linux-gnu
 	default y if BR2_s390x && BR2_TOOLCHAIN_USES_GLIBC
 	# x86_64-unknown-linux-musl
diff --git a/utils/update-rust b/utils/update-rust
index 7db3feff9c..18d7b1d1f8 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -52,6 +52,7 @@ RUST_TARGETS = [
     "powerpc64-unknown-linux-gnu",
     "powerpc64le-unknown-linux-gnu",
     "riscv64gc-unknown-linux-gnu",
+    "riscv64gc-unknown-linux-musl",
     "s390x-unknown-linux-gnu",
     "sparc64-unknown-linux-gnu",
     "x86_64-unknown-linux-gnu",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
