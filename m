Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1596ECA5FC5
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 19:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 006C7811B5;
	Wed, 30 Sep 2026 19:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xy5209rbnmVE; Wed, 30 Sep 2026 19:18:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F067680FA6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790795882;
	b=tIm1kyFlAl3VQLg8i1fJMDGPVsj3Vw7bq3SWbAU27PaWuEHczTwRfjnILrt+/ahEibbX
	 Wd8odZXqC0tbWE2lhCdSW9E/dKd+dUuR0+nDVJ/J5zeSPaI4htHYyxueH7Z6uLp5sYmu2
	 0vGjgJCuyGbp7lxKeocE/Se/AaYm9srodt7rvRJedI+Xx2Ylrc5fZBgmhiIRblMYzB427
	 K13Pag9J8mQk1vUMNphBr/dzEBiIA1+0nTqIqlTd2yAx7pCBgjwxlxIdGpvJ3i9H4GLsG
	 69rUmC27Y1L7PsDf6W/YarU9fgOaX/zzRQlcNb9ct4hl37Uwp+cC9J+BTZzLjQbfNTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790795882;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=EWiEXfd2JTrdqkjv9QByxMYfLml+yznj1KKjq8MWWAA=;
	b=Lb8WQ1AolLMDBNmYEUt5pKxZmRFXcSJ2P43HAr727j0Ww+yPwKlV1ebuSBuMHgysxQMT
	 PGCaAhx3tGXmnjiHsVHdyIiXuKnqajzeUx1ZSLJH8G1abcSkX8tDvIckXVMu6ExnLSJHX
	 ZoR3qfUmclL4bl0inSF2hI2jhAmQDQXAUtMFwzTIMoRKicLycmos9O94AllP93DLWwjAR
	 i5RxrlWMSqbzZ0RWrJVEP/7dZ2iIJl3kayRlC6mm/YgJuw7wL+L4+NPrxuqZ8KI1mvce2
	 ct4uv0+uM1rlQLtpwaekBoBhtWCqqwZ1PrVaLX1DAnckBQVII8NOuS2qZo/B+HbzUyQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790795882;
	bh=EWiEXfd2JTrdqkjv9QByxMYfLml+yznj1KKjq8MWWAA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=khhwoTKT+mOE6yozQ7XESkJDcuFdo4e12/B6JAMlpgDB0bTH4cY+okazumEdVUkjq
	 zu7n7amBm+yHm+EmxW55js3gE2yZIV8WRD5Dv/bMf6+kqXCVGaUc9Co6A6E1QFtCUN
	 wyIak/mENZ8jlQvjPopJ0euGxER1htuXKugzIfvTNe4uO1QppB0eAaJYpnRzFOs7j+
	 uIjFM9fACkEV40pqYqQ4IZRKz+O2ZAJKu3ZVqk0rDbVrrXHTCGtnqQ7Ru+RMhUg/q4
	 DWurna9MKDEzDvEL99x30NF5P9cPWaHVnb5LqX4c/MhcAKGObty+nn4Rb3L2tHL+aN
	 ndXwSm0aRqRuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F067680FA6;
	Wed, 30 Sep 2026 19:18:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A619314C
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C20E60B86
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c88Y2vMJCBns for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 19:17:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 569366070F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790795879;
 b=FAu6kD3ONWYBIuUEJZek2QFN5zG0Bud0RI65cqm20cNkr0VI9L6vmKYprhRRoN13aJbG
 Y4IznyhzU0OO1VZVuUDsCHZDtEKt8pSYdQeSjZ+a9R5YWJLnOy34q0iB0jN4WDZre5zij
 z/j/9kNjz4JdAXwiJdtrwxPCvRaf7tKr5qxQ7dXbjODKiRKbznSVxu+zUfbTS1ItRoWbE
 T5yNpvxvTIW95vW170zgS9VcCGxLCRvJB5r+adMGoM9jdkSPAPczGVFfQZSdH5lotxksZ
 +sNM1vBXfEe84AXgMie4UiQT4SuA7ljOKOgG0SAB6Cq/u1K3okj+eW/OeVkSd6Y/Z/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790795879;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=HamIZbWfUjzMmU9obEhL2ABky3rKNUhUrHO6or/4nyU=;
 b=HKo2of0rlAS1NSjaOw4sezv9gpy60CFXy8Mc5YUdRYT4BwgMKeZPe9hc2kSLK4SOXVji
 IAfYSERX5ivcKUAl+iDf7g8Azk1YhCjXaREIMmkcQ4vV0uF3vGQZfdIH5z2LlqDh3vJJ3
 Rgpry/Qsvpl1ESpXui0UXPSk5gYOnHpadPO7bp4wLmyMroW4AADT35eHXGVugWd8U6VC7
 NMK2XVStyPvkAo/zuA2xBQZRVZqGvHal+b9+xLu0DWS9E4OjO58vxE7KF4xCCGpePXV+8
 PD8Qoqm/drcnXJFFsgoNu4hSnPU6bs5L0X5ZDvYeqLZ1oWh/Mx9qnwup/PsHyn0mmIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nUJGSoxY; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 569366070F
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:17:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0D9815FF88;
 Wed, 30 Sep 2026 21:17:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Sep 2026 21:17:50 +0200
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 21:17:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260930165741.592638-1-bernd@kuhls.net>
References: <20260930165741.592638-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <dddd016b678514973b40f43ba03c4590@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-55-gc90398e00
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

On 30/09/2026 18:57, Bernd Kuhls wrote:
> Fixes CVE-2026-89092:
> https://gitlab.com/gnutools/glibc/-/commit/c90398e00571476711792baacb6d92bd2a7b6891
> 
> Also fix typo in comment.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
