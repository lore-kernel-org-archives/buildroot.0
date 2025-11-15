Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1994ECEB2DA
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 15:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E062A83F14;
	Sat, 15 Nov 2025 15:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_7FRaDc2xjZ; Sat, 15 Nov 2025 15:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1026883E97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1026883E97;
	Sat, 15 Nov 2025 15:26:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27D411A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 15:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EB4883E97
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 15:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6uvPR7CmTOw for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 15:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DC8183E7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC8183E7A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DC8183E7A
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 15:26:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0193C13F880;
 Sat, 15 Nov 2025 16:26:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Nov 2025 16:26:38 +0100
MIME-Version: 1.0
Date: Sat, 15 Nov 2025 16:26:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251112220213.3737716-1-bernd@kuhls.net>
References: <20251112220213.3737716-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c60e53568620b4d9343912df297f4fd8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763220401;
 bh=hka0s2atV8ZTbk38pL2Yb0YO+lknpA1T6fzO21Gw3Aw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V3cGOhlW9OUmynhHdZtS5CYq9AM+61edCoZhw7nlX3ZOJvWlL1gpxMS51jDWZrAxz
 CBwj6Z1gaQ5bsHSdggQhnTMO3FnDuVPr/D3GSFmP2mhg2GA0ezNoBY6tdLHsABVWAE
 OKtuAOZJCwTN/V0xPo5VTjLjwwKDXr0laR6iUMn/MeEe+ircFInTj+u6aq/xcxFIXG
 mEvANWeWpEnI7/c4SmbcT2GZC/XipOvh0xrBPiRB5/XUmzoJJENJqGTtpUnAyXz5CD
 FqYn+gKt0hXVK3uEUbwWvo9B0gQw6MtGbgybobelW4oq4G/IMWDPXi2HcC+q6Do+9Z
 tOTlV1zjIJSQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=V3cGOhlW
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.7
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

On 12/11/2025 23:02, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2025-November/000828.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
