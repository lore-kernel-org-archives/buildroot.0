Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E46DCAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8C660DE7;
	Wed, 17 Sep 2025 16:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fo5rq5w7BC1A; Wed, 17 Sep 2025 16:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1672461220
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1672461220;
	Wed, 17 Sep 2025 16:57:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88080279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 792E240716
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5Rm_QafNvl1 for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:57:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 69E9D4020A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69E9D4020A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69E9D4020A
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:57:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6B3FE19F57E;
 Wed, 17 Sep 2025 18:57:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:57:51 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:57:51 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915202737.1513190-1-james.hilliard1@gmail.com>
References: <20250915202737.1513190-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d2964fc14fd9b29cb49714419596f08b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758128272;
 bh=SZuCQMg5UvGvjyPhcSZJ/zoX4vL7pTZONxyXu4PH7C4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nDniuCy9Vyhllx+KskhDN3nB4Ow+o98FxYAoCSR2HKsOeA7pMycDWLU2oKa1UiTtY
 2ypfq/ff+YPWUAqYX4LHwXP5tB9+zYMxgmGy6rB2dV1rRVTVcS5qABoPkQaacie9GZ
 Zgt+4e24krMB98/Q79oKoFnkE4H1yoV15vVakmqqoHI0WyQKbBHSlTeqpYqozJ4n7n
 eblo8qYGfLI4in5/Fh4z9T0MhMrtfBBQwzwnQ7r0tj93mGZmGtZli1ABdR6xJWUU7z
 1yEi9foZ/nqzUQy5A157iV0j5+lh/FNOKlWY7M+UG7fgVdiEVCrbgP3iy9MqpMQOtv
 i3PF9NinyxZGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nDniuCy9
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: remove python six module
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

On 15/09/2025 22:27, James Hilliard wrote:
> We dropped support for python2 a while back, as such we can remove
> the python six module which was only needed for backwards
> comaptibility with python2.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
