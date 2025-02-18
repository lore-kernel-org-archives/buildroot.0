Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA85C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 08:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6B3D41300;
	Tue, 18 Feb 2025 08:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3Rt31eB1nCV; Tue, 18 Feb 2025 08:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8933D41340
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8933D41340;
	Tue, 18 Feb 2025 08:00:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC305E05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C9E4033F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuRvpVh6fatQ for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 08:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96B6F405C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B6F405C7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96B6F405C7
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 08:00:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C34DD19F522;
 Tue, 18 Feb 2025 09:00:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 18 Feb 2025 09:00:11 +0100
Date: Tue, 18 Feb 2025 09:00:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Z7Q-CzIY1jLm0y0X@landeda>
References: <20250216170350.397879-1-yann.morin.1998@free.fr>
 <d0b96b79-52ad-4893-871a-025127a7e96b@mind.be>
 <Z7Ov6egJB6PjUBfD@landeda>
 <4876bbc6-4a3d-4b07-9329-7f5d4e9cf3c2@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4876bbc6-4a3d-4b07-9329-7f5d4e9cf3c2@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739865617;
 bh=sQxhnIGZlfrJmrlWtBTLUsHS2Ki/1ryIh/jw1Do9ItQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VgGQUNh9187bJi7odmXC2OGWxdTT5PnCZe7SJaXUjfNVJcunZjXPGhftRP9JEceVO
 helbX+C8rndCvndaP6QS4wO7qb4paMmtG7I9ekLVg4xZXy68iIYLDzZJV3jNMNPJZt
 eLolHSmkokBeTcebeOaQlUFXKQECVzaX9KdGygugTlCN3xVoQ2/vjZsWkDSowKSEV2
 /7i6hPkVqhebrmoiWli4bIrPXrfccgoC0qJHU56bOjYvNNaOEgKqivojUbp7Bv4YuA
 Utr6YsSjCqi5SDj8rCe7NmyKcoXBgS6uuq3wMuKF4fPUvk7r9TjCdrzHbphI2ulYeg
 2xhVU7GZKakrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VgGQUNh9
Subject: Re: [Buildroot] [PATCH] utils/docker-run: allow explicitly setting
 of docker/podman/...
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2025-02-17 23:05 +0100, Arnout Vandecappelle spake thusly:
> On 17/02/2025 22:53, Yann E. MORIN wrote:
[--SNIP--]
> > I would wager that "BR2_DOCKER=y ./utils/brmake" is not in wide use.
> > Would that be acceptable to revert 8aad67f1575f1 and drop use of
> > unbuffer? I've just checked, and that works (but of course, any
> > still-bufferred output could get lost on Ctrl-C, but that's probably
> > a non-issue while using brmake...)
>  Indeed, this feature was only introduced in 2024.11 (and very late in the
> cycle), and it wasn't documented other than in utils/readme.txt, so I think
> it's OK to drop it.

Done, series sent, thanks.

>  Myself, I anyway always have to look up the exact wording of the
> environment variable, so I wouldn't miss it!

:-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
