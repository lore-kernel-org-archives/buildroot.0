Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A480E7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC9FD610EC;
	Fri,  3 Apr 2026 10:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0Yt6oxReD60; Fri,  3 Apr 2026 10:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3CC461127
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212121;
	bh=I+O7YomjlrG6PtAKDQwPFbRKNQlN+ADGrvjYdUvupKg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sdIt1VISMPM2af47Z1+1I5QL41ILZOtFq+A40oF2jGWz0uDOJ8p04akyypMwrXOI/
	 Hr0Dw1bR3876slL9Df4RPj5bRbs+CT+/fXtWqf6qLRlgIAF6qFoo7onY/FpPMIIHU0
	 KzqSz30PFaqy2aPmD0Sc+1ZLPZQ+kMZWsOVX/MEB35RKVLMJw+Uzw5h4y/5TFYqMx2
	 LMJ44D97Msx0ALBiRiXoPSfznTPIqXbc+tgPMPULVa58uUoJu9Zis/otLa2uDtKiOs
	 lhreomVVStL1YgrNYU9ZanqZkG14QaO8uR7gUIbbULIfcxIcJcg+W694k0MVbdLOoO
	 Jq9OdO0i328LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3CC461127;
	Fri,  3 Apr 2026 10:28:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF7AD2D3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0B1581E4E
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIOjhcQE0WpQ for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D087181A29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D087181A29
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CFDB7FFA9; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Mar 2026 14:41:09 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6578fd1729ddf58848d108871fbc361f91207c36
X-Git-Newrev: 731cc7e2a3c07b8b2bcd56d82f36fae9163a5b74
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.4CFDB7FFA9@busybox.osuosl.org>
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/731cc7e2a3c07b8b2bcd56d82f36fae9163a5b74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Update the latest kernel releases to:
 - 6.12.77 -> 6.12.79
 - 6.6.129 -> 6.6.130
 - 6.1.166 -> 6.1.167
 - 6.19.9 -> 6.19.10
 - 6.18.19 -> 6.18.20

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/before-6.17/linux.hash         |  6 +++---
 linux/from-6.17/linux.hash           |  4 ++--
 package/linux-headers/Config.in.host | 10 +++++-----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6e76f8cb8f..a62d9f4a1f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 1c6a6ab553..a3c6bf57a3 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  358836ebe5caef41e7ae9492e7fbcdf5be6e53ee43c99752aebda81e1b2cff67  linux-6.12.77.tar.xz
-sha256  caa08f0122224fbbfab177e2a37cc2a94a0046bd2e7e87f03f8913f2b812448a  linux-6.6.129.tar.xz
-sha256  818dfc742158d18f70a6abccd77b7e4366cb7f26a88687f94dae392a9f089449  linux-6.1.166.tar.xz
+sha256  4bfa751f33de2a5d7ecb4ff964743a027fc726a2225a76a18f92f0582aa0790b  linux-6.12.79.tar.xz
+sha256  2460aa67b9494cff6f9fc2b235470867d2005469d40f29da452e8ee82940248d  linux-6.6.130.tar.xz
+sha256  2818053c07976ba4ed5f44deb0f5dc7ae7b0975d7918c313d48d8fe7c4e598cb  linux-6.1.167.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
 sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3e30028505..03202b91d6 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c16068a3af12e3943dee3b1eef57ca70229c069128bfa1184fb3f48b219d55bf  linux-6.19.9.tar.xz
-sha256  eaaf78271cd07c68ad9c4c9a70c72718b33abbd716239d82bac96b1751eb090c  linux-6.18.19.tar.xz
+sha256  466d441a0ea5e04b7023618b7b201bfd60effab225f806fd41ce663484395a1c  linux-6.19.10.tar.xz
+sha256  837a5abd98e46078a0ae1400e2daad89ece45cc3209037b09c2265dab2393553  linux-6.18.20.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a9165978d0..bf8b6b2728 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -466,11 +466,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.166"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.129"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.77"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.19"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.9"	if BR2_KERNEL_HEADERS_6_19
+	default "6.1.167"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.130"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.79"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.20"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.10"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
