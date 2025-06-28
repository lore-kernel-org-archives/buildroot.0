Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4475C7EE39
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 20:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95FB760831;
	Sat, 28 Jun 2025 20:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rp4pS9g-TN9s; Sat, 28 Jun 2025 20:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D009960808
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D009960808;
	Sat, 28 Jun 2025 20:29:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 823F8AF7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7335740E9F
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdBHRxPgxR-h for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 20:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7865C40DCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7865C40DCF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7865C40DCF
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AFE46780333;
 Sat, 28 Jun 2025 22:29:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 22:29:25 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 22:29:25 +0200
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Martin Elshuber <martin.elshuber@cherry.de>,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>, Quentin Schulz
 <quentin.schulz@cherry.de>
In-Reply-To: <20250626-strongswan-misc-martin-v1-1-a4c4da74ba9c@cherry.de>
References: <20250626-strongswan-misc-martin-v1-0-a4c4da74ba9c@cherry.de>
 <20250626-strongswan-misc-martin-v1-1-a4c4da74ba9c@cherry.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <e38797b607fbd58de070648e6dce9a22@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751142570;
 bh=a+u2OslsZcJXUgNGRUUiQ//tLThGXZ2yrT6nE3aHldM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tkXzDcTrvHXcNR5AiNw7ZMzaINY/LIbN3VphPO8Aww8B6r7ucCWrER+VS7tP/SByS
 vx5jVVUEMVw0N/ravOp53ooH2xYUBiKzdJbrm0crTf8Ab1+CUYtEptGOgF8HF+Yvgk
 mIAms+brmj9vIMg0fuzGsPY+X1bWKMCuxN+qE3bSPUGOnmRBDxtND443I22BNw5vZ8
 mluWef0KhhaTerUKO9opIp3yvUUEA8/SP4szYCBVK+i8868P17ZZ9rMOSQsvrj8tHF
 B1KebmQf8H/j050A1UZyHzbNGB81Zp3CdsvbZAluZB0FUFEZofH6o9y+Uj11iQbUDy
 LYIXv+AHLXMnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tkXzDcTr
Subject: Re: [Buildroot] [PATCH 1/3] package/strongswan: allow to drop
 unneeded capabilities
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/06/2025 13:20, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> strongSwan allows to drop unneeded capabilities[1] after the IKE daemon
> has been started, based on libcap, so let's allow that via a config
> option.
> 
> While the "native" (capset) way of dropping capabilities is supported,
> it is deprecated so its support is not added in Buildroot.
> 
> While the documentation specifically mentions the IKE daemon (charon) 
> as
> being the one impacted by this change, the ifdefery with this autotools
> option exists in various libraries in the source code, hence why this 
> is
> kept independent from the charon Kconfig option status.
> 
> [1] 
> https://docs.strongswan.org/docs/latest/install/reducedPrivileges.html#_dropping_capabilities
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
