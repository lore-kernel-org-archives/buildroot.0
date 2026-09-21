Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BFCC982E6
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 17:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C52940AD9;
	Mon, 21 Sep 2026 17:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmxIqLzZRzlf; Mon, 21 Sep 2026 17:18:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6522C40814
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790011125;
	b=smKA23T/c+wavw32GI7MUjWbCxzW8n/hackoptz57tls0YlyRqToAy6y+mir1bi6orgM
	 Nsdn03dcymKTbQWK2xzi3/6LKr3mND+0oJpgWnytBuBrWcvYngkS8XG4iSMpR9ty0O13b
	 dhlx1sHPh9/TRstraINiwDFVnZCae21GSoE5N9MIs0udug4Tw5pcDF3kYjNol7KdPvlNA
	 dIQsk1KV8T9EcMTMTMMDQ2Dt/MfGdlezp4kydVWyo8i83QcmC518kCZBPQve6B1KtWc8j
	 qEYGN8uc4d71H2Wdgb7EZpMoptBQy8dY8tOytKKWg5jc9nXpKXWppEzQ9upeA4CcWnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790011125;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=mcjAJeUfflwQaGLUQLnSpqd/BtDEDBHcBQmy+RmbmAw=;
	b=jyGgYKrtvKHB3wS3DPDneJKL16oDveLYc7hMrWWPpL0toHGAfMyiHwkGAnEALW2xtHVp
	 OSZ2GMaWLOeIjXhSyrHLG35ln5FeycL516dxU3FlJXONgmcPpjQkS49MX4TmZShRL4G7B
	 Xe2laLJ1wRLZ/9b7Y7vchIW3DO4aHi9rrQ8CZGKIypg4WFsEzJ0JQU8ZWg3UhYENOWlm8
	 euK4XzqtbN+S2YJyHYOmidE9r8EWGwRJagcx9j9I3eeQHcBEDv3QUf4IzpiHXFqzlVhAR
	 Bmyu3lwe7w3CqrkgvZt0804Qurxa+j+KQYkk4hqujPBv3krgH8/5yqkRGHLs1rPNh+Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790011125;
	bh=mcjAJeUfflwQaGLUQLnSpqd/BtDEDBHcBQmy+RmbmAw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l7+LPK1OC6bmymHJgxqYZySUb1SsPzoGMz3d4a11VUe4phI31N6frZVOIm1iMSSAz
	 0l4Ibm64BxBvZ9hUQjGlDqbE2ROgKzLIilPrybsHv7sFkilIEo0Jfq/Pg4larqPBKC
	 J42sT3zec2WTWfou/qb4bga4bFMQRja0Yjg+A/XoHFS/TH9/aj/qvCMo2yse6ev9I2
	 tOrttGBsoVBvhaWZDW6YaewHfXe+Aic0W1YZskWU/SVwrDklbQqzOROCF5I4qNEr02
	 G4cI9ruAgNac0ElQV8xH5fcrbf+xhVAefhejQ4vgXl8VX38FMG+fBYt6Pk6LiYXYK0
	 MgnTRde0c2wJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6522C40814;
	Mon, 21 Sep 2026 17:18:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6940A224
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E6BC40814
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4LnAjVfn4XU for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 17:18:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E1817407C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790011123;
 b=S1xskRMMqj+dTwzqapY1G/QKa+jK7fUnRkx36FaPjCVapg2/CqFyzQBwoHa1Q+6VnwEg
 B4Z2hf7IIPsgdCtcRe5WDcD50H1xKbz+jYZmD8x/+NUetnsLV8YerQlaGmNKsP3oMgmNR
 /BHo1OhoOTO55W6TU8nPwgpOQJo5A5zhnrg0H2Xe3z5LUBMHcqclVuB3rQLI/V87G8YX/
 7RxP1QwUK+DitzC9GKSIeMuo0knTOCc5WvXCC48gTpTP5bpyxBSKuQvUV/ZDjTYrp6HG0
 Zx5ht8UklHJYFYynpjvtt4rO3e/I5wx/cB4858aK8clLDin69Y+oOuNq2/pPnaEfZTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790011123;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=RBrZGuYOG3IFUePGt7WShL2jchqBqJ4yt7lb7jpP09E=;
 b=CVDOT184Wte/1zZch8BNSaxZFOQGwfZaWnYXFc1qA4+0ux5vfeFJGkjSo6g7UpUNUMg8
 u7uCOUgpaDDPYc9OzVB1noMhhBIByZguJb+IGryl7l7rjNsyatm/oZrhpAkAN6S0f4g+h
 i2x8jhkVjS8HUOi6uApYvOrJ57uzDibzhwthcFckVxC6uoU1upK2it9H3h8J1/rgMwUwE
 GHzlyxIF8L/7ni4SwS3+fqCheAx+JIiF1iD0ASHH9F1Fsmg55PxFENtIG+a+kW/CRVsEk
 0+5ILw8ET94oowcWy8QM9Cz2rcRfYSqbwcGpVxAkIORf6gMjLdN/WxdZzqdtnoRmF6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IWsJ+fcO; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1817407C5
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:18:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 11D1D5FFBA;
 Mon, 21 Sep 2026 19:18:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Sep 2026 19:18:37 +0200
MIME-Version: 1.0
Date: Mon, 21 Sep 2026 19:18:37 +0200
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260921082514.2351-1-cp0613@linux.alibaba.com>
References: <20260921082514.2351-1-cp0613@linux.alibaba.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ff693b8cb4016d062074e280a4c8826e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/iniparser: bump version to 4.3.0
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

On 21/09/2026 10:25, Chen Pei wrote:
> https://gitlab.com/iniparser/iniparser/-/releases/v4.3.0
> 
> Bugfix release: fixes stack-buffer-overflows in escape_value(),
> iniparser_getseckeys(), iniparser_getsecnkeys() and
> iniparser_dumpsection_ini(). Adds iniparser_load_buffer() to parse ini
> data from memory and generates version number constants. The SONAME
> major version is unchanged.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
