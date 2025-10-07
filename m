Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDB6CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 20:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1F140A7E;
	Tue,  7 Oct 2025 20:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSwvv-4Kk9vT; Tue,  7 Oct 2025 20:08:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3598740A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3598740A77;
	Tue,  7 Oct 2025 20:08:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9245C9DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83C6C60AE2
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SA6yb4Cw0Gj3 for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 20:08:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B73D260AD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B73D260AD4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B73D260AD4
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:08:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EBA23B00539;
 Tue,  7 Oct 2025 22:08:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Oct 2025 22:08:19 +0200
MIME-Version: 1.0
Date: Tue, 07 Oct 2025 22:08:19 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, David GOUARIN <dgouarin@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20251006165100.1888278-1-dario.binacchi@amarulasolutions.com>
References: <20251006165100.1888278-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <545c221a038071d1e95a2b517884d923@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759867703;
 bh=s6jarO2yRAaPmz5u4ZUqu6HR8FX84f6b7Ow3DjF8SyU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ALQ8wo21EvK3ksfW23mpKVYf8Kdu55LHx1OTkis6pNss27VLKw0HQhzZ/I21iuUqg
 ZN/+Wr5KwGlnYiqWjdmmYNRaG5awhsChtqu2Lt40bMjrDrLaJYEA6vfkQQlDgb1lcp
 fwVrWM+7/M+yljfLftWuCOqajGjNlyEWhNVo/LwoE7i92EIJmbxsp6keRycEGazzWG
 vvp/GnrA/PNuvTYP6WW/z8Di4SWxwzXi/+p/ovpW+YGgI0BvprnlJ1Mqof4G3aaVOv
 DV4HMhGtWWP1dO3ewrWpFEW9zKCPRtBrUKTeoM5tIuumKYJ8fa0aS6smLV5YjvO6nv
 kE1/CvhkpX+kg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ALQ8wo21
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: bump to
 version 3.2.8
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

On 06/10/2025 18:51, Dario Binacchi wrote:
> Release notes:
> https://www.freeradius.org/release_notes/
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
