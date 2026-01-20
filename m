Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0990AD262A1
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 20:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B63A181E79;
	Tue, 20 Jan 2026 20:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uk0jaL6_3aKp; Tue, 20 Jan 2026 20:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4D3381E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768941653;
	bh=y2u/LavUTwvxFJ56l+4ryspPiTLjaZ8MnZKjIRm2hU0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y0xyr+5NWeiWBDEI1kIowDzK07LDuTdfJXxFg7TqW748atOeB3dQRGpe62jM/x04r
	 qojZ3M/RTKXvOmpnH52Zfha+hoYurVWXg77stNTEGjg6y29HX4sg3hbGnwpaFDVG+K
	 v+BQG98guE7on0sIL8v9d3l0iagxNnQtyEl2P9LD4Jj68/wizyuBqJEJB7tYH4xTZL
	 INzE9J5o/TtRUoryLudbsV7t5tgkKErdsa9+BUBgIKFxRMshoNDVlR9jMpztBlHck5
	 wWoF+jQkdbYVgPYHpsQCyy2fh+CKsi2FMiuhHJ/RoDwE/4+2zjFR7sSjTjmnuRcygW
	 bnCkGOMoCWKjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D3381E3D;
	Tue, 20 Jan 2026 20:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99D16122
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88C8D81E3D
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqQWnro6neOb for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 20:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A4681E3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37A4681E3C
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:40:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13AFB8872C; Tue, 20 Jan 2026 20:40:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 21:39:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aedf131da66d2f2ebce64788deab07be17ce33eb
X-Git-Newrev: 4fa6ab7b8f3091652af03093e48e9c1bd1291b96
X-Patchwork-Hint: ignore
Message-Id: <20260120204051.13AFB8872C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{10,
 15}.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4fa6ab7b8f3091652af03093e48e9c1bd1291b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 1f9256c27f..a3e621f38d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -4,8 +4,8 @@ sha256  ba3897a1c060b05a03cb4dda6f20d8c75e6f73c88b217744823a915056536eaf  linux-
 sha256  76af9d4fce24cc5a1c9f1fcbba2e23c4e87bbc8e20525b1691206801f24d14ba  linux-6.6.121.tar.xz
 sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
-sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
+sha256  5d4c0994580dd3bbd5ffc5fcb81c22dd305b844c9d8c7b176cc41b28f7e29743  linux-5.15.198.tar.xz
+sha256  b5e6e4f1f904a3377dde32ef3bc322f03a78f045c4d666483d383153902de005  linux-5.10.248.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 04dce45ea5..dcf5d46505 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -456,8 +456,8 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
+	default "5.10.248"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.198"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.161"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.121"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.66"	if BR2_KERNEL_HEADERS_6_12
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
