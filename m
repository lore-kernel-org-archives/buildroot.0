Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD765606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZvAHWZz7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A648198A;
	Sat, 24 Oct 2026 15:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACf6_fsRdJw1; Sat, 24 Oct 2026 15:01:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 95A1D81911
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854068;
	b=ousZlqqa/pCcsm+wvQxey9P9ZyJ689yDD5wGyvr6gGzaQaVblhh7W1Gwa1F5OzbvZBA4
	 ZLimQQNypRzw90ABqMNnnhq44ShpMbi7zSuH7LBNLwC1LzBNIS01epqI1FfPqeSou2puy
	 89dakge1UveZYDXPuxkIeB+tBeN4PsOrN/giCosTaxEYdUMjlQQG2UPYTJX5kWW2g/DJ8
	 RqriSlUk5tT90U6ajsqdGWfBbCI+KBdZIT0tv/zYAPlhuvFz/RCm2+3ExTqzCO+8kCwpe
	 POFdAI7hVdZLD6Xx7YF4EUhP1ZIMV0wkFTHUz9HuGsfZ5yG8ViLxX17xRTqIfFfGDsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DItEruCKDF+wrcxR7dEVdFxcgfPIYtGjSvi3p84IdmY=;
	b=h7VNzD3DwXDd8hKTcf/76xcj4EvlZEXjYsEUFCN021Lp4jVeAClH568F8Uflsnr3xnQH
	 pzKcwt7aJ7Gj5vEfhsvCbVTPc3qUQtUwX3tMsGeHHiSMWuoXj2eSSCP10fxxGVFEIZdFB
	 LEC9sRBFjxI4XOUG0n/BaupnUOD53q1KDihZXa6dJhq/qN6c70g1nGQTV1cRmu6dpAaWZ
	 NWjoDtJhOQfK8L+7r3HahaJ5GTCRiHmngRmKV0uO7kd6iyM7efegrCaBjpWbgQmeIJsdN
	 1qLVkkNgLawl7cLKkGl6ShVS/ZSpj2kteYGGnxmqmmZBOhnLcEJSTr4xhU0wIMB8nng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854068;
	bh=DItEruCKDF+wrcxR7dEVdFxcgfPIYtGjSvi3p84IdmY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZvAHWZz7/zNRKFs85BTleyW7gMelehM5bw9a8frB6dih55SShd6H5DLOLcNP1LgiZ
	 ZqguRUjbpkRGN5ph15+ZJHlon65VRQ4Y+OdcVF+2RUcsblSfSau+RHBbb70wPLKBv8
	 d0xaZsvLMvQ0BFkWCjOQ2ePQMIn6GNfaAwNrhA4LzncuTJI2qiFxWkzqka2Z3Uy9ya
	 DyLu+F9Q9vL0H+PP6J8E1gNDiSOkL1/Wk9bXtwI6LEpayaYMh7foqM0gTM9F1q0/+0
	 8u6CZjl/b+pmym9tNABYypxuitapfipWMUKQ8CpIi4AZyfPm0akgggwTZfMdLtMLXG
	 pfl2e4vDGtwbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95A1D81911;
	Sat, 24 Oct 2026 15:01:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8BCCD32
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9DEA40978
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrqyIKSyncPW for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E5F6F40A1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=TTM1lQNO+OaLRpK+J9YYMKHlXzWlICOPxAb6rce2eylYUkjheVe1QXPvx/y/2+onkuKY
 g2PvwSV3yXNm6xClsbIdh/K4YtsTCAL5zKK+K2oKpZ2A/lJPlzJmTajEkjGYSasKehp4l
 7W4g/2+Ko03UHOGBekoKJGa2/j4eq913F9WsBX/8O6oxUv8s6W5aR/LU+60BwrxGHt3+w
 TMMLEnvTlWZuFKz3iNXN4OTrKgufQfdTjj4+lp3OqUr63CarFIyFajq2hKJxMCX4MTpBF
 rqOd1qPYtlwuTFEUpky772l8hhr4oAd+41vADHee5Z6Z5F7Mc8UPhbIkVPr7WW+V9kA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LT07Lmed2jM8ygMy93bXFA8OTDPu545mj5/KJm7ZxDg=;
 b=sT7Ev3V5bOkFQGar1mKSqGiF+YkJYamoBXFQ743YOmgfgoraXcm8u8yAGUKje44ipeft
 fsxvBWand2Fy67ZYSg5Lip1lh2kMVEFNiFfVB08GEqeNvzp6RVOvpoOAz/R8Vlwki2rX/
 bMJgsaHNn3xNvSlv3s3XKgzN/K0AEq813MnlG2cir+TzaQNjxtw86XjCvJFz94uLyMAh5
 qgC7MdxQN7li43O2I2EXdeX2qTA0Jq1/xjpJD6OajUgGYXtJDOTkaXMpV4UzhaVVbrCqG
 4j6Ax3Yi59WZP615M9QZjaudulWyorC4maD6unEVKnwTnp4N98VjWT4H1F+MgzK2LdA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5F6F40A1A
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA6BA9C7E2; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b74b954c084d41deb87bfacbd9cf98f976eb1a0
X-Git-Newrev: 536265f780237301fdf8df7c9ffcd1fd89d6af56
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.EA6BA9C7E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-shellingham: add host
 variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/536265f780237301fdf8df7c9ffcd1fd89d6af56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-typer, needed by the typer-slim
dependency of host-python-jaraco-text.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-shellingham/python-shellingham.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-shellingham/python-shellingham.mk b/package/python-shellingham/python-shellingham.mk
index 7e07606714..7253774dc3 100644
--- a/package/python-shellingham/python-shellingham.mk
+++ b/package/python-shellingham/python-shellingham.mk
@@ -12,3 +12,4 @@ PYTHON_SHELLINGHAM_LICENSE = ISC
 PYTHON_SHELLINGHAM_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
