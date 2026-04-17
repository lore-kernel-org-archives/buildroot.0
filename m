Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6212F436B9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CE1181973;
	Fri, 17 Apr 2026 15:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpFkrnMaP-SO; Fri, 17 Apr 2026 15:23:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9F08818DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439388;
	bh=uHE25t44vHt9CFJa6sK8+7wW4qRkra1K83bkEI1Tlbk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ahtjumeSuLvQDv3MWj77PHhjaEtdEb7Rz+WtXzbQxgSg+Qb1n8MRMTQG/tCOG1CaM
	 LZPR6nzuJ2CtnYe+AeAaDOOZP/FgPxZntts3gq7QId610Ej6ei37FbBcKTwSREW20k
	 4hLyI1rs91a0GIEPypqR07unb1aLzcMPcSL4rgYl8mLMgrAm4oGLPno6IeBMgO082v
	 dTEdrvrFR3XeBkT1pId7Y2CLMiS0CNEqoPDgLt1kKw9qTnAHyz7tC5nr0igPjbXOK+
	 Bchlmg9ifXHQ7GDQpi4IzGvJ8kNvOghlE+azPYKmv9g7Zuhrwqr5+kSz4e+KMU3Kz3
	 FMDNNnVyHgJ0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9F08818DC;
	Fri, 17 Apr 2026 15:23:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F282396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 444EA60E26
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIJYGYM620Kh for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88F1B60D6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88F1B60D6F
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2849A81DD5; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:20:56 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 7cd8b4791d9c3028d44161f6e21878802e824481
X-Git-Newrev: d86dc1a48ee83d7b29db50c8f564e44abc17343d
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.2849A81DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 6.19.x, 6.18.x series
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d86dc1a48ee83d7b29db50c8f564e44abc17343d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Update the latest kernel releases to:
 - 6.12.79 -> 6.12.81
 - 6.6.130 -> 6.6.134
 - 6.1.167 -> 6.1.168
 - 6.19.10 -> 6.19.12
 - 6.18.20 -> 6.18.22

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/before-6.17/linux.hash         |  6 +++---
 linux/from-6.17/linux.hash           |  4 ++--
 package/linux-headers/Config.in.host | 10 +++++-----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a62d9f4a1f..c2f022240b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index a3c6bf57a3..f6a6e0dfa7 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4bfa751f33de2a5d7ecb4ff964743a027fc726a2225a76a18f92f0582aa0790b  linux-6.12.79.tar.xz
-sha256  2460aa67b9494cff6f9fc2b235470867d2005469d40f29da452e8ee82940248d  linux-6.6.130.tar.xz
-sha256  2818053c07976ba4ed5f44deb0f5dc7ae7b0975d7918c313d48d8fe7c4e598cb  linux-6.1.167.tar.xz
+sha256  c2b09c3643946a7097c5371e1dcb123c66505ea30fafd0b0a22dc1d5f0228847  linux-6.12.81.tar.xz
+sha256  6378697b36376bf4e727a47402fee340ca4e3b146d5b407d3753cbff300f37bf  linux-6.6.134.tar.xz
+sha256  e0856fe51e444986425886533ebb91d8540189e80c3f0365c76e4beb7439776e  linux-6.1.168.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
 sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 03202b91d6..77c1ba866d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  466d441a0ea5e04b7023618b7b201bfd60effab225f806fd41ce663484395a1c  linux-6.19.10.tar.xz
-sha256  837a5abd98e46078a0ae1400e2daad89ece45cc3209037b09c2265dab2393553  linux-6.18.20.tar.xz
+sha256  ce5c4f1205f9729286b569b037649591555f31ca1e03cc504bd3b70b8e58a8d5  linux-6.19.12.tar.xz
+sha256  a23c92faf3657385c2c6b5f4edd8f81b808907ebe603fa30699eae224da55f59  linux-6.18.22.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bf8b6b2728..fd68c29ec4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -466,11 +466,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.167"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.130"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.79"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.20"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.10"	if BR2_KERNEL_HEADERS_6_19
+	default "6.1.168"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.134"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.81"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.22"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.12"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
