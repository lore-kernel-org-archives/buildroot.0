Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4EECA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B7C4094B;
	Sat, 10 Oct 2026 12:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awWvxjOMednG; Sat, 10 Oct 2026 12:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9617A4094D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634554;
	b=SctaGIs90yol7gdTZ26fE9JVVLaSPBD+Fnv/jslYayU/tndbUH6UM3j0qFdbgApoU2iX
	 YJwQtw4hwqvwvsiV/5sdA4OtZR9uoMoeuhesgCpInevlnB5JfwWAo5WOpGuudVIsNL3Xa
	 V6KRNV6LqTa1Bi5aqtAfSdP50XbgQJkOFrdHjBchWLcLYLM5g01vA7fxBET05VlnN31hf
	 LD7+IoTGCmYzx0loWa7oQjGUw4NUAUCHIjXi9bUoZwKFQc7zyflHB3dTTPEpef0xsasxD
	 4ZbugCRUxfjsgPSuq+lT6/sTQWbCT/79QR7ZPMBtJ6gWOwymO/oHaJRbzdltk5nRPyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8S1RsT1YPjDpBkvJEFwOBB1H8Drh+2lO7n4B87HXMSg=;
	b=p8LWn980QnBW+iJagj7d4/A/ntXgV/lcRhMAAPIn89rrrlsW2Cirs31IWRmJUMvbrRRW
	 gBVX3pHnJLVyUK/QCvhewFY/1yZ3wmwzIKJomvVbGxZKkPnRfe5J08HOTAmG/9xG1vtd3
	 +N6tFZcwu+ric9WiAM4ICbSKwCd2JMeMEZXKwnd8XCQMEXiAI8IIrxJuZ/D+CVJaWtYoh
	 07Q+rFyyTdG5fqi35TyKRWyralNSik6UBTafOVQk2qoOOongxJSTvv8dig69Q4If7ra28
	 6sA4e3HRYqUh8Xw0332G0i+s0BD+3lHGo12opbAAdI4hqdDCYk5TAc2mpukGmTOwmwg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634554;
	bh=8S1RsT1YPjDpBkvJEFwOBB1H8Drh+2lO7n4B87HXMSg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VVQWfumJXrgZk0gwK167jytkA+mHzZXhXBgAfv3XNDoh+TsYPqsczcsCv/ctgp7/K
	 X6oyAKuyEX8MD62LgB3Ql7bv+4weViojoKKEQSwI+0p79uNt9pHdtQ8lv21Ygdao0H
	 kDySXTvEONuNAmmkDDxW38gOtkUopKfgTp5qkZGkDpslo4URH50SGnAv+cIrJ2QGZe
	 F3arCgRd1T/77TJ22twpv1GwjpseLtMiZFFAYcTh8f65mB2TdeLk6KLQ4pTyYgZFXe
	 oAScUV3jIIKN4Z8c+7iGw+aZYnvhmpSdQJoWzo4xS7Pe1RGH704/XNqCkY+KYc6s1w
	 SQeCrWWklcVGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9617A4094D;
	Sat, 10 Oct 2026 12:15:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F055122B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDDB960697
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUx6L4NMAM2l for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CE1B060670
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634553;
 b=nmKdq3lwKmbYeCyXilENlJLdFqULJmgcJglsuDr07v0coalrK01ZSiLjZi35qsToVG3k
 ImcQmBt4fons2zFzfQB0o2PIFV2E6Yhnd7yu72HzAdq5TmC9+9KlP084baWgxABCQLLQN
 jwv8TI3NvRtnueC5Igh6Zjj5lZBUsa8CvmDIgehjF9bTpt9rcCBnl+5VLldjWUEVIfHxN
 qaGmz0JDwQ5ieIqZXGIG57Ypc3S8VV6f7WLOf/nIzUpx3oeEwBuzHg3np1o9PGq/QxdtD
 d9EiSyi7eaM2OQ3bxxnXwu4NI/y5PscLigMtIPmcWzliESgDs5v8dJ9lBoo/4kztV2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634553;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=7LgRXzcLdmJpZjFA/O1PxPRQlj0bI3qU/484B4FVmQI=;
 b=UooXgzdOpat/D2kxZdEDdSJs18KE/8Pd/JLWPG3AM96q9UQEQ9iOi91r0Ycg2ENxkcgh
 U93G1egw+bd0NVTgzNceBxnnyBmVSjb4FgADbSUyYGTfM/9hWzhajKTKwnx/pAcZtyOOh
 mcOf3whTlupbil4zC9ocY28eN7OPFVo+UEd5bVTMaTlOgyJ5iAyFctDAttlE7sWGHSQzu
 Zn3e37w+6hUEU2NsLo7Hb31VsWwptmHVq6PiJgtpwQPTmk+v4d9bzC5kpqelbQ+283gmy
 W/Aby0q08YImih7VZrlOM7MVcmc5s2UUYXliLYKWr0k4hBXH+Rmyj1QdXaiVZhxZeIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ps8dcd3U; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE1B060670
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:15:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D2B2560128;
 Sat, 10 Oct 2026 14:15:48 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:15:48 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:15:48 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003224447.744966-11-james.hilliard1@gmail.com>
References: <20261003224447.744966-11-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <9f9a17401b474ef1504691b4184799e5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-webencodings: bump to
 version 0.6.1
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

On 04/10/2026 00:44, James Hilliard wrote:
> Switch to the flit build backend.
> 
> Use the standalone license file, including the updated notices:
> https://github.com/CourtBouillon/webencodings/commit/42e8f38a90d62379cbe448f778883e920722aa10
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
