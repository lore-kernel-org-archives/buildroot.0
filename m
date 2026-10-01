Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89A9CA5FCF
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB1781220;
	Thu,  1 Oct 2026 16:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKempYBBENwn; Thu,  1 Oct 2026 16:50:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8A78781206
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873436;
	b=FF2Ovxy4QQHKi1ADnR6opX0Zu5NLp+KRm5OfUdsmPcHSww2GYrHxulMwbUm3piAqS5NL
	 9ZLEarj4w95fXMgUCekroA3k0+bZaNbA+BYPsy1mPc5ymSNdJQsObUWM4CkENUoIL3i4B
	 8tyshDQ+Iywe+m00cwlBiMOxibqu/nrdrm8EjDOJU9T24Gk0lPXfNSqMK/QatcpBsFmyZ
	 bFs+xjogVcxnUo50TqKgi/yNL2rNcxtoPpdbWHXjKWq9npeVjxaJ8G7kNf7/gSJNVtQNO
	 0ydb5cfodfIYVRUBJQwY7N7ZgM0VzcBpETG9JBkpxkT9rwEUz6dgCvErCBvUfcCPqcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873436;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aSe/bDLw0y8hCMqLTmkX8w+q1poWmUG3apadT1br6Ms=;
	b=Rt/CVnu5qpNDXK5DUTEKMmDJ8xLMwxqJFhmfXQx2JkxdCH6BkY9vy5aWq7Nn7gUV/upw
	 k8dBQ/+n4Xrs3vZ5r04IDR4gacihphIlDa56BQZ97yYVpVP2jNJKrCVzoLuwCPN6ueMkJ
	 NqEPrhY9Wetd2YXB+8qpgRrveuVt7CJbEI0KYlQmEeKDo/7AtJgEiy+fUOBAFGrwoXAz9
	 4+ZaG+LsJFIOWqSySNBM6yodv8fEA57isKUXiSI227MBmY76OgfjZyUUNGl+14w+6ZbLq
	 lezf9aIMLOcxlHHaYy6wXa0S8pkjdV/dslaDm81+FSXF/O+qby5Wv2bMyrZL4b5NJvw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873436;
	bh=aSe/bDLw0y8hCMqLTmkX8w+q1poWmUG3apadT1br6Ms=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=keYEey06xd/FlTpaKXZE9VWh7BIcoPRVc+KP1KowA+K93HPsZN3WZ9psnyPqPItFf
	 rU2f6JI/XCguAMnGGJmS0UiPVM8lxwvOb3VPjKrwQ1zUJ8P2zUKq2N1HLPQVVqz0g9
	 aU05tfutNx/1q51LT1vPZq6tyaI+TOBM/ItikYO4OJe0xN9irv2Q/R3nKF5Rva8LAn
	 99doBXp1OTNl8p5YBr1t+WxOUd1ZMGuzwiu3p21bdaaEUiSgIn8ekO43wwnm5DkM5w
	 hUKvGXG+JvcWPtuA8v0a4evxyss6m0vPkswr4CFoQk2K7EwKkoXVAJCIHDVrmu7QrR
	 71Pfc9SCvRv3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A78781206;
	Thu,  1 Oct 2026 16:50:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00FE232A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB08E6081D
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiAcUMAGSkDN for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:50:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3CE77607F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873433;
 b=qS0q6VffSKJd1GpEdRh11EGrnOW46P/nn2FaO8KoTRtUztONRkiEa3EAmjyOKvP/8x4D
 lYMT2njEIXa7po0V584OH30nDHybeeNt20ZmuRdkcYcjDvgU66lqEBIozgwqBJD15dySr
 JGBoSbIY9D/7Du7hF1vtAUGKUB3Nef5WxhpSh7VBoEmF5l/g8z3TO7VTb5+OpD/R7qtGG
 NnrlSZpGXPtC3meeoI7AuZwO5SO5l+kCCLL9pbRBTuQWDBUvt2C3n3jdYZuhDTSc5mmkp
 6UqfGcFKQHiKNmpl1FOfU/POroqGQ2TckTnYdcTQikhU+SwN1/ttcQLaCM6FxHPXHOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873433;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=KTbLU/BK62VAgHPKBaDiU8qCRgc2phmzuzkP8eEL1rw=;
 b=hXndjaW/LWfYHgR2rA/mwdBH63gWsPeRZ8cVSeSzf/QVkz7AXf2BJBcRbN02HmuK35wY
 NjNpXxD/lcKyuIRM7OSpXia3DMzPihoBvo5chHn+XrKo4/v5KzGm/t9ZUt+BGuVMx2W/r
 evGAenAjDI0bKALhkaYnp4cicjsYdCLDMSazmqEeVlDtGya9mWYDYCO4Vxt6jEGDfyPAY
 pLF5ialjgG7X3xnrpQx0pi7opNmUhaFSF9mcxtHeaKCGCqnfflmTbwyXxrSEHY2DWCc5N
 c1W6zbm0XBCs7SO0/DizN/VjQWQuY26i4x2Q60w00fbeodG/BkViQBC2DSFUxetm1MA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=smJvHHq7; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CE77607F0
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:50:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id ACEB9B00576;
 Thu,  1 Oct 2026 18:50:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Oct 2026 18:50:29 +0200
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 18:50:29 +0200
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
In-Reply-To: <37023ba12c19645b47a5ec66de43d08ce92098c2.1790842118.git.baruch@tkos.co.il>
References: <37023ba12c19645b47a5ec66de43d08ce92098c2.1790842118.git.baruch@tkos.co.il>
User-Agent: Webmail Free/1.6.19
Message-ID: <e97fc8158f04d7fffcf923a1145ec1ca@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/tcpdump: bump to version 4.99.7
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

On 01/10/2026 10:08, Baruch Siach via buildroot wrote:
> Changelog:
> https://github.com/the-tcpdump-group/tcpdump/blob/tcpdump-4.99/CHANGES
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
