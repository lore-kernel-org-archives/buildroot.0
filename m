Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4602C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7246C40D3E;
	Fri, 14 Aug 2026 13:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eXZf2swOf2M; Fri, 14 Aug 2026 13:21:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6A5D40C93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713703;
	bh=jF9wB8AkjeoqcFqbASvyx3TJV1YEEXm2/tochbAkt+w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mBu9auA/1aT2QqkKfsgq5Fk0ag2VmRxTr7Rkjx4wg1G8kKPid6sFugRu7vhOIeEuW
	 cA5p788MnWggexCbL/wKCOTHjeD0hiyHkrIfR0gdjr08eMUc2jxh1w/JfxS0e8xx/m
	 8nKSGnA4p7mqxTjI3VixMiIYawBFDhZv6eDQ16hBm7NhrBMp0iCLo/9x+5u3N32tfR
	 P4mRJghDJD5ZfQLtjocnObaHeLOXf8WEP2scMtzlmJuDYFBFg6dI/YcHBJT/RhTY6B
	 Ge2eSVTx6DYiiITzjSdQ0dN2c5xm4syuoBzCBtHCrWlxboQDmGAEbmaFHmSgWkYiyL
	 nWD8TzBTH5/jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A5D40C93;
	Fri, 14 Aug 2026 13:21:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD8B139E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 804E2400E3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2_dOOXIBZHv for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2745D4002B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2745D4002B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AC308D66A; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 08:56:36 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: fde8ba3df7cd3af9d55d1a9fcfeb9a3b0adb39a4
X-Git-Newrev: 4279f3abedcce9ea89f0bad84be9f27ebcd1223a
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.2AC308D66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12, 18} series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4279f3abedcce9ea89f0bad84be9f27ebcd1223a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Update the latest kernel releases:
    - 5.10.262 -> 5.10.264
    - 5.15.213 -> 5.15.215
    - 6.1.180 -> 6.1.182
    - 6.6.148 -> 6.6.151
    - 6.12.101 -> 6.12.103
    - 6.18.42 -> 6.18.44

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.262 => 5.10.264} |  0
 package/linux-headers/{5.15.213 => 5.15.215} |  0
 package/linux-headers/{6.1.180 => 6.1.182}   |  0
 package/linux-headers/{6.12.101 => 6.12.103} |  0
 package/linux-headers/{6.18.42 => 6.18.44}   |  0
 package/linux-headers/{6.6.148 => 6.6.151}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 779def28d0..c1e447e255 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0d21cd11933f49f7151b7c9dbb8cc3fddc8c8abe506434b850feecf41fc28a76  linux-6.12.101.tar.xz
-sha256  b674994b5760eb1c493711cfdc3aefb97583dfe04bb7977b4c8e7aae0710f75e  linux-6.6.148.tar.xz
-sha256  4f0e601759b55cfc4d0bf4990859b93bc74fb915cde532284f0765b77ca0f86a  linux-6.1.180.tar.xz
+sha256  f143aaade8877ba5616e788b4482576db28481bcf557ef537f4fcc3938fc3176  linux-6.12.103.tar.xz
+sha256  de01e5ae73412b70bceb41a6f97da6d0f29b6536f1f00f8b6a6fd40c729969f7  linux-6.6.151.tar.xz
+sha256  f38416bb6e8024a21ae868c7f29cd15293a73755e3484c7f2f4adea5b03c1f85  linux-6.1.182.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c4721b4b8535f3e418ee579c70645fbfd5ddfba4943c31b919e8c9522371e1d8  linux-5.15.213.tar.xz
-sha256  fae7da8a9b97e5386f0a3dc3c5c8a88be17fcf2d0792a58a5a0c5b4f5775b483  linux-5.10.262.tar.xz
+sha256  d57f279da0813fa6d69fb2e59cf9a364be4faa1cd18cb76b0b64c074fd23b7a7  linux-5.15.215.tar.xz
+sha256  f27552ec32783512c81918c3b8f155fed8dbaf8a90a5a20afdc01aac715b489e  linux-5.10.264.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index e29ffb04e2..c93eb3a376 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  35a8ef5e8fb44467e56a42b40c23c4c10a61d1e95ff8d738f285230e8bed63e7  linux-6.18.42.tar.xz
+sha256  0f72d938f06828e82c90405174fe572287db7bfe089e2fc46572a99a7f240d43  linux-6.18.44.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.262 b/package/linux-headers/5.10.264
similarity index 100%
rename from package/linux-headers/5.10.262
rename to package/linux-headers/5.10.264
diff --git a/package/linux-headers/5.15.213 b/package/linux-headers/5.15.215
similarity index 100%
rename from package/linux-headers/5.15.213
rename to package/linux-headers/5.15.215
diff --git a/package/linux-headers/6.1.180 b/package/linux-headers/6.1.182
similarity index 100%
rename from package/linux-headers/6.1.180
rename to package/linux-headers/6.1.182
diff --git a/package/linux-headers/6.12.101 b/package/linux-headers/6.12.103
similarity index 100%
rename from package/linux-headers/6.12.101
rename to package/linux-headers/6.12.103
diff --git a/package/linux-headers/6.18.42 b/package/linux-headers/6.18.44
similarity index 100%
rename from package/linux-headers/6.18.42
rename to package/linux-headers/6.18.44
diff --git a/package/linux-headers/6.6.148 b/package/linux-headers/6.6.151
similarity index 100%
rename from package/linux-headers/6.6.148
rename to package/linux-headers/6.6.151
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7599a7ad93..533812d3c9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,12 +468,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.262"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.213"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.180"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.148"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.101"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.42"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.264"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.215"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.182"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.151"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.103"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.44"	if BR2_KERNEL_HEADERS_6_18
 	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
