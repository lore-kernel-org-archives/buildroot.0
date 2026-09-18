Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A15C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F220360E49;
	Fri, 18 Sep 2026 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyvdr-dwrrMi; Fri, 18 Sep 2026 19:37:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2242F60E0B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760246;
	b=F7I0LiQesunBQra4xfmlZe6AjXUmzHQz/pBb+DLxivW2Y790IUR03Hwnc7g6V3NpPBKR
	 lFLFmy4WIY6BzEpKh5ejYd0l0NKcB2R9TQIuilv6B2+5mFdZ6bY3R2zssNxiNQmBiFS3V
	 mpx9PLFx5e0WqEzoLnXqL+RW15PHJf6xKvIMvycxZDtkVf8FhyrEDwdXgxc5GJfKJOxce
	 w39S1ns9bw7BNvUcouzdbrDWL/nSa5HWHY08nyBel6dtdBGBgLbCwgOZAZtG0KLAulr2c
	 dc0oCVzzwGqB/w0l+cLVR5NDFbnAGjTalD5znMSH83rGF1kBv8RrhjbtMJPNHZ2qHMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=v6CAJd7FrhQ+0X4+utFE+YbHPj1sTGeGt9NbMj+Nxcw=;
	b=m642tyrmcEQz7DFaKpArbsMt51Q3YdSvNfEI3MVcXgSjgyyrhCGQhWAiZ2YJ1e8LRfCA
	 5+sPBSEakoJTYSEHzoCsqFU11FRVs1ZfS4jZvmTr59FU2Kyf07RfGiWD+4ceo518zR8ET
	 ZgbK6YlBt32t+hqjvL29rBDRwoQwQx9YLrbhWJ+riF4HKbQSnyXycChCukMveCKTesdFE
	 qpeN/dEO5RmXKg2rY/RUCBBBzjGte6M56mq0ElhMz7VMrtH5KNpyaZYUFfyrv87AHJPzY
	 n+qzV/d3o3bPN7cNv3+yyr4IXVVmpCa17OuQ8zYSdVarUXK4MmzrYzIOPUXw2NgF8fQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760246;
	bh=v6CAJd7FrhQ+0X4+utFE+YbHPj1sTGeGt9NbMj+Nxcw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GegSJ+ZmNE5o2bA6XrmZmsr4H7nTX1QM09riZG6nBfqiBR91ovfiLZ5krNOtZilKf
	 hmbGD/W5s2gz7w9fbuyaauknTn8mMJ1Hl2qng2Vwx/6pFv1I3wgtRu6kGGDt6w1qZW
	 wguaMrRjZO8fEVohJeeAhqrWs6hKR9QKRjUFOCZFRmc9CdPFum/F0/lkvSRW4hAXhX
	 t4oqGrGLMwgZm366ZWOvFuSIl18e0qhzybYk5pZGnGlQEubb7nrOdJNePcsRVzCORO
	 5WNF0+5KR8DtmhQU/RsU+tehm+ksu3K30WMSomoslh5uzo2DaddR63Q0q6DpQJ0bPT
	 HorQOIavNhI/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2242F60E0B;
	Fri, 18 Sep 2026 19:37:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA86A25B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9753400F8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cw8A9h2uSqBL for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:37:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E67CD4006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760244;
 b=PIaYh++1zkPZetYoB7bN/+/H+nv3Mfy+KEaOcVf7Q+vBm8yr5vwRBmlLR613loZcs1Sz
 4XD8WsrqvXsenzDfcM7HMc7ZYrJNXarzb/MMzHdTnpZPZd6wKMkCjESIQ+4WH3VQH6dQW
 jgNduk4tvM5gyNMXgIx0egkXm56z4xVZcVBDfE6AluxvXqQP7+oI2gOnjrELoknSozZdL
 5HmYQOEAdJsFQYoUGmD4p4aIBsjeJ1Vk6+TU3fXdqnR1ExMgpN2I0k/ZBSE4zsscepZpL
 WPN7MPgNfp4ZewROXfVl0p5lVT/KIKprQRSoCYP+dK7bRjISdCNp2ElWT9H6pxqC7jQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760244;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=vrnI6PeIzgUgLJV0Zv91wLieRB843SQPtI4Jk0HAK7U=;
 b=FOKgjCwtZjnZH3v7GliaCjODUle9HJ/Ef+urMcNphyjX8M0gDROBM77LL6vK2pxKICZG
 btUipMfGFuZH922gK77ryAIEbtyzoqibNqMW7W6q79Cjo5zRIMwxwoaN0oigorOZwc4dF
 hkuO3pbzfyfh0lBBI0k1ZQEpD1kRfY+Z1WTyfIIItPkdptuSyecrDHkLKNJMvEQYm0WU6
 PmYuHwQpN/keU3MOx2TUdGU7IA/MPxHjq28GMe3sIL+8jHGqSiO3dsfK2tMvDSXgGZ2qh
 gm0egeYcXIiaYA8jQnu8yHepo0Kcqq/8H/4yCgSXQ4/dV2+nVHA48nLEXn+Dhqq5PaA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tzggnDcN; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E67CD4006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:37:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 07E57B0053E;
 Fri, 18 Sep 2026 21:37:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 21:37:17 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 21:37:17 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>,
 =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
In-Reply-To: <20260915214437.2029799-1-thomas.petazzoni@bootlin.com>
References: <20260915214437.2029799-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <050814d8ff237b55e99ab73ff84028fd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/rpi-rgb-led-matrix: propagate
 ffmpeg dependency
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

On 15/09/2026 23:44, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER selects
> BR2_PACKAGE_FFMPEG, but without propagating its depends on, and most
> notably BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS.
> 
> Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 
> ("package/rpi-rgb-led-matrix: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
