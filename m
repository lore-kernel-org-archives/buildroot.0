Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A37C982D2
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D7FC40680;
	Fri, 18 Sep 2026 07:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqjLt_DtsDlc; Fri, 18 Sep 2026 07:37:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 291CA406E7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789717045;
	b=kcidu+8C52JQsIvpF8dhVBX7J9UDPzWsWeBAu2MmbmWAtqNNq9t0oPKRX4caZfaDSN90
	 1XxTW0bpKDP38UNXNNfclmTnwLD3+EYUrabf4MSzN+Z8f5Q37F9N4V4cyN3ojsBNDeRtp
	 8y99b+4nZH6ZoGKuLrdSAtA52Oh1QR2Fc7iV29FHHW6uqr7usLOggNFJhPprdG5yjXme2
	 VrRkkRIePY7bDzDfJzVDLtz/pHlccI2boZRlyVoBuAFWQPC+HNBsWpr7LPv0jJite5VEV
	 d8odvjTVV4Lrcjt2yThkhE2Iojndyh6nlTxQZDZY2bAKxFUwzxEc1FboOiFYlxGq6FQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789717045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QvnHbUYC4W2FjIUZe15ozepsFi3SON56HHE5xBzo6zE=;
	b=eo15+LT/smXPDiGAGIeq3yXIBFhrjVvQid+ieOukWnEGcgm9YzbElO5h0l3Dv9Ac34st
	 1tRzq3a676qYVDy3MlUKDjcGnKDiq6jCkXmcOGFaVDMGshhDiNkmvNNgJqGLj3ZH8YJrx
	 YSiCFKtkaA/9JU7l6pGBqfXcP69IO3jMREMiVLIR65FMCh/AKRA33EetIfstFr1PhDeDs
	 MMVPVvguOI5CmIafSU2eRAr7pDCmr6x/7uCpFzBblYTYKsPhBTkHtX63qUPPHWzU6XpuR
	 DHn+pnd22kpUl+SiuEypQwfayNb78hO5yXgWoqUkgoN4Ddd7iOxpqgsL3C4KtI4E+3g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789717045;
	bh=QvnHbUYC4W2FjIUZe15ozepsFi3SON56HHE5xBzo6zE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ALsPWW0ZbPb+JjBTjbFi2rScgv8gqk0EYZX4k4Yw68kRO4lwNURvHSX4pn3EbJoa0
	 Bp+bnsGDJCdMHq2LZEKhQ+Jogr40fwQpFyItwJEY9gYgCsrbzvj1ok+SrQIAtaZhyy
	 Tn39K5knNvDjB0GhqXyGmKzGJrN4VmeguJai8cbonhwkvo7bjCB8avlVScnehdGzRm
	 c6cydAmYSsET9GqFphXXdGfBu8wlN2rNYxcOW73AVkOdaNdSs0UDEsykh6iIE9sPyR
	 TJnyMvXdFqK2ndVCD9jPrrcfDBSWfM+5HEBU1Ltj4CQXw5HiQomO+WEkk9C71y8ztI
	 FglrBm4GpRSRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 291CA406E7;
	Fri, 18 Sep 2026 07:37:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5575737A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 478FA607E2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id letZqaP1KB_m for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:37:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 76D016063A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789717043;
 b=YzHgWPL2o/XvuNUu/idofad1iINZj8ljlVQtLgbU5VeRU513Vrl82PACLJRtZDc7/P9l
 IQYDQC1+A9LfE/W0t80xIyHPKOCypLVHyeDzOzp2u7yYFw4R14LYX5yZ+HUt/8SB1wKm3
 hgsoI0CMyNzHf7zlGcpT86jbUG7YI6J1S3EcLN0hePS3K2X+hejN3RNK5MqXcdj58EctF
 Zen8Afwdpx6OQduHh/RoqwgkZhrxQ+42CXsp8NGCy12yMiHIn9K6UBO34mh9mirFR5ZJt
 L49AxCjDilHzVp5cd7CUYiadqQVJ7OXO9L6J3uLfg6bOHkwjBE9YXLwcPCgHspS/zCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789717043;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=jPYriMwppPuRGMNZl+Q80GkoOFHAMnwOuyr3CzlUn/Q=;
 b=VGAik/6iZP1c2Jgmj1p8GixrZHsW/Z6W5LnHu7biq1jhnGhHzHHVwtASyzj0tgAuUNLi
 8MnmIQ1Mj6hkUfUal1gF6GvqHajlMAlpN+zKk+e3/rDmgIBEEAOE2iO7URjopm+HuiGu/
 EAkAS79g0TiMlqbS75L8gxEnD4YWOwvAUQpgjR5krzT5ZEhgPIzXGdhWEtkrizGL+teg/
 UzHEmAYzWKG0B8Fumsp/9/dlpG9VB5AGkKl8bOPnJWp6kuyf9bPqdQbqTKCgTNeQuGPBQ
 /il9UpH2przfFBekbZ7fYMrdjQdb2wRDRrNMhgWedvPA7hAkqUD9rczd9BiOeE4Ee5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=g0XCogWA; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76D016063A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 44EA81A0994
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1733F60649;
 Fri, 18 Sep 2026 07:37:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 17EB111C7B078; 
 Fri, 18 Sep 2026 09:37:19 +0200 (CEST)
Date: Fri, 18 Sep 2026 09:37:19 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <aqzqIhTYEvCveKVV@windsurf>
References: <20260917113720.1297345-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917113720.1297345-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 0/2] package/{libabseil-cpp,
 python-grpcio}: disable for the MIPS n32 ABI
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 17, 2026 at 01:37:18PM +0200, Yegor Yefremov via buildroot wrote:

> Yegor Yefremov (2):
>   package/libabseil-cpp: disable for the MIPS n32 ABI
>   package/python-grpcio: disable for the MIPS n32 ABI

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
