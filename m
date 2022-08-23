Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8243BC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 214AF8131F;
	Tue, 23 Aug 2022 20:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214AF8131F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INbpr7_T6rck; Tue, 23 Aug 2022 20:18:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9F0812C8;
	Tue, 23 Aug 2022 20:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E9F0812C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 052771BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE5BF4069B
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE5BF4069B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGxJ3Sw4DhBN for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:18:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF0A24067C
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF0A24067C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 85F3387BB2; Tue, 23 Aug 2022 20:04:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 22:18:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d4a82916c88aa73fa7486f6febd1672716a50036
X-Git-Newrev: 3ad17d88f4fcd1e76e2835331e5dfc6cc976a2e0
X-Patchwork-Hint: ignore
Message-Id: <20220823200400.85F3387BB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: bump to version
 12.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ad17d88f4fcd1e76e2835331e5dfc6cc976a2e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See announce:
https://gcc.gnu.org/pipermail/gcc-announce/2022/000174.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-disable-split-stack-for-non-thread-builds.patch              | 0
 package/gcc/Config.in.host                                            | 2 +-
 package/gcc/gcc.hash                                                  | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.2.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/12.2.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ba2a2ee072..87805efcfd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -83,7 +83,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "10.4.0"    if BR2_GCC_VERSION_10_X
 	default "11.3.0"    if BR2_GCC_VERSION_11_X
-	default "12.1.0"    if BR2_GCC_VERSION_12_X
+	default "12.2.0"    if BR2_GCC_VERSION_12_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index b9536ddffe..666124fa6d 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
 sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.1.0/sha512.sum
-sha512  2121d295292814a6761edf1fba08c5f633ebe16f52b80e7b73a91050e71e1d2ed98bf17eebad263e191879561c02b48906c53faa4c4670c486a26fc75df23900  gcc-12.1.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.2.0/sha512.sum
+sha512  e9e857bd81bf7a370307d6848c81b2f5403db8c7b5207f54bce3f3faac3bde63445684092c2bc1a2427cddb6f7746496d9fbbef05fbbd77f2810b2998f1f9173  gcc-12.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
