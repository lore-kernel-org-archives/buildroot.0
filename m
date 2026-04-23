Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E67FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C0784D9C;
	Fri, 24 Apr 2026 16:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gx7cT_aMXub5; Fri, 24 Apr 2026 16:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D5084D9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048712;
	bh=Ma8gO8nZ9WaenGbYyZLxOQPSWc4PBepsqVFQcOLUYFU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rFFFmVK9sWaihyi5Lt30/n50s7SrnEhyUIkLlB0rmjw3f/qcTXsGT6OU51E1zy6Fj
	 GHOWLhsz9fOoe6hytVmLcLnLvNtNanVOUPfhNLQJuquOmOY5cCHcEByjCFODLn1cpZ
	 34Fky5OKIRe3LUuNqN/xptebiQr+kwfcumeazNFRKdT99TWp28+hrBXrV/RU32w51B
	 yX2ldXiEEREdDmeGJ6i+0lN0f2HyJFzFhcRO0Fc/OvhQZF7rNYg6kzLr33vmtWCd9k
	 J42tGnNxEfBcBtXjHHZh9KUBJYee0PNF0BM6zhf9Ue/iGJKrS8DB6Q4blM1Ya8F2Xh
	 7RAkXvrfAs98A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D5084D9D;
	Fri, 24 Apr 2026 16:38:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24E8F231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38464423F6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9WDzKp4hvt5 for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 637E4423E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 637E4423E6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B7FF82AFA; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 13:48:25 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 0141ca3fa5302c0c3c583cb898bd3f8792bced69
X-Git-Newrev: b79ab7b8126a04d41edc343750054b60ce4533eb
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.0B7FF82AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, 6.19.x,
 6.18.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b79ab7b8126a04d41edc343750054b60ce4533eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Update the latest kernel releases to:
 - 6.12.81 -> 6.12.82
 - 6.6.134 -> 6.6.135
 - 6.1.168 -> 6.1.169
 - 5.15.202 -> 5.15.203
 - 5.10.252 -> 5.10.253
 - 6.19.12 -> 6.19.13
 - 6.18.22 -> 6.18.23

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/before-6.17/linux.hash         | 10 +++++-----
 linux/from-6.17/linux.hash           |  4 ++--
 package/linux-headers/Config.in.host | 14 +++++++-------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c2f022240b..018b59154d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index f6a6e0dfa7..cd69a9dd05 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c2b09c3643946a7097c5371e1dcb123c66505ea30fafd0b0a22dc1d5f0228847  linux-6.12.81.tar.xz
-sha256  6378697b36376bf4e727a47402fee340ca4e3b146d5b407d3753cbff300f37bf  linux-6.6.134.tar.xz
-sha256  e0856fe51e444986425886533ebb91d8540189e80c3f0365c76e4beb7439776e  linux-6.1.168.tar.xz
+sha256  0e570b05cd73981bb4a5bcf0e03751d4f0e2ac776c6d4fdcc2366bed3e0f19a9  linux-6.12.82.tar.xz
+sha256  d3d238ede7169dedb642898af0cb1777e9913171eb1c750eb4d9f82350a7132a  linux-6.6.135.tar.xz
+sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
-sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
+sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
+sha256  ec0724928050e8e2f6226fe8bbb206f42a951c0ed2dbb533c5462789f6d75ac8  linux-5.10.253.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 77c1ba866d..1b379cfa3f 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ce5c4f1205f9729286b569b037649591555f31ca1e03cc504bd3b70b8e58a8d5  linux-6.19.12.tar.xz
-sha256  a23c92faf3657385c2c6b5f4edd8f81b808907ebe603fa30699eae224da55f59  linux-6.18.22.tar.xz
+sha256  0559b1fea740e71714b4368023902b7d098c45ac1faa3176eab392c867645648  linux-6.19.13.tar.xz
+sha256  2a2d8e76bfcd135ab861bb9795211574eeff6d4ede9cc920f7c137587e835134  linux-6.18.23.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fd68c29ec4..00b5bc86fc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,13 +464,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.168"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.134"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.81"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.22"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.12"	if BR2_KERNEL_HEADERS_6_19
+	default "5.10.253"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.82"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.23"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.13"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
