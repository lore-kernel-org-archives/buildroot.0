Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653C606A327
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qwf2IUEG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE4F60AF5;
	Fri, 30 Oct 2026 14:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6K8iikdXmz7; Fri, 30 Oct 2026 14:06:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E47D60AD3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369171;
	b=e3kdOEbBM7bXl42CvXa998VTR9gNPqajoNflHEooPGogwRWpDpB73sC3G34x/AH92Bh0
	 f2vLK8ViVGP10nJ1dtHPa3FwGiuHBd1JT8R5BNEK/4c5vo0k1ntHhVOHeuy9n12l/lpDo
	 j+XjGO/c+QJqXcmfhpsIJHjiFgK3fNinJu9uXpmAieDUXV9z49HoovYktPgfeicYbvNO2
	 hsKErQsPpO/9xg/d6yNnDD4Xt8IlxF9A9+E2mzVKB9D9xy197A4q/AMWuCm+cDx6G8pMu
	 A/NBLoyyBP1qdxLhRdyqI3kGj75iuPVQsHoepBJCVt95IImgkqw3xWOMnhsUDQHxlsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a4cBqQo2dUzJmWETgf+G6tYMQEf3PYmBvu4WERnDnD8=;
	b=WE0LPTmrdLo/iQbc5aLFSase3w/MMXPmQKORZW+fi/r0Er7Z0kRfs6gBUUFR2RxsRnex
	 +B+pu74tU3bjaBwbDm1ZOiUOg5SoySLkYAfG6EBCG2eKR9FsErB6eKG7vhENFWKZcvm7+
	 8FgrF8rooBq6+3nuTi39Ss4CVJp4FzXzutHWLxcEgb/0fb1FQ9e+Bjw826sVQLw78NzNf
	 cEkbYkyE+Aif4EMJfggr22aiMaRFLKZdF2R/7QDgBzgEX/dr7VTFuZI1LklmU6ETChDtV
	 llUrK2HPX49V33H6hpE7XPgKDFU3xMiNXsd+kOyrtlLokIeQ0JMjsBWJi/F4Mj9+bvg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369171;
	bh=a4cBqQo2dUzJmWETgf+G6tYMQEf3PYmBvu4WERnDnD8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qwf2IUEGSLs4nM421oc6UyE7wt+imXmida0As55RKzpOPphxG+IMYcjMLE856um5G
	 JBgtlzyd8NMcqp3LssS0aStVVzFSHWdC+OOtDizX89BKIhCSFpNva2PUeyjh4+rF+r
	 xBgF404ugTJjXiipjhKOJuYldaLQeqIFJIC1HuviS+bGYEQjxTD26ncEzM1ky4n2Po
	 LrWcYLacTxeqC30gyqlJnAoskqKD9BcGzRCBmcKkF81AZsAA6dJ7scxOLGHOYhXMyV
	 uLawCuSXfNoB4ip8Cx4TTjmemlPODbnb7AbPHzZb8EOS7M85aRJK4iQDljWwOcxr0B
	 CLK6mx5mAeomg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E47D60AD3;
	Fri, 30 Oct 2026 14:06:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42E57D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28DCF40B28
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfWhQhH1yQep for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D4AA040AF5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369156;
 b=MJUN+y+EeoqiYVtJSTtfNpSoMMGHL95eTORnmPP6oWiZGbLaXW+G8iRtfrTtZofnS82r
 W5dG3b4CBDawaTAut6k2J9c8PuNQK629cjJHT3CpYT+xAT7T/oirgKzN+4ovBC+oB3gFz
 oFH2e5WsivM70ZHnvSPsHyCZ8MHjA2sKgsY9PhsniCWao21KpmmRVb85mJm7yxJa8XHoa
 2mXX3zRAl8k4PP9s6scMc4uUvqtjEgR9qurHE98/igyDBtWbDuYymlfCJhSss2Eb/e0tv
 NjAHXXyrKaHYblJPuC3PZAAjR8t5YCAxP4lJkIpUX1+44IFDleLD91NZkcxKr/eKOqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369156;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mbfUoJJxOSy8Mk/xGqsMkqPaZHdpkdg9rcsAMDmWZiI=;
 b=DVEWAEvglmDT9guV+IsRAd2/Lrplu4NMZMyS4bClPDvzaQBhVxbfgD/WhQRGpkaKBnUB
 dghNPflRQXnLK41soDM9jmMbXAA7mf8wB09dGEmAssLQbqxLMjf/EFFGghnmwbc7LVRWp
 bnTs/pEhfIJi5c1buILFtiok7Is4t/V0n/9UXiRdSRF1H6QDhKinf9kOkakDL1VaX6FWu
 ipilzf8m2PChR9RjpAYfOmSkm88P7VrdD5Fna4aGZC6aTN4cSP7keA3ojaOb/7X5jVk3/
 jeRydwJSFcb1PJYKKWRprezgdUNn6uOIztV8Obi1041K2I+t4iIShqrVj57uy3MtLdw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4AA040AF5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E835B9D388; Fri, 30 Oct 2026 14:04:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 13:51:39 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: efd79a3df47d193432fef57de140e20fbe2806d8
X-Git-Newrev: cb33d3beac6920b9e1b376f364e967e05f19e228
X-Patchwork-Hint: ignore
Message-Id: <20261030140428.E835B9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12} series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb33d3beac6920b9e1b376f364e967e05f19e228
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases:
    - 5.10.271 -> 5.10.272
    - 5.15.222 -> 5.15.223
    - 6.1.189 -> 6.1.190
    - 6.6.158 -> 6.6.160
    - 6.12.112 -> 6.12.114

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d6e4b01617..9ebc2cd41e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,7 +139,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 07d83b026b..fb733f1f35 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
-sha256  9eb33173b0e04e898d431587c78c47ee6e19e3fdf2ea007323de82af14bb2a4f  linux-6.6.158.tar.xz
-sha256  3ec834a2fefc9a08aac62f993525d7acd10163db6f01d63b4549cbff3f5c9439  linux-6.1.189.tar.xz
+sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
+sha256  b24c40a9e2188695803358567edda51c4080176424a57dbefca45e5ac44ec225  linux-6.6.160.tar.xz
+sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
-sha256  a1b8dfbc0c533694d474caeb156cee47992781e6832ab108bd4266b48ccc252f  linux-5.10.271.tar.xz
+sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
+sha256  e7e6e7db0fc009fa223ed10bb37be059042c463593f35f50b5c5cc4a70351614  linux-5.10.272.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 54ddd5d62f..8003243b0c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.271"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.222"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
+	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
