Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E7BCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF4580D77;
	Sat, 10 Oct 2026 15:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fN-k_v5VZKU8; Sat, 10 Oct 2026 15:33:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23E6B80CF1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791646399;
	b=mI7pLF446lFoRFVdn2yQON8dB1fsMRofSjSwNbM312aZ8jKPzuUBlQzBXk3RJl5mGP2B
	 pJHYD1PQrcs/5ZkyonDfa8LO2NGpQOrM2sTWhUZj4xv3CVsc5J0vxr6Nnf2qvrVzYd8MM
	 ki7A+GVT4e8hzSwh8UMFi/jJV00m/GHCjN4UanLa/S/lFQxsq9cRDApgsNvlK4Yiktg73
	 4WxkGbh24Wiqk7LO0OPXWgO89livvY5ybA5SqJHReDDBGlt2HkdqLwl97IdK4KEWVq1hr
	 wx9ylTspIVbr/7DjLAAqDaPjXJzcLFXf4ueDJOqISSGy6HY7W7onfXPQKrU0v7r7RkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791646399;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=XGQ6sNJYsvDFYGvFB2ytyVyk07GSKffe29MyFeUBUqA=;
	b=rIpyRRq/LzLsqL6Aa86YFXhQZ4HRGqcc9MTpvoWKogTj5iY0mZ0DRsSkLn/ZV66NTGxc
	 5KWZCTTN3RkP9VwzZN2YO1P7cZ91DhyhZxdTyQRln+TjOkOWDp/LQnzXOabCU6Xe6ZAch
	 ed6y7eunE2Gl/CFU7tqnDDfKygE3kKuaG9U76IpVZvUcOEgnNTnWnw7GenjyrOLesAYRe
	 yT5KrCvMFKR30g0+GZFVrYV7Ai3ka11hptr+DsJPnIi1Io1x0kzbX//3QQPQIlzwsE7mL
	 +TYEEba2fZ05h1nj3Cfi0HjkDT1rRTKrQuN9PI4e1lLNYGAZmB0J2KlctTevF5B36ng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791646399;
	bh=XGQ6sNJYsvDFYGvFB2ytyVyk07GSKffe29MyFeUBUqA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pAdjO8sLucA4tqNlzZ1l+71GPxPnLn6HUEnpGKWQvYiWfkCb0aWOdvypDIFge1uwm
	 Qwc1Vv0etGGF4Ej/7vVK1xWL0mnChKuwr//d4viw2b+pABNgPtYt+Zn7qDhQz665z7
	 ZoM7PWJ9PIo7XKtAH17KD1SmGJg/0Z8vW+qydR35TlHU4D09Nt+pOdtZ1xk8euSjoS
	 UaczJdFUtJu7Hn8Gb5rwLhm5Q1kLCwX45xRg5LFZHHFbGX4YI13liUOJdnORS/dOAp
	 EMJdkNqopG7Bw16ZClWzdKofd42BrRPFfwA/eITrQ7JQ3OBT7rFHTuzvAEjLnzGUoA
	 ZNTIF6+m9xvRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E6B80CF1;
	Sat, 10 Oct 2026 15:33:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8775356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E34C4062E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMhqAh2DnYVU for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:33:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CFFDF405E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791646397;
 b=hMOlskqB7W92WvTd/wp+5JJPdiBO3ikmOqZjgrbvYhs6FMGYAqyzKUth6RtNRBmojxeG
 ijHtmDaGVDpFtiMhgK5IHJZlrxUl5fu0lzJCKJAIWDtEPCvCV40bR0dp4IGIS8FmdtAJq
 GzChK0NdAsCeYvYG00WsF6O4OnCRPpDZkwPfJD9QHywCkwMXSEcVVj8sGlrk+0uV++1fe
 sbv2+3CZtgfXpzGprwT0MHmlz+xkUxUkHvZOJ6sKRlTvU5W17ECyzFUZIN2pdB90FJ883
 RDEsMam2eFeMMf7ITGZk0Q505sIuhaSFDdn3MsrDlES0vtD2WMR6He1Q5AY4mL+cYBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791646397;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=n5xSJuAZ8apzrfyKCUA80Ib2KYVyPwgMMUvYXI5RmXw=;
 b=e18ifnuvuTxLMJ5w/mn/RljF463kN63IfsloPAfCA8wWENRy+6h1SLAz35NNQAGleVMq
 gZ7Wn/G4BzWBEDX8Mw8/k1x7XiHF09K11L/sRSxxn/gac6XCvN6M55DqK9umtuFU7s1tc
 bCHIEFTHJ0pwyKh4gW9q69qAyheobt7uS2KRaGomNS5CgiU0be5ylMZFH9kkjYhitZmmh
 jItQe/j3JRbN+OnETb4pQmOf65fcJDVEyK0YVlXdUwu+6cEQZmqgVD7eqJFxgwA6yPkw+
 Nvy+YJov+FNeg29AihiREGhcXzZ6Oi0XZqrkSx+Z/LmIOFEtYsVFPLLB5xEGbOrsD5A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b="LLMN/Qva"; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFFDF405E9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:33:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D463B97A0D1; Sat, 10 Oct 2026 17:33:12 +0200 (CEST)
Message-ID: <4538f518-b772-473e-8242-df6ffe85dd4c@rnout.be>
Date: Sat, 10 Oct 2026 17:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261010143708.421070-1-peter@korsgaard.com>
 <179164633205.140734.18236954927424328230.b4-ty@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <179164633205.140734.18236954927424328230.b4-ty@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/pkg-generic.mk: drop RAWNAME
 variable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/10/2026 17:32, Arnout Vandecappelle via buildroot wrote:
> On Sat, 10 Oct 2026 16:37:04 +0200, Peter Korsgaard wrote:
> ${quote_head}

  I'm experimenting with b4 and it's clearly not entirely ready yet :-)

  Regards,
  Arnout

> 
>   Applied to master, thanks!
> 
>   Regards,
>   Arnout
> ${quote_tail}
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
