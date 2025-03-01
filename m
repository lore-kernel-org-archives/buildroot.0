Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2CDC021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 17:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 142CA84A37;
	Sat,  1 Mar 2025 17:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAu8C6Tdi-2p; Sat,  1 Mar 2025 17:16:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13D384A22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E13D384A22;
	Sat,  1 Mar 2025 17:16:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39307181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 17:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 265C446DAA
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 17:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCsTyWKmFvka for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 17:16:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F32F540C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F32F540C30
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F32F540C30
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 17:16:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A83FD7803A2;
 Sat,  1 Mar 2025 18:16:35 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 18:16:35 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 18:16:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250301142619.72570-2-gilles.talis@gmail.com>
References: <20250301142619.72570-1-gilles.talis@gmail.com>
 <20250301142619.72570-2-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e85f5aea2c67d8cbd0839615e542d0b0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740849396;
 bh=Oohq7nHS5BNkxLi/ahn1ukhXaVf1ckQcmv8ycgQ+Fbw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nrQ0CUZc53GSclJo+kxPsjZ5QJzvWL6ublg9h6/ju0bYdv/sSEnpf9xFtl244Qqum
 Py69lynXonP95QtaZlnUvQT6l4vGiwYCvq+RaTFLMRI/zvZM+iZkLS87ZQGuBNceTW
 ANNddWLsOvedYZTggxJjc6PSjyw2FOyWbBZp39hkA7j4Qoyc/dpiM3Iim33qKec1B3
 ZcQbblbZLS1ilOblMjFbYoMZ1c6+AAudR8XvGEZ8IGoPWz/r0FZsW+hso4J41qHsk+
 7hRN5IlxlTXc2NZBkJGyg6Kh0BNyYIJXEn0/cFxUHj9PiMcR/1CqVQUrRKEoMuYfyB
 dna56u94gaH5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nrQ0CUZc
Subject: Re: [Buildroot] [PATCH 01/11] configs/freescale_imx93evk: bump BSP
 components to lf-6.6.52-2.2.0
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

Hi Gilles,

On 01/03/2025 15:26, Gilles Talis wrote:
> Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.52-2.2.0
> versions.
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

I was testing a patch of mine before sending. It happen that
the series you sent is doing _exactly_ the same changes.

So I successfully build-tested everything:
https://gitlab.com/jolivain/buildroot/-/pipelines/1694690087

I also runtime tested on two boards.

It is a very good timing to update those defconfigs just after
I applied the series from Sebastien.

I applied the full series to branch next, and added
Tested-by: Julien Olivain <ju.o@free.fr>
where appropriate.

Thank you!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
