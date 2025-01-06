Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314C0E77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE722406EA;
	Mon,  6 Jan 2025 22:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1uRhJk0XWua; Mon,  6 Jan 2025 22:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE925405AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE925405AE;
	Mon,  6 Jan 2025 22:42:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 895D3F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B8E7605A0
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrflC49RwtTa for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:42:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A2D460604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A2D460604
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A2D460604
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:42:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 367F413F8AE;
 Mon,  6 Jan 2025 23:42:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43814])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Jan 2025 23:42:32 +0100
MIME-Version: 1.0
Date: Mon, 06 Jan 2025 23:42:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250106215514.1531389-1-thomas.petazzoni@bootlin.com>
References: <20250106215514.1531389-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <076d24c023cba4c78080f516197ed438@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736203353;
 bh=OTMgsghwsLNQN4c9RS/eYtKICCqIJKnflPa4+/aVpXM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WiRgn63PjkKvvXFzqTKghAKUTHxo2EbuPSruIgA5TiVCtDUaW/dRo73xvQvW3sava
 qx3UKApD4Nx6aY9mXUgDqPblCUFWqUXxfvwGQ4gVmsI00qC2zySlyoGXwu/h+DJ5JZ
 vYwzfh/HCkLPREnWP/cnbWhwfAl1bdDPSYIO5hWFk2yBfDQCSf0DzmzPW1wanpDWn6
 i5X4y2nuUhyX2RNP9YIuHgQ6D7m7rbnZD9X1q6tA8FLjWegEh57e4gnE6SGPE8MtQv
 gTTe8LYNa+KRnwNm+aLCwRzlTTCczwVT6jbNlDkTvCa6rvKmoh40WYZqiDErXi00Jc
 MnicQe2fGaubw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WiRgn63P
Subject: Re: [Buildroot] [PATCH] package/opensc: fix build issue since bump
 to 0.26
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/01/2025 22:55, Thomas Petazzoni via buildroot wrote:
> Buildroot commit
> 1f4b4ccde7ceb379010aeb93458792202622d64b ("package/opensc: security
> bump to version 0.26.0") bumped opensc from 0.24 to 0.26, and the
> build started failing with:
> 
> pkcs11-tool.c:7854:45: warning: implicit declaration of function 
> 'EVP_bf_cbc'; did you mean 'EVP_sm4_cbc'? 
> [-Wimplicit-function-declaration]
> 
> on configurations that have BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
> disabled (it is not explicitly selected by this package).
> 
> Our initial fix was to simply select
> BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH, but when investigating when
> EVP_bf_cbc() started being used in OpenSC, we discovered it has been
> in use for a while... but in code that kept being disabled from
> version to version as it was broken (upstream bug
> https://github.com/OpenSC/OpenSC/issues/1796), but it was apparently
> forgotten to be disabled again for 0.26 (the issue is still
> open). Therefore, we opted to continue disabling this known broken
> part of the code, and submit an upstream PR for that
> https://github.com/OpenSC/OpenSC/pull/3303, which ultimately will
> clarify what is the right fix.
> 
> In the mean time, this allows to fix the build issue.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/ca51b3e8e3ac83e2a69814caa84d9862385b956f/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
