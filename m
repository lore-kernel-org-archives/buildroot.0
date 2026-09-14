Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2520BC88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0F0A605FC;
	Mon, 14 Sep 2026 19:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3btkdAenZ1f; Mon, 14 Sep 2026 19:28:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F03E86061E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789414086;
	b=R6/sRYBZZ4oFkTxTp3OT/SfMig8NjeELGCv207M8N4JOgZNYh8OVgun/T0emjyVThxkP
	 7cwkJXJ2sMlXIZCMMt5z54/EKRqmkjXJZ7KI383k606Ud3FESwywoR4m0eIbey1tBFRS9
	 7SOKcM4EbJgKCSHhjE7P5Ko2NKQHcdR3S9fSqbeZzhIBDN46FAe1f3ucmtiZqwbg1WhYf
	 97JeBFAWslv1MPlCXO9Fs39pEBpfiPAmUJLHdAdZj9KzYqAEJTj0mEyj2gLWZirt4rBsF
	 9liPGeYmFCakxS0OfJ3c1zEfQdAF/yJ3RBzOXouVEYcvIioOK5A80kSF4JPsSgeKa5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789414086;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Swfc1jz3CcZP2j9YkjQkHdoQqe1GhHQ4WSOusUr8uWM=;
	b=XtMC/IyiATe0N4fmDOEDUlFuid2cyyShUYxnzG40uI5TXqWdn5DQ7KOjlKPNNZfUmJW9
	 HaZ1x9i+PyUikJmrG7z5QieaH5yfz/Kzi3KLxZxohRxwdTltj2/SZ+hWOERnGzSdkDi9h
	 byonjHVV9hDQGy0/BV3eDglfjx6QXCcmYv3p3YdbuRzK/+NRZL4KayNi5cUHTDfj5vlCV
	 8vK1Z59VB7grhPiHVeUQMtHPO9ao+6yoOO0VwcqGeoXA/KjscGa4byLyhQhwXlvgsr5sG
	 F/aaN4VV8FFHXudBZSCXxnz8oah4Fv21XCRryMJMDClsOUydj5lcthNVQouCPtwl2zg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789414086;
	bh=Swfc1jz3CcZP2j9YkjQkHdoQqe1GhHQ4WSOusUr8uWM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kV4tgG5/Nx5ha4G1LMWavNSxAF/E8UOLWV/ZdNVGHVwSvRfbGdaCmDwyE4nF3WTzI
	 AbcSd75WVyVyQezC+bIwyWHXv/RMIjIgVF6mL4AgNeksgjrJjDobTg82hiYLhi3arI
	 fsbBxOMLqZsfhfa4oMZ4BJ/wRRty7yyali2K7Ifqf5QXwQ9x6XwLhPCv1F65ez9o80
	 bGX6VMT3q1LYLlfYETyfdtKQJLf00cWkYC0sivZqn9ibB8HnRNwOr71vLy4+P6NRGr
	 qUWBSIHwBl+uwZQTLN054oBrbYX3lM9udzV+IWI+yNEvbuETjEt8lOWm7SphdQahyS
	 N3CUZNZoizaww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F03E86061E;
	Mon, 14 Sep 2026 19:28:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E15259
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0A086061E
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkQPnhFPbadr for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:28:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BADA7605FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789414083;
 b=eaFbKVjPvgNA/Fi6lrxcs5rVsce7L5NpS69wiaM5LLWjdDQvc6HVChNQYfNyP6p/a3r9
 ugqEVtf5aF1X0RBKGEmmh75PgX/Pjjh16+Z5rk1KttPHZe+ONuedSc1FpiJPzNaoNRAKQ
 fl0rqj7PfG/Gl08UlTtcgyK2nsyXtowlobMqaDHCfqoqSOnseraKb9WnY/DsZHEuoChID
 TG9Xh6WYFcaaiXU4K7dgLKU+Wh2kaGq3ZXnBZTJxGUNR8VZKWK7PiyD6Z+rUDGpRNX5ia
 UlOJaOU7X/jvUzuhjqC5DSEHX1OlkqIRpLTkr2wWeZtxByUbj7RngwNmVwC9DG0t/+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789414083;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Oak9MpfLIbuWY1FLEJYeHK7Ksy/ybRAeltwSCHXa9M4=;
 b=p4GnpGSi+3/re3de8cQr+cbhxMYBL0590hkfX1pF2mGZL7xAkklLs62HsJpFeVDYy+fo
 WjErt06LNENAb6dxUgart/q4HARMehAcCvC8quw5gXEtgZPVVeHWMXOauJiM3cegBvAbc
 5kU3jI/si2Z5Kpn5UebvEOYE0b67Tw5HHjMOfe14qT/Tnwl33CKFeT91fro90xd+mFmn2
 5163iyN1+j+0ARw/CF5eMCD4TjsNhqEaL1VGjAhbuQYugQTk4xG3k0F3sBOZpcpwTSrQs
 x77UOkkygjG1iLCxdGhHs/y2pybdTC3o0UkOqCUkmok5tJz5ls+Jtfua9qdAVnPPZTw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OhBaBMSH; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BADA7605FC
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:28:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 00A845FFAF;
 Mon, 14 Sep 2026 21:27:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Sep 2026 21:27:58 +0200
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 21:27:58 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260914190646.3827872-1-peter@korsgaard.com>
References: <20260914190646.3827872-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <2a0f8c72aed89f6f6a7f9b20d293d41f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/x11r7/xlib_libXfont2: security bump
 to version 2.0.9
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

On 14/09/2026 21:06, Peter Korsgaard wrote:
> Fixes the following vulnerabilities:
> 
> - CVE-2026-59679: Font Server Client encoding Out-Of-Bounds Read/Write
> - CVE-2026-44950: Font Server Client Cumulative Glyph Data Heap Buffer
>   Overflow
> 
> For more details, see the advisory:
> https://lists.x.org/archives/xorg-announce/2026-August/003734.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
