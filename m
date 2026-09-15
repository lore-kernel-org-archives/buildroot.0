Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3F9C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 16:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC6380ACC;
	Tue, 15 Sep 2026 16:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BahBM9mtbBhN; Tue, 15 Sep 2026 16:51:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 31B01809CE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789491085;
	b=Lh+B+zw38OIN3Askb2ufqwuN4OHQ8pagxPlEEgdehyccaDxjgaXzhdboRDA9i2W0eFWw
	 gxp1AA1CdJCbxHY1rvCPKmbSTdU7seU/k1eOQchpq3keR+oob03ty9ZwLKOyOqAATEkNp
	 hsuOz11HBmcKCvxCn3jkxXSMa0InACUWpgmx4RZvYcTSwFaKY+BTdGoPwLN89ImA7QR2+
	 oA7uDXeNxbZkUEZgbk2ut1cfhutadOmc8VzntOSsXB2TlwtdLi1M1yxLQTlDn3ta4Sz4H
	 rloYicRGgvnliMoKZzwRkaWVMyxxeJ2ZcIC0M7S86wHT2gYJTatdWF2x5AlftuB4COA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789491085;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=gz250EmBWZyEVSqfHJAP08xK48mTHKUs+v6LX1KvMRY=;
	b=gUpcF83ZVhvQmC/iYCl+Q2q/c2rx4Hv2kY4lLDhrR86JrVlFP5QvFm/NJiUzHW1w4dP9
	 UmaxFF+lqD/ldK5Xt+WWUqlg/1ZmG5HzDIjj7e08cj1ahi1IB8Lr8t2X2gG0Sy2BVm0WI
	 jBmhcv1D/wKZrxkdzvsgSEPqCjk3Gp6b8f3VekB/0cCo9I1GgaAPmsDZHh3I8hgV4BnlD
	 5osjTsTQIhMVdeYVlUpfNaq9njNaoPN/ZcdlfD2un36lyrs7gb3C1VcoTOY3Oz3etAaSB
	 PTRKcpjnwzpOxxPry+egbJ+N4ukR+IArmbPEdU1zL1xLYPX9cvJ2cGEyOC7U3Bi0ADg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789491085;
	bh=gz250EmBWZyEVSqfHJAP08xK48mTHKUs+v6LX1KvMRY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kFyni8bthx8KpejnbRURXLGFxbgoYct2ummf2wBvKeMhu1YCf4bQKi3hyr/3Is2MW
	 j8kyida7NwtByTCYmpRmLtYw7tVkEXCWSlItZR4Q3fLNrmn/9fYePR9zhsKc3KSxsw
	 X11TfJS6gadf4r1M2TR8dDnFr36YhCa7ROWSarWo7ausSqHpbsutAJy5e5rofR78x/
	 szv1xViUP56Ot9K5E4jgsSKSGgcymQEQoQE1ahDseEEJPeG1ihuCi61EkI+HRIOvDk
	 zAyKlpsSMvFLAb+hJhk7I0QUKy9saHJ0Q/lj8YuOouJIgCtQb7VX2AA2p3Mjm+HZM+
	 Lev1VvM2xjQ3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B01809CE;
	Tue, 15 Sep 2026 16:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F2A12D0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 555DB40557
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHpy2gUCaoeK for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 16:51:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 02AA940535
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789491083;
 b=bFmxNngRs/Zk0wMPRaVtguHgvYMOVsa3H0dGRtYZ1Y4R0CIb41R+sTvguXp2i5KYqi0u
 DpwavgjV8l7PUZEBzSkomGqvocZhbPJ4d6MUjoT8c+8SrY54gjwvF509azpvV1vdpUe2g
 1QmcLEqa7gtmMyBWp9RciD0tWiF2f2he68EVV/PgI0W3vudEGkeu9y7V4oIACLSOPyfiv
 NK7n8gLh+SQZyB3b7IT6AgEYgxAEso08KlPyK4pLqZqswn8FFvgTeEe8Q/omia/fZQlwc
 S1LDzfZLM4MsJHhJAuiuMPR9AFf+WnU9mty/dZkjGqSajK12cxL1sjOgMno3XXxyR8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789491083;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=O0HrI92JPY0cfvnkzRgANPA49aZfHMBw77SjMngl/10=;
 b=BzgOkPbZXgH0v8rvJBodLDyRHycCY43vhlNJF5wbLw3OPuzLto5ROldRQHM0Ve3k8YVU
 76avY4lXX7jCAwW82zeoiPsc8khULQcMTc4EYUSb+RD08iVOfOZYI9XkWNlpHtjRfvVXN
 m2BJxaw1pQhE+AgMXr9ODfbTUOMu6FP91bwwhagwMEFpSmOTBmVO4UBj4LEnFkT+9uyPW
 +B58/O3M41f9Rm0dxgcVCCoXfZ3zgC6u539Y3ouhL+7dkb1G91krArMrn6Y5+/99jHdm6
 NveNGIas6pOjfB9w2X+Vih9nl/qh6nC1xIqr5LvFO2wscb7zeiT8Dkf8118dVOBYu3w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CqX6foOh; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02AA940535
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:51:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id ABDDB2003C8;
 Tue, 15 Sep 2026 18:51:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 18:51:18 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 18:51:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260914220237.3170059-1-bernd@kuhls.net>
References: <20260914220237.3170059-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <3906fdc0c8891bad19ad088f66ca281d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.4
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

On 15/09/2026 00:02, Bernd Kuhls wrote:
> https://github.com/strukturag/libheif/releases/tag/v1.23.4
> 
> Fixes the following CVEs:
> 
> (CVE numbers will be added when assigned.)
> 
> CVE-2026-XXXXX (GHSA-vg7w-rp49-4fc2)
> CVE-2026-XXXXX (GHSA-xrp2-63fq-jm8q)
> CVE-2026-XXXXX (GHSA-prgh-72vc-3xmc)
> CVE-2026-XXXXX (GHSA-fqpw-fj22-78w4)
> CVE-2026-XXXXX (GHSA-4rv4-953r-p24q)
> CVE-2026-XXXXX (GHSA-rhgw-q5g8-xjh2)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
