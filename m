Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56165C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0758F40162;
	Mon,  5 Feb 2024 17:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0758F40162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeYFHKoG1WHH; Mon,  5 Feb 2024 17:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0280B4018B;
	Mon,  5 Feb 2024 17:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0280B4018B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9D161BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82A9941903
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A9941903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dc3IXt9HtIaz for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:58:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2DAA405AE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DAA405AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F6C786DB2; Mon,  5 Feb 2024 17:58:14 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 18:57:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 325fe1aecfd20d2653cce6bc189824c6fdfcafec
X-Git-Newrev: c43f12293d3a6668a79f5cfece402d46a87a473e
X-Patchwork-Hint: ignore
Message-Id: <20240205175814.9F6C786DB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rustc: rust >= 1.73.0 needs cmake
 >= 3.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=c43f12293d3a6668a79f5cfece402d46a87a473e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bump to rust 1.74.1 [1] introduced a regression on host using
cmake < 3.20 since the llvm libraries used in rust compiler was
bumpted to llvm 17 [2] and now requires cmake >= 3.20 [3].

Select BR2_HOST_CMAKE_AT_LEAST_3_20 to build host-cmake when needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/05392a5eae61c2855bc8d94f5bf9677ebbc5462a
[2] https://github.com/rust-lang/rust/commit/8c1c7d37b29d72bad1f218798d121074918e9616
[3] https://github.com/llvm/llvm-project/commit/cbaa3597aaf6273e66b3f445ed36a6458143fe6a

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448635

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Antoine Coutant <antoine.coutant@smile.fr>
Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/rustc/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 6beaad0425..baa68994e6 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -149,6 +149,8 @@ config BR2_PACKAGE_HOST_RUST
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	# triggers ICE on trunc_int_for_mode, at explow.c:56
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
+	# rust uses llvm >= 17 since 1.73.0
+	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	help
 	  This package will build the compiler for the host as well as
 	  two flavors of the standard library: one for the host, another
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
