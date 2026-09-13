Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13288C88E64
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 12:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C98B780C79;
	Sun, 13 Sep 2026 12:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2YBJFRTacrf; Sun, 13 Sep 2026 12:45:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AAEBB80C85
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789303539;
	b=UNUzGVtA2s5Ej2cZbS/tnyqbxK30jUGH5VP5DAPEyubgjFgq8dVHL8FQf0lKF/gkT819
	 pP7/75QCUJlMPrTC/yctuvGHNhLh1w2IaFTU6JH1qKoePzdlleuJ512Ox2MJxSeXy6Udn
	 kJaeoTWWwGboqKR915S2lPEjdstZCRcF93uYZpRHIY3DXW+m/VFQliOLp4Fzg/unYqdWc
	 Z6f+F1NpT2Bk5cfeCblr920Tc4eML0VVahNHBmXP6+Y/Oh0byGAur3KhJI1DQagub3nXb
	 98ymZjprwqA1sTqbhRJXpNeo6r2xkoKvBemyXjRjjsExXil0yArAgYaed6zQy28kVDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789303539;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=4gz95OLs85dKPtke+aMGvlpD+DlOau0luYTGQ7wpJLE=;
	b=bvVNYC/pzoZybHkYi4SbKwVLo8l2YqITl6uPiVsXiGHE4/saHLMZHvxJszfvWl0PQ5P9
	 5uO1H/EBW1cTpuoCR4ASee5j3c7LkbJ++bYLCpfXsuhiJotzFA1ARcNtbtXhcYImTXN+K
	 ZiqI7eNNABDV4lb0U4leWREKQrwmiyWp8kMNWkgTCvxK68qkT1Lu9jZwUjpZRNNqFOL+F
	 ngHK4dtr3DVhq47udQJCMqOSaEByuBi7UNbjMmI2Yy1PPlKit/5FJPftGPgrwmyJi4Fw4
	 N30T2QX88RK1dRVzJiGifni+giQ4N6HDMckHmNREidbQBo8RiGIpxJd5jKrn4euGvtw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789303539;
	bh=4gz95OLs85dKPtke+aMGvlpD+DlOau0luYTGQ7wpJLE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iUbOUoB8nyGr2UiV1bzva1cxwYv8rNzj/uA9bZa91Sz/lzb1ysJdQybWuI6nZ/3Ub
	 iU5iBwiZqVZv49bVFYo/sldAAiWyu936WpucDpa2CY8PEkZFJac+vEFwG06dWRHFss
	 +wEF5mA8n1eiqH3cAba54uI+529eErf1p5Cdg4AXX7GmUjptKxMdR/n0II8l2vQIGP
	 BP1IY9w/jXu/x/gqZ0b94lCILnLACR4zw/L8E163VMmPDLVZ6jsgZYfqxyhYO8mIYy
	 5aTlXh6+Cu79pYYxkEm3xH8biuerrfxJBu8m66/lkwch0f1UNgidsQZIoak1iYishT
	 aAEhNu34OVAlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAEBB80C85;
	Sun, 13 Sep 2026 12:45:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8ED4362
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB064005E
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-hH_jMrRWVS for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 12:45:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6DCAA40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789303536;
 b=LFr3r5vUrCd9aDkmt3jp8yDbl6lWwBOss8tLqBo85iAp/HZAxDB03qj0BtCtRFwJZdU+
 KrhypEIKF6Awkk1uBGiYmgsrK+/jYiW+l36PkO5LBblChnlCNQgUvvlGx0NHZVcSecBCa
 7TUc8nplsUxX33Ze5y6Xb2dr67GAvSkBhgoF87Eg9ND9vIjQevGjjoCYbT2Yay+tzBuOW
 Nk31aAFTylWzgq/vcAUZOoshupdJU4NnUAUp0nDPLe2g95QOX7BpTRY9gUyeHucn8Rjk1
 cyX2e5Nm5qyaF5AebSFE5ohpn7wZAO7KZsKDaIbWQ8MnhZe3mPj3ZPwRM/TgCOHWuiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789303536;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=J1wp1WEB2Ri5SuSjLc+K8EAIa830GiboN60s6Yeoi6A=;
 b=rGZZ4UNhPsNhtGO6hw4m8xOeIKBuw/L6R3poIkaxfU2rTfUNZtqd+nKL7ry69HgImk0Z
 agR7+P87iP6ox2z0OCRHfHAD6IEYcR4wVAroD6K/XhQZ/4IqMDUleDX1aUbw8Q0NcI8il
 uA6MXAcACFvKnHv3N9Z7lyvgptfsviwcU56u0f5Hv/AF3BD7n0ptYW0cvwd5NmZ1cEOJX
 Xqg75HWyg6SjVl+LA7LYrlevKUjdrMhVN24LcJuTcYOOj/2OCpNeH8gfy33kNg6DR2ceZ
 Dg9gT0LhzCUIa1JFHFiIJ9QdcYEnd+Q60Fi1CnrxUey7N4T0mA6OG0rQIkChJckmENg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XDBRfcS7; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DCAA40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:45:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1A1312003CE;
 Sun, 13 Sep 2026 14:45:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 14:45:31 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 14:45:31 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260907095241.935361-1-dario.binacchi@amarulasolutions.com>
References: <20260907095241.935361-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <e081d4dbb33c57af0e7d236b752dac83@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/atf: bump to version 0.25
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

On 07/09/2026 11:52, Dario Binacchi wrote:
> The removed patch has been merged [1].
> 
> Since version 0.24, a C++20 compiler is required [2], so add a
> dependency on gcc >= 10 and propagate it to kyua, which selects atf.
> 
> Release notes:
> https://github.com/freebsd/atf/releases/tag/atf-0.25
> 
> [1] 
> https://github.com/freebsd/atf/commit/67e7d350a15aff88c151b1fc838dac83d35be955
> [2] 
> https://github.com/freebsd/atf/commit/35134a317cdb486b4e7c0cdff20d1084d06159de
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
