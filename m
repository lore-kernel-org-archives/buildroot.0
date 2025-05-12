Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5733C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2D3840C00;
	Mon, 12 May 2025 21:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5_oN4MLvvuH; Mon, 12 May 2025 21:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E134740BF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E134740BF9;
	Mon, 12 May 2025 21:18:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 048A1150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01E6B40027
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsta0CW-Sv-y for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 585EE400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 585EE400FB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 585EE400FB
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:18:22 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6268D2C84448;
 Mon, 12 May 2025 23:18:20 +0200 (CEST)
Message-ID: <658d2e40-0e24-48d7-babf-cce6c7fe6d15@bubu1.eu>
Date: Mon, 12 May 2025 23:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20250512132735.1251491-1-buildroot@bubu1.eu>
 <730bc5d399c429ae1cf212d945c5e6e7@free.fr>
Content-Language: en-US
In-Reply-To: <730bc5d399c429ae1cf212d945c5e6e7@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747084700; bh=iHONsKVDzonAb9fy+/3vo/Bm7g0pp5muBm2s7QeeAvY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=XM/jBZPAEHcctuddy6Qxi0QmV91wyjhqimLrvAQt91outFlImnYmhI4fLCgWHLzF2
 pmNozlGJzlqyFFDqKrfXmmy1qoUbkO5CuFZ07xy8jKSagyOoeDRZJPGHx9fwBCAISL
 iJUqEpD3r30sDFOuZyQO/V3zBB0dhPSe6gWlI28zjIkVQp4+Px/UOQ/3wPFDH1NRQO
 5ZX/aCbV6ScnoXy3QMRK+JyLXH75waup1lXhrZko1pJFnwGJPOKYv/3biDkp7pkiyM
 n2kWJi+jPPGoDNpATFeYz+VfAyd14FLvscjegTnTAJNW13Duvue8tzPs9OliTeZxJ9
 xNukX6ibgqV5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=XM/jBZPA
Subject: Re: [Buildroot] [PATCH] package/python-dotenv: bump to 1.1.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On 12.05.25 22:28, Julien Olivain wrote:
> Hi Marcus,
> 
> Thanks for the patch.
> 
> The archive download failed (with a 404) when I tested. See below.

sorry about that, somehow I forgot to build-test this particular bump.
Resent as part of the pydantic bump series (as it's a dependency of 
pydantic-settings).

[...]

> 
> Could you send an updated version of this patch, please?
> 
> Best regards,
> 
> Julien.


Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
