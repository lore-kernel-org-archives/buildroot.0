Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400EFCD4F57
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 07:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98CD381314;
	Tue, 19 May 2026 07:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7agSGezghvT4; Tue, 19 May 2026 07:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DC3E8107F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779176076;
	bh=PxRonD6grBXR57N/mGwV2wFm2XDEneVp95fymtHYh54=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sw9ne8z8qxnOOxeZ5Midcc2fr1e4H94wvP7o60UfeuxjNfFe3exwRIA/z3Dj7fJ5J
	 QpBkHBiEjlrdXZe+x1h/lKOOlzbiPr8g55DzEyowNX/7N+8fgiVaveE8janigmM8GB
	 IpTZ5lSFT0oc6+BlRPzppVdnuQKuOH1Bs0rR1WaJwOYaM0Faoshz5H6p4xfumsO4+F
	 bajeC2m9qVaMmxNNDq5gZqHnPwGeEhqGS6LrjjwUPaOLWA4g9BGjieKXIDwOZDvcIO
	 JPv9UdAYsaghTd5Tc5wSAn9UuWajK5WEtUA6mIL0V35UHD6fR1jHGnQ4V5UH6ZZ/FJ
	 7GRQTMtwLIthw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC3E8107F;
	Tue, 19 May 2026 07:34:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D1E282
 for <buildroot@buildroot.org>; Tue, 19 May 2026 07:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D228340377
 for <buildroot@buildroot.org>; Tue, 19 May 2026 07:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUBEW-qNT8PV for <buildroot@buildroot.org>;
 Tue, 19 May 2026 07:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBD8F40370
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBD8F40370
 for <buildroot@buildroot.org>; Tue, 19 May 2026 07:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 665398674A; Tue, 19 May 2026 07:34:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 14:18:59 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: f204a673370e69e2de13e577f36ec4a52589e8e5
X-Git-Newrev: d1d3cf26d24590e73c214d319e95e4cceac0dad5
X-Patchwork-Hint: ignore
Message-Id: <20260519073426.665398674A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, 6.18.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1d3cf26d24590e73c214d319e95e4cceac0dad5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Update the latest kernel releases to:
 - 6.12.84 -> 6.12.90
 - 6.6.136 -> 6.6.140
 - 6.1.169 -> 6.1.173
 - 5.15.203 -> 5.15.207
 - 5.10.253 -> 5.10.256
 - 6.18.25 -> 6.18.32

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash         | 10 +++++-----
 linux/from-6.17/linux.hash           |  2 +-
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index d9f1290f9c..19dc977938 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d56e463a7b1f5355794ae83a102453ad930a51f9cb46b295fcf24a717bff52dd  linux-6.12.84.tar.xz
-sha256  6fb2d21a98281d786ee5fc63760e6f2c33e567e178e83c605bf0359eabbcf471  linux-6.6.136.tar.xz
-sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
+sha256  1f1a1ff057468b8a6284d3ce1d181278259beb5670ea16724c46dbf8820fa2a8  linux-6.12.90.tar.xz
+sha256  d67c9674a2d4307f3747183935a5d434391df0fc5f5bf0e00691e059f664b7db  linux-6.6.140.tar.xz
+sha256  c4f32c6cfbe8c31478f18a4b2a50f89e73f8641ba1d683d80efc16c898876d98  linux-6.1.173.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
-sha256  ec0724928050e8e2f6226fe8bbb206f42a951c0ed2dbb533c5462789f6d75ac8  linux-5.10.253.tar.xz
+sha256  50eb7fa307745f30e5cae4c17e188fc42ce6a72f7d925d5ea7e3c2135de6148e  linux-5.15.207.tar.xz
+sha256  f1e9dac8ec41e5bd7b1811158c7b72269696ce1c37fbdd17a898b293b54d8e5f  linux-5.10.256.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index a8c9a7ce78..e401c64996 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  cde8bf6739be4a0777fedbbba5330b8188c55680c45a922a4dfa289cbec6f185  linux-6.19.14.tar.xz
-sha256  29680a07d4430b269af6ce68079b0e81dbd60f03e6f351e0661991fe39bd1898  linux-6.18.25.tar.xz
+sha256  067dadd445578284ea6158f312f7970d8940fed3e094dbe49cff66d188d3bda4  linux-6.18.32.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3b517283a7..12b44624c1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,12 +464,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.253"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.136"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.84"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.25"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.256"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.207"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.173"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.140"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.90"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.32"	if BR2_KERNEL_HEADERS_6_18
 	default "6.19.14"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
