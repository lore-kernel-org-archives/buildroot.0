Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B8ECAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 17:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA5FD8408B;
	Wed, 17 Sep 2025 17:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUPGKKGifTy4; Wed, 17 Sep 2025 17:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E25E983FF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E25E983FF7;
	Wed, 17 Sep 2025 17:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28D72AF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F73D6119C
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_GAefwzgZUs for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 17:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A66A61134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A66A61134
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A66A61134
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:19:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 276C113F88D;
 Wed, 17 Sep 2025 19:19:02 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 19:19:02 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 19:19:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250916003036.2506534-1-james.hilliard1@gmail.com>
References: <20250916003036.2506534-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e334751a5a70b13d39c4cb67e47626b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758129544;
 bh=sT6HpbOLmxUdWgISIgGrLoMRWY+qTexG5+LrRVzhfj8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f0L7pUuglssLA1+3jfLMZ5ywVWpZSyJuQd/rWwZFSyUsdagNxD9E7hSczFhiAkWsr
 P83OYtFegYUlnrGYH0bIKT0r0C+4oJLVpefR8Ch0DoKss49KHeFVUi+h3uB3FNr+OR
 WNtocJXXRQFjAZ0w61XJfp75LPBoSovkwqEi+562dd99FUH4S65GMu6ITMNRhAUPjq
 9Nx1sLii7v5hxsN5PJH6X3T4cvbJyLIe4x2sWjNl0Ql+jb23OerS0+hnMh2PB6JhsU
 r+AbNNxfnVXxcHmmJakqtpazWoJx4P66YfkbABuIz+zoEwwdaz06bOu5UEUSawyLpr
 obQk/KH7dbLGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f0L7pUug
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.39.0
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

Hi James,

Thanks for the patch.

On 16/09/2025 02:30, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[...]
> diff --git a/package/python-pydantic-core/python-pydantic-core.mk 
> b/package/python-pydantic-core/python-pydantic-core.mk
> index 5085b906d5..7342711b2a 100644
> --- a/package/python-pydantic-core/python-pydantic-core.mk
> +++ b/package/python-pydantic-core/python-pydantic-core.mk
> @@ -6,10 +6,10 @@
> 
>  # python-pydantic pins an exact version of pydantic-core in 
> pyproject.toml,
>  # make sure to sync pydantic-core to this version when updating 
> pydantic
> -PYTHON_PYDANTIC_CORE_VERSION = 2.33.2
> +PYTHON_PYDANTIC_CORE_VERSION = 2.39.0

This new version breaks the runtime tests. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2045487786

Could you have a look please?

It is likely a missing runtime dependency. I did not applied
the python-pydantic bump from:
https://patchwork.ozlabs.org/project/buildroot/patch/20250916003319.2510050-1-james.hilliard1@gmail.com/

I'll retest both bumps at the same time.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
