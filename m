Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC40C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 467B361ADA;
	Sat, 23 Jul 2022 15:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 467B361ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xoK_XBMybA3C; Sat, 23 Jul 2022 15:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42DF061AD7;
	Sat, 23 Jul 2022 15:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42DF061AD7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B49A1BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53DAA41666
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53DAA41666
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PbO_L_Jt8Gvu for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44470404DF
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44470404DF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 27866846A1; Sat, 23 Jul 2022 15:18:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:31:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4011ff535e28e5641074380acffff3378a460dac
X-Git-Newrev: 0f1ad4fc93286adaba852c99d6e1c2565b5c4258
X-Patchwork-Hint: ignore
Message-Id: <20220723151806.27866846A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add support for gcc 12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f1ad4fc93286adaba852c99d6e1c2565b5c4258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gcc.gnu.org/gcc-12/changes.html
https://gcc.gnu.org/gcc-12/porting_to.html

Tested with toolchain-builder:
https://gitlab.com/kubu93/toolchains-builder/-/pipelines/550404957

All three patches we had on gcc 11.x are upstream, so there are so far
no known patches needed for gcc 12.x. Here are the upstream commits of
the 3 patches:

https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=eff8110674ef193481d3657456a262beeb9951ff
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=da8a9d695b3c4b9397b5d9a27660bfa48af8d707
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=cac2f69cdad434ad5cb60f5fe931d45cd82ef476

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 14 ++++++++++++++
 package/gcc/gcc.hash       |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b12035c4b..2d9eaef102 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -62,6 +62,19 @@ config BR2_GCC_VERSION_11_X
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
+config BR2_GCC_VERSION_12_X
+	bool "gcc 12.x"
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_powerpc_SPE
+	# uClibc-ng broken on sparc due to recent gcc changes
+	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
+	depends on !BR2_sparc
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+
 endchoice
 
 # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
@@ -88,6 +101,7 @@ config BR2_GCC_VERSION
 	default "9.4.0"     if BR2_GCC_VERSION_9_X
 	default "10.3.0"    if BR2_GCC_VERSION_10_X
 	default "11.3.0"    if BR2_GCC_VERSION_11_X
+	default "12.1.0"    if BR2_GCC_VERSION_12_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index e364be0a06..dc19c282c2 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,6 +6,8 @@ sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b79
 sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
 sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.1.0/sha512.sum
+sha512  2121d295292814a6761edf1fba08c5f633ebe16f52b80e7b73a91050e71e1d2ed98bf17eebad263e191879561c02b48906c53faa4c4670c486a26fc75df23900  gcc-12.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
