Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537FAC02183
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 19:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA1C417A1;
	Wed, 15 Jan 2025 19:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKy54IYX7sA3; Wed, 15 Jan 2025 19:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA394417A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA394417A4;
	Wed, 15 Jan 2025 19:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA11E94B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 19:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB5B084071
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 19:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tH5s6__witx for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 19:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA67984040
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA67984040
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA67984040
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 19:59:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A0C8E13FA3F;
 Wed, 15 Jan 2025 20:59:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46416])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jan 2025 20:59:30 +0100
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 20:59:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>, Sergio Prado <sergio.prado@e-labworks.com>
In-Reply-To: <20250114-fix_curlpp-v1-1-24daadf0f798@bootlin.com>
References: <20250114-fix_curlpp-v1-1-24daadf0f798@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <df0f46f55b77c0cb7b29f3bdc31399b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736971175;
 bh=JUwUYPo67qhlyrlbJWyKyAI2n1JstulJEgAhAVXnQrM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Psp1f0VOTJ1oXnc4ez95phWqD0khiFv//ezewMJJfl/eNl4hC251Tc30suGvU4ati
 l9x2FOCXXqIS18+TZZGL3FPPYtkk3obOeH0+ehCJzuMJ960ncjMY4Ijsi1ClztSR6d
 H+Bcd0bIEBtdN1ABkQc/2c0HbPjqutEGpueKEeeaN3G0bx7wxYsmB8leuq1y/ze1tz
 AybXN1+oZK+DzjSjwIvTBO9wgDgzNJbn4C6OIlvx0aUdQD1D2MYQQP7soYU5HVFAOS
 j9PLpWi2MipEpmfhDg0TGMhvi6nPm236uDYm/YhDZ/+Apn+RF+Sb4hxW1EOTnTXLZX
 O5/we/WGfp/lA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Psp1f0VO
Subject: Re: [Buildroot] [PATCH] package/libcurlpp: fix invalid conversion
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

Hi Thomas,

On 14/01/2025 20:44, Thomas Bonnefille via buildroot wrote:
> Libcurlpp is broken since the bump of libcurl to 8.10.0.
> This patch backport a pull request from upstream to solve it.
> 
> Fixes:
>     
> https://autobuild.buildroot.org/results/4a4d3b248898f0e73620fcb1a7a94dcfb6e6866e/
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

I applied this patch to master, thanks!
I slightly reworded the commit log, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/f06c28d1afef98e80f358c35ae65e035aa64f6ea

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
