Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0232606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nRlQstrU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7C7811D2;
	Thu,  5 Nov 2026 23:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mLSx-ak5hyA; Thu,  5 Nov 2026 23:19:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A566D811BE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793920767;
	b=YGQjCTvF2+pG/J56pu69OPGJSl0bPSYfrZo2V3UbWhXZvTm9xzQkHIwKaQ9gDOZQReDb
	 Il8qnUzEGQssyVcKb9K0YaKMa5MpVfn7aqLjAuX1+azGvternS1+bw1KefA2mWY4mP9rf
	 eALuMMSb94u33qcwgBDrGkk6vi6pYNYJ6vZUfeV+2P5J2tKbG2JaRPp00k11A81+H5PoX
	 1b2MyjVcBlidx/yYhdM6gHfvPPhZQsDU2vEVxmqTK4pxKdgx5DksuVoeYUEUrBMfkZ7P9
	 gKmRo33zywvjQ6LrewTtSTvne3pJHS70JHj51cpELPj54wJypwHoJ2N+9BGOnJCPTOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793920767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3Kx8S3u18lee9TmBqBgGkqr8WpH2JWwHV2qU5pMgXGc=;
	b=KMkrq+eYS2tRiF65OgxQjzqjgGsm1xO2Vg42MeqlYIPjVsugQlp5i19nGAKGU49siaGd
	 QBU69PSd3/sHiBzcYg5KVKXeRu2hGd2AqLCso2riallAzSX+m2NXBOSiAI+0IxKr6m7pQ
	 29C9nsMpDjj9kH7loP/gG8NjxEsVYW6o1btXN4q9x27jd+TpQJEC8hkol1hWKkG82vFQG
	 JTgYncaQaW66BaBJ4DzeGmW/AubFfaYTw20DMpB0DcQkBTHkRaWGQafMzXe9l6dt9/oZv
	 knW9kFuf/hf1+i1QomNTjEAt+NCYKCsiv39hzIJnQNR+QkWOeX7hNyAvwBBMUVK8O5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793920767;
	bh=3Kx8S3u18lee9TmBqBgGkqr8WpH2JWwHV2qU5pMgXGc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nRlQstrUtUWVON5iWcL6GaWBBVFYUQl+2bExVAkR9mQoTj0+63UOfXaQRMekxQohq
	 GQWhCPa4xc+bA4CLfW3a4KRKU2ID/1NGSjeoDrObgXJ4MdvxSTuY6rwgYdkFOpb340
	 AOjrOdtm2tGHx2buZ2hpG8nj62Lw5tGJXeW3B0YYScYfvzpslLgrA8QgeJihOcHLvz
	 8y3xVPHayi1hgVhqysqjfmCfX9Xt+Jzxb+qSxutxlFsPxAHYG9mNPGo47pBpm8knzu
	 qv6Z3mG9cDCsseQSEuTvbs/6O3Mtq2APLHEDUdp8FVUNC6UqXR4kjpySfMdWbd2wcB
	 +wx891grFkc+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A566D811BE;
	Thu,  5 Nov 2026 23:19:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EECE209D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54FEA811BE
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yL2bMY3-qw2Q for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:19:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8CF0F810DB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CF0F810DB
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:19:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1743E7FAEF; Thu,  5 Nov 2026 23:17:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 00:16:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a75cce0723bd51bae00158e0495e8776aee84b27
X-Git-Newrev: 2a7f1cd07a0412d28324c59c2d65b6eafc2abd89
X-Patchwork-Hint: ignore
Message-Id: <20261105231754.1743E7FAEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 7.2.x option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a7f1cd07a0412d28324c59c2d65b6eafc2abd89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 7.2.x series is now EOL upstream [1], so drop the linux-headers
option and add legacy handling for it.

[1] https://git.kernel.org/pub/scm/docs/kernel/website.git/commit/?id=f313b691bd2bab92dd9cbf1bce2460bc75cf5a81

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/7.2.15                         | 1 -
 linux/from-6.17/linux.hash           | 1 -
 package/linux-headers/7.2.15         | 1 -
 package/linux-headers/Config.in.host | 5 -----
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a28c8eeef8..0ee4d04751 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_KERNEL_HEADERS_7_2
+	bool "kernel headers version 7.2.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 7.2.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_RTAI
 	bool "RTAI userspace has been removed"
 	select BR2_LEGACY
diff --git a/linux/7.2.15 b/linux/7.2.15
deleted file mode 120000
index 74e2b2d5b6..0000000000
--- a/linux/7.2.15
+++ /dev/null
@@ -1 +0,0 @@
-from-6.17
\ No newline at end of file
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3eabe22c9c..4350130ceb 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231  linux-7.3.1.tar.xz
-sha256  d0f6b1d7324c937ccaeb5c4ca7084bfcf71db2edb3e2d3a31f0ad83a681809ab  linux-7.2.15.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
diff --git a/package/linux-headers/7.2.15 b/package/linux-headers/7.2.15
deleted file mode 120000
index a4e1d3ec9c..0000000000
--- a/package/linux-headers/7.2.15
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2080c909cf..71e2265f4e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -52,10 +52,6 @@ config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_7_2
-	bool "Linux 7.2.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
-
 config BR2_KERNEL_HEADERS_7_3
 	bool "Linux 7.3.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
@@ -488,7 +484,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.15"	if BR2_KERNEL_HEADERS_7_2
 	default "7.3.1"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
