Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80684CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 21:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B7BB82EB5;
	Wed, 27 Aug 2025 21:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0thzS0tklCy; Wed, 27 Aug 2025 21:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89EDB82F9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89EDB82F9B;
	Wed, 27 Aug 2025 21:27:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEA32114
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC797407BB
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gabIj3pczXqX for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 21:27:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 255DD40789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 255DD40789
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 255DD40789
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:27:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1C89CB00563;
 Wed, 27 Aug 2025 23:27:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 27 Aug 2025 23:27:46 +0200
MIME-Version: 1.0
Date: Wed, 27 Aug 2025 23:27:46 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250826231121.135117-1-petr.vorel@gmail.com>
References: <20250826231121.135117-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c2479bc5ed854de7aa2eefde3457063a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756330067;
 bh=wATzy0WMTruaUsdD74RG98JJgZ1FxoAMj6xu+PUJVSU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sRrk2j7MOoSkSKUvsNr+fF8e4cWyxTsiAPGcnTX00MASHTrpsIKMoyx2c4KGOj5ui
 3BAWTIa0+MEB7QDCio+TbzdWnj9GMBCqP3nEWLm5r4V46BiBD21W/uBMh602WlqqYm
 /VV7g6agdviPLSP9ONyGOY5bsUHwvPsOcAjSyTHxmv2Xm0Qy6I02LXpieG8J4tk+dt
 CyvCR4zt3Uf4zTAP9g+SfhFhz+d2XNq+Q8Zb37Ii6BSey4xLTyQI6CpovPSJhRq71U
 nTi+CaACI4lHW1zbBVAVQpqRWbMMz7YTjzXwVA6UiZyK5JfnYRdx+VRnQzw/3TbWB/
 wYNXdNkHtAI4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sRrk2j7M
Subject: Re: [Buildroot] [PATCH 1/1] package/nftables: Bump version to 1.1.4
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

On 27/08/2025 01:11, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
