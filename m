Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32030C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B5B60E72;
	Fri, 18 Sep 2026 19:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtWotGdQTeoK; Fri, 18 Sep 2026 19:15:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4161F60E4F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789758932;
	b=O/hbv0RaqyvOCdLA46W71cMUk+873mF2rNXJqlb5LPyRRmM7t4BkF/WzyJWVLzNuDs8J
	 HMl90MXyw+0/NaS+6rLtj4MaUhncdqPka2EPQtWONr5cx+2J6fJDrg7m8XmzjlNZvc36y
	 FlCcI7p2v+eGHyPTVBGxUCzqoclQMF2ZyxmvSGLYTQTPXrFRVk3RegeAkjCokuEwYj64N
	 BhPueF82CQRcN4AL71jH9+ynNIkXWGdkW3qgNO9xuBK+cN/WpccU670+sAl2rB+aieEBD
	 ChcjmWOfYSZf+9L0LXH80hHa6pBIMo4sBU6ywStaV7OXtHHy9ZRJwapX7iQJAmIc1HQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789758932;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Xy7VebBpiSuwLT4F5xs/UyGPp4z9Ej8DBzSdn1lryI0=;
	b=KjC9/8gDhH1MRg4lza/8AcRNSO4LyA8wBojuXJzvFBunUDYHiPJJtQGkjS5BAVdQOMIe
	 szhXBNycsMPTS3Ogj8KClzMfKkhFssUY8+qgUo8S7rFqOpYlPjBzGwOPNqlolFCNHFuKY
	 s6jDTmr1pOyO55+ZNlrwD5WmUBMoQ1dl+7mUWN6F6m3R+A5kXJAj+/XubmRRWIjRBXsBh
	 YlaOyEn+PiY3kVO9rptAxmJs12b1PFqej6C8AM0ikdPLo9KCtJt3snuiUunuYAu2KFjqf
	 WnKZSaMJaUB6xrAwwCiRxFVqSs7+gIBVwY28lD0r9xoPI34Zvg0rD7NK1RymYyNnkOw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789758932;
	bh=Xy7VebBpiSuwLT4F5xs/UyGPp4z9Ej8DBzSdn1lryI0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XxhlD95KQRnitRhb/zG/iZH6vHhrxU8lX/ui8CvzyWUUwWLy6f3ShuimN8ooDZPky
	 1jlLIAv6XEwWa2ix3tBh0le8GIQfkqYBF3fonpv7EID4vGXF6ENierdLHGsVFcsOGU
	 Kz/vugsYUcV2VJmzfASa7LQ60rNXZwBpbYDM3D4WB1OX7PNusbxCDkffufIuTszI+s
	 q4KRrlC/jxdAD42FRZmUVxiE2y6M2JZrh46fN0+bDoF+OZsuqJtbacb5xH19agLZzJ
	 dZl15eR0vyJPAJZdVOHAjkXUy0uLJI2UrgLBa9925SUdA/boPkL9Q89BwAW0nr6lfe
	 liR2IaTmbO1bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4161F60E4F;
	Fri, 18 Sep 2026 19:15:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D47BA224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C60E940B60
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ac6rQaZlMhe1 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:15:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 20D094082B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789758930;
 b=gaODSqTHTGwfW8Gzkl5n2ysO1DR1ZVrQ84Kky9CMkWF7LYJLd2Ejot+DP5AxBwMQL5ES
 AcZYvwIGB7hHZc5bejWX5hy/wUuPKTq0jDxcA3zB3KTjuaTC9KgeLDXYX3f5I/jckhT68
 YHHo39ZGOIWBSYL6JoIDuPwzr50XzhrTCvvXw4B2p98MEAQBKivsuW57kKMxFIkjf0r2p
 rfll0e+D5XZgrAMaPyztCMvdAAyq7scDBL2JPwNIQ+vbeDTCsMtGlaQSaE4j0IoWlAyMC
 ivhHbnf+C1oWCXMS6/dMToJ6kOSUyBTwCSNB6RRbzR68Roiudu1LoUKCV+IQnyWKDMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789758930;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=7WEKReT/gjPx7O+lE1gGXpCjllrfdX5XhsGaFxyhpMM=;
 b=TBT6XLnYUoIktSzBbz3WqHrN9iYQpz55vu0yRXUwwMtevswK6Gi2/5hdMMMbd3IBcZW4
 TkhPLl8uunn21QuK6fxxIHsFVKzoeCLzrXgfeedy+SE+SdGWlI2UYiv+T1NpNR+UcIulc
 aCVxsPEvimh9/99YmcCZTk9XAfGi44W9df2jSxlCcrzOIPFwoq/C7rA1wVDS7J0fHXopu
 DbjdFA1xrsumClhBWE0kvKVAuI/vNrtCwWIzEz+AqILRoICb85kOZnRAiVUk7GZgUTVf4
 8Sh4Wm5kbpdJmusyY5e74EbW+OzmAVFfGKcLO9YuBlnWOH4lE+eRB4w6HX8/CyVNJ/w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lhk0+sJU; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20D094082B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:15:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8CC2C2003C6;
 Fri, 18 Sep 2026 21:15:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 21:15:24 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 21:15:24 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260918121028.3385082-1-giulio.benetti@benettiengineering.com>
References: <20260918121028.3385082-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <c57998a4b0a8d30a23ad0c88bd2e0391@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libtirpc: bump to version 1.3.8
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

On 18/09/2026 14:10, Giulio Benetti wrote:
> Changes 1.3.7..1.3.8:
> 
> b2a58e4 Release 1.3.8
> 65d2745 libtirpc: Bound maxsize in xdr_rpc_gss_unwrap_data() decode 
> calls
> ccc1acf libtirpc: limit XDR decode node count
> 9c15036 libtirpc: Fix use-after-free in xdr_pmaplist() XDR_FREE path
> 01796f8 libtirpc: fix rpc_gss_get_principal_name to allocate memory 
> correctly
> 468d4e6 Add missing exports for rpc_gss_getcred + authdes_getucred
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
