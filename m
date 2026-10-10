Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB61CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B94F6608C5;
	Sat, 10 Oct 2026 12:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qR2u0jAtx0V5; Sat, 10 Oct 2026 12:28:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 122326063A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791635335;
	b=HbnwNSvkAcsc8CBT+q2IVqaa+JUxoB2OmiX+lSAucjhE6YicZV6KZiCzfMxTso5k+A9s
	 pSdEgj07AkbJbS+0Ob1laDStE7qrQnVc88qeZ181Q3wkj+1Pu2MLTZhHWxLPlY6mnjpMP
	 zASCio7Cf8LU2zAf+K2pWyTGaBLxnkQOxTRI80SPFD9NZRfCiduJZoMwq0O1mzCzJI4EE
	 5xmchqH0CEPeY1wF1lLGLD4JvEWP/azsiCyBOqZXEdzymbD4IUGVjxT1t7h3UZdhOaeXY
	 ieIWSe23wJ87Jo0e4N4PQB7J/CCgx21NVeiFnGwMR22ti7dwT7SXsOdk/xdJB4oP+mA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791635335;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=9N87RKd7YC6ZAHN9GFRqwckHvBINdM2PjBdS+Q7xsRA=;
	b=SzrjXieQus3qhsa9M54y0B3Z63XNKANPKyjITQabyzztzU3bM60LGLQ7xf2rMm1c8HIm
	 jKbFWZrNjKi0e0+F0k+ATZXxuFyouBFQX9+XH4OexvVwpcyHUFLcTLxQ61h3Jid3LSa3I
	 Stbpx56RZ5RBQNUSN0asRgPEdLZ87SQjLrZB409iF+Jpm2K0w5nSyAK9BQN9/QrDqX8tK
	 F1SlLj7MaT9/RES5g0xEyR/WlfxdiwvO0+OBMBWY//3SrNQ7awIxcULZePzThOsHR3RmR
	 lWIY8exq/baN2FDfzaKJ309GMjDE7W9KoYPg7524VyPpJX1R3kGWEFMEu+/Jh2eXcEw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791635335;
	bh=9N87RKd7YC6ZAHN9GFRqwckHvBINdM2PjBdS+Q7xsRA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pk1q/8uvUlS+uVoTUdFhtyZ4AfpoDmzSVZPczgoV8nB8PpIfHzsr2KizeFBIQBgzV
	 z2MRzvECkJhNpkBZ0djZ38MOuERgyFEqwJGZhEMGe3Lhz3myXEa4N4nDB03C+eB9ZE
	 CzgGsvVI3rGOGIa1uUKYwcdx/oWrJaAPGBFaMoHYnF2bKnLvfoHqSEMPTwCLPqs/SI
	 Ra95wwSK0oyV4A06Nlk/uFCtvLQTNEdoWjl1f9ZIfDzCZaD2Prhots04p33jxnNsp5
	 xpG5nczgAJVNu8C4VKI9fBGf1DhjPqmtL1xG8DySRsvryBV50JJeMXc+wLj5FEWK1Q
	 MLERd+gTH79Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 122326063A;
	Sat, 10 Oct 2026 12:28:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C3A2156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DFB181155
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5_IpiyUtHVD for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:28:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8077C81061
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791635332;
 b=cs8FjRwQvW+CeNcIn8vnyq8EcCL92SVIo1Wm3iL4W6/tZJhp7sp+8XyDCcb8Xn5zpAx0
 saPyWCgylAHJOBF6GIfiDsyPP5Qqa2jYUSGx1I5GN5IZ+ADdL+qy5KiIPNPdnBxZyjtsM
 GOz4BF/3SDckU/Lx96b+cL0krOt6igYiedpS7K/qW9cF5uiK/ewnbVl9v6/NWjfrncsRK
 WpYUOc5c/6V3z0EesmZOAuuFLDnLZhofFCyZg6T0P08LRg+Y8/758M/vIxzOV/1sq/FzP
 jCcMgcq5b2l5qZ+m4PnzdVM4r/kCXpnZCnnS4Xex/Y+fOZix2mNSKj/dYxg65iooEJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791635332;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=1yp2dY5vpn7bPgsvNkQWWWJYHCXSdOkICpt041IgLyM=;
 b=seRiJKLs1kfEYACFM7kiwXVlzvRev59FHGT9rh2CqnfmBKXwqo/r5fAbkVUOsc+fmLKP
 WnfIaoJAWOEREXxr1/qrimF4lxni5LjDNH7jLxgmJ5chyKovIDivNo5SpGb7/RF3cfHcm
 2nStyxNWtWhj1/7NUY8D2YCYSm6ZhPmCon3Zy/JTfDW/b6u99WnlqLoLMLXEAyWsdu77w
 c/uy6yRvbDCs0JRU41YbLjAUMLynO5JFn/iv8aiovGawhUiMqodHf3w4g5KFeKZ4d7ZNI
 Sri8B1qNSwkZ1nWvGHYqbqOJcWZIb5j128dQsgp0XG59jniODiklqYNiJk7WwrGkTPg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FGR5m5Ua; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8077C81061
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:28:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4CED9B0054E;
 Sat, 10 Oct 2026 14:28:48 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:28:48 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:28:48 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261003023341.454213-1-james.hilliard1@gmail.com>
References: <20261003023341.454213-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <2aafd4ac19ea0a4a035668911f0e2f21@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-opentelemetry-api: new
 package
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

On 03/10/2026 04:33, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
