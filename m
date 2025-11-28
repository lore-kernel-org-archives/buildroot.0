Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3589DD116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BBBD84146;
	Fri, 28 Nov 2025 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DP4591xQVp-I; Fri, 28 Nov 2025 21:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB1784055
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB1784055;
	Fri, 28 Nov 2025 21:10:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE00708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3975D4190A
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGK1iLZXBtr3 for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 21:10:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A54141908
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A54141908
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A54141908
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:10:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 08EEB5FFA3;
 Fri, 28 Nov 2025 22:10:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 22:10:28 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 22:10:28 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20251125110419.947350-1-giulio.benetti@benettiengineering.com>
References: <20251125110419.947350-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <022f528ebdd20e744165ca96ba69f7d6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764364231;
 bh=ptJOUmQPbHwMjC9ojhCG2ZV/OCTofNPebrwmBgrRff4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LsKI+vFEHubch07lhQ55y8bhrSnzIM1f1gKHhV4HAGPvvWNOITEX6Lwtztbbj0e1b
 70l07Hfu1OTBGNz8zAQo1JOp34/qFhjF2uBpZumRYUgLdryzpctHPZbbJlSMY0MdCd
 S8U+cUBtOkD7bdBabqw/t8uYbVqZPww7JiqigodKRPg/REwd/IidSp/JlQN+A17eo/
 lw0q+esX604bDtKiYw9D5pRztU/0ndSjbtonR0Iy8fb+RAuVkB8ovhuDuBdGyyfxz3
 +JaqCCrpj33muYu7sk6/6QY3m/IzBEotLIeFTKWFlfso84hOmimvs98I859sijZrND
 3wh8HWEFA/9KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LsKI+vFE
Subject: Re: [Buildroot] [PATCH] package/mongoose: bump to version 7.20
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

Hi Giulio,

On 25/11/2025 12:04, Giulio Benetti wrote:
> https://github.com/cesanta/mongoose/releases/tag/7.20
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I marked this commit a "security bump", and applied to master. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/f536fd4a2e883309ab2fe97532fc94f608e31de1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
