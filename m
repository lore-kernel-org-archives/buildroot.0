Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C34BC982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CADA380DAC;
	Tue, 22 Sep 2026 10:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRYQLGKk3Z0r; Tue, 22 Sep 2026 10:33:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C301C80DE6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790073225;
	b=GA17zkVnvI2FSHDD0CJildphDBQeWE5uvHNnyeTTZv3EUpOuCjTkhNddEAUqiGSeLKQD
	 BjZ8jyO9c8ui9xm8x6FmTdnFpEhnYZj7ha7HbR1ITrtVnqjAS7EEIUDXM5t6vLcLVIuZ/
	 w+/p8pjrPNFBeb45cAO7hSqOy5mOEr6TeYu+e8EqwQpN+vK7ilAwtE/FYhum3mEOHge43
	 1ClkWblVnVJ06HnQehB9U8pDLRuMHuvtPH2xtZqlRRFPXGZUN5vvDJzShwY00a+rtrt4D
	 Mhd4H51L7lT/n11FII45c++Fdyc91GJE2HZCsCE52I2jEyma/iLVx6rsgI3AXxs6/4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790073225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=BQHsbS+I28zR3+Uca/Ugh6hK+OItdX6ONlOcMlzFBNA=;
	b=iy9TDGr9rx+XCqq3VkUojD3LBV3mS2EREXLhXaT/HSkt7mMf1h0L19eIRNBf0rZwZfGD
	 9zGstaeuM0tzmmspSurKDFdoWVAs8sGJe4fd8O7jKT1wWGdAATI733nS2n7E8PHwPcmzK
	 2u0v2ikxi9Ps4JQEsQoE7EHR5ch0a87A6Ygxt9t2XQIshcaNYx18T0pSJ0xVXS7ybiYNF
	 WNv8e3m95bLvOkvZN7tVty1WVcK9gM24XldIHps9T+T19op6utiabtiRmrO65gDCBZREZ
	 Nrvgn6gdIc3HnhMYDXV97xNh8D/esYrQl5oZvR/oqD3JYzKLRmiitFh3IgUkxNGJ8NA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790073225;
	bh=BQHsbS+I28zR3+Uca/Ugh6hK+OItdX6ONlOcMlzFBNA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mio8zAlD3lPFwt+j4K+kulb3wizsoxcDfsNZybU5FEPoIiepT4dcnTcafFCGtlN1w
	 /oOpRlIAeNLj76cgcifRjz5YE9wTTqYC4ieOhiBkEOsHSdbCz98hiuaQb9G7ELB09V
	 mR8EPQgm31MNxUGYp2CJHsXzdVC1723I3/D+VqfZDLO35STvuOgwrbS9+Errh0gCHj
	 RpnwWeKpe4m0+lD/SrGQxUc7fMvhF1Uz7TweFmJzxgNfSc3O2L1RzOSU+nq0pI5gz5
	 r0JAe0qTD2TbCvW19Slg0er8G5poZTpXOZr/VHeG6WruoigP4FD/un8Ke5L5UiuKFw
	 XAzf6RZtrk6cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C301C80DE6;
	Tue, 22 Sep 2026 10:33:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE88D13B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5A4840194
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gO6WaBp85C_G for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:33:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 35C90400F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790073223;
 b=SaxjNzykUcm7zZAIzLp0Fp4MFYQZXQnJyrwiBqMwJLWFj4L4cYf2Exiw8KjL2LXRC2+d
 hl3b2qKv48AfVBQ1Jji0HRIm4235WJm1iMAMemkHoC03I9h6FJQtxPAmEJRxfKZGeylYS
 6+zM8uMPZTT/96ewHYr9drknxrwNIhjqe/xtJu1t5lxArMOwfsXqGeaEGacGZuglW4qYv
 eyWK0ZV1VdXbN/0jecAlKXcBIAvW1iRuIwnNQF5P/OCKUIrujMjyPtcoyBuAJNPypqRTp
 NJ4rongxvXR3jH1Djn/FVoZ4jLEyluOeGcP0nFMYwyx6ag9V5Vgzv8A0PbzuVXl9ORQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790073223;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=LhywHtApDc/u8PLEieIITIbp2yLEK49IpbHS8I6h2M4=;
 b=U6kAR75ISXedVhk6KozAxaveFRMZp72JFxr2a64GwlX9RcGJqtJWaJHgSKHvi2lgZasw
 UEI6LAha0xcJaybkrSg6Ti39r2+HDEzt5Hj571/WysbsoIbUoyeIcu5qjYvsmU3kteREn
 F0Tu1gXLg+tWRC65kjaEfPA0vE6qnzbOV2C/Pkq2Nx21T7TNR8CfBdUtwaTYO+g7E/eqo
 pb4+T96o4lSzJERV2RmOSg+o2freLclRAB3VH3ccdzsSGYL44MqOYEoI9sAWTL/+CBPjD
 gTFNsIK5yT/R4pTMY+zABwSk+dRga8IoCbwpQmmDVSdFXQkn8Ue+JVUlG1af+xBuHng==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="ldWA/eLL"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35C90400F9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CDB8760128;
 Tue, 22 Sep 2026 12:33:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 12:33:34 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 12:33:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Qais Yousef <qais.yousef@arm.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260922063106.84043-1-bernd@kuhls.net>
References: <20260922063106.84043-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <256d094efc1e5d4fa04b89450b0e63b0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftrace: bump version to 0.27.0
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

On 22/09/2026 08:31, Bernd Kuhls wrote:
> https://github.com/bpftrace/bpftrace/blob/v0.27.0/CHANGELOG.md
> 
> This release includes
> https://github.com/bpftrace/bpftrace/commit/d7a3bb54a3d5b5682cce92fb326aa01be2092d47
> which adds support for LLVM 23.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
