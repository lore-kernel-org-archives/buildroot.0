Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F50D60CF8
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 22:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0279A606EC;
	Mon, 18 Nov 2024 22:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zbqk0n5QdYQ; Mon, 18 Nov 2024 22:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB7F60719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DB7F60719;
	Mon, 18 Nov 2024 22:40:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F74E27EB
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 22:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29F314022A
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 22:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DJOK5GX-ZH2 for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 22:40:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13A3740179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13A3740179
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13A3740179
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 22:40:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 51CEC2003C8;
 Mon, 18 Nov 2024 23:40:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46998])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 18 Nov 2024 23:40:20 +0100
MIME-Version: 1.0
Date: Mon, 18 Nov 2024 23:40:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, zer0@droids-corp.org, robin@jarry.cc
In-Reply-To: <20241117201744.31404-1-vjardin@free.fr>
References: <31efd2663d1b8e193e49c0cc76113384@free.fr>
 <20241117201744.31404-1-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <f878eb52507a883446a6a4284656b9ef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731969624;
 bh=FdjTMGx1FX7jYl4hROPU8TGoklmn3MoBLbmXGNBkBr4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NR6ee+XRM5JhTDKUe9QnpiUWyLM2e8TgayY6k60CRLQ14l6f8fdFp+mn9O89l0qT6
 /xdv9RV3apcCco9skMxMIRuq7pZa8Q9LOzu/rgw8AgP7gsCDmefsuFhH+O3L05ACpg
 IA5yTrQaWhStod6DZgncJdjcD4Rt8xxE8EtzdeY42uwlpQq+BMEiyoXZNOVWuWW49f
 txN37RQR7WR9l0/Jw2U8IrbCMR/IJ4kfGWXTrgwp0KMrw3483cV+MCBqNliKXouE4v
 jqeOPt8qsd5byx7kUgjUz01Q1Zrowv1YtVkpglKBRguE7dmthE3l57u2dSGXj/25lc
 Z4rUUVpbg5N5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NR6ee+XR
Subject: Re: [Buildroot] [PATCH 1/1] package/libecoli: new package
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

Hi Vincent,

On 17/11/2024 21:17, Vincent Jardin wrote:
> Add a new smart library for CLI / command line.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

I applied this patch to next.

After doing some testing, I had to rework it a bit. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/ba65c4dd4b0745eecd5692bbeba82907cb0df5eb

Now, I'm expecting to see a patch proposal for dpdk/grout ;)

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
