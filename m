Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3722CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 07:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A420B80F1B;
	Fri, 16 Oct 2026 07:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJWk7N1_Mu2L; Fri, 16 Oct 2026 07:13:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D6B8C80E6B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792134833;
	b=VJC0KE4CqF0KLkFYNANRGUcjq3JmN3yc5HynYEaX7j+eFkoRRZeC+YXGcdnCX/N9klAJ
	 BSYdPh03NsjeVQKDoNtgorHtay07gnocWUB2OgdJZKu6sCte5nsakecvQ5FPF0y34duXc
	 dYFv6nL1iWUOtEjXdNalJsbYUtgbl9t6S1Np3rkDYl8XSJTYjRIj6AcH1QgGeTX8HNrSA
	 gpaTJRPtN1qSvJkZQRF7r3r+NWb+tkw4xPdnfmvW/aXaxExDmaA7BiwlBrf2CPmBpxPVk
	 6SXCtwWggojclyV1NTKEpdz0XDy1nANJ6wm01eCniT4yMJPMwp66GHP77ebmsh7EVBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792134833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=S9z2daPYVCm9EGOWrSNHPu7z6fRl1yArdLx/N0bVQpU=;
	b=mgIhqx9e3pmVNtyJtpOnrQopQBfCJ4k0NPao9UZqJkG0EuauOYES/BeW1wIbtRYloxxj
	 SD8Ba5IKXpxaY9Xh+4bMJ3YJ/y6OQL4R8/ZO/Tp8Vsb2UwA6yuWbZkf19IxuszVoUZxQ4
	 Xti0GJChvEiGxinQ3RQNF1+hXbWyPlx2tvvnPnbePUtoip6oPVQvQDgjnH1xuqYtCqbb+
	 VtDW7jfRG4i9YkfSxQknv4FcSyoHleyEfyGaEAhmh00xHDtZJONdu0y/CzwSnzBsrVVOO
	 9lCcbd1UqmsekBJFAKlpgIaFTNGwYEMfSZfYmztsxZuwhP8HOZvSSunZYyOEg69W5qA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792134832;
	bh=S9z2daPYVCm9EGOWrSNHPu7z6fRl1yArdLx/N0bVQpU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OjjKc4PnoXuk+H+pdi8uQ9TqmlfBJd8RAmdHp1wf8FZPedlIijhZPG64OFekKpaxK
	 gZ7x4zRRI+O+WhsrZ6ksuh43VYA18cpjdWAgs2LH3TYmm/XdwRwf3nibY0NNpltXNt
	 CUG39Lp2eRvTIvQ3cQHzYfd+PP0s/MPVMY6zZNPxl1g7oYsYGOgtIOV9RLzBK59ugn
	 hI6qfu3YybLnHQypXYXawLAyzk1zDkr5b9sG7/we4D9D86ihyrtUUmgEvPe0vT0jdx
	 0W2essmVAPFfUtY1v3oXxPvWrS8LDTHjb0K+Q1W9s+cfwdJo3FJ1fXidlraYcrClmQ
	 tj5JSucdf+9ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6B8C80E6B;
	Fri, 16 Oct 2026 07:13:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A26F81DE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87A3080E6B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EoZUmvtNLe6 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 07:13:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3560B80E45
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792134830;
 b=I65Ns5/q3VdJS8tHvK5O+G/gslAJHvtkqeLExguHmmJEgdkMB2MAa1cT7d2k6YJU0tss
 5erIKlGDP1cgQfK3hJvVniYrMHdCacAdZPgDELoLxPfPD7tBRz8dfF+hQX2xBAZZFp+qC
 RZ7d53DyKYYVt5gA7D6nL5mdN9R1r5mCOUYq0jSETGKJgfG4EGc7uF1ALVaDtyP+KvLuG
 38Ooa6dI/G++6nGJxhd9/m2GBqw0l9iR52oSu3CzWOsq97yPgI/DiBftAeOnP/QBuQLDE
 MRp+WXwn+gqiiCngF6l0/89PowXogIU0pEOGIpEvp397FY8Nc+6fuxeIHcoIj5zBaMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792134830;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=FfDvVC4RKIxLjrg7QC+5al0i9KPQY3ZJJK1FfT9uPGQ=;
 b=iIKSDdS0cCY1/4T9GOPDIlpLnogr73eVjVbPnHv68Qk4hfrVIg/b6L073MlSsVv8fQHY
 pBSKOrxg6W5ZTIWd+VeS+pKvR2d+S0jnK7l0Nfuhfys1BCQp5L0Sg5aFGTCwf15+ahvPA
 g0+R76zHrmmIwopkDKnKY26HV6xQdd8PpQzJEo7EDwMa7+Vr6TH1A85ct8dWYrOQ5mf1X
 c7rfnhQDuBEtobuvVilSF8yQr4B0/IlslZ1B5LaBt7AUEzWDqhc47j9OoxrhNdK9PCLvX
 9bVHOf1cK186e6mGir9X1hLlsrArZTROJOuxn3SFQZiZt/Eor+MLg0u1B6wHkMpzO9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PCIygu2y; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3560B80E45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 07:13:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 293674E411BF;
 Fri, 16 Oct 2026 07:13:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F09D26075D;
 Fri, 16 Oct 2026 07:13:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DFB1C10328C6D; 
 Fri, 16 Oct 2026 09:13:44 +0200 (CEST)
Date: Fri, 16 Oct 2026 09:13:44 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <atHOgebJUYW3nKan@windsurf>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
 <20261014164625.1474866-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014164625.1474866-2-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/libtpms: disable building
 manpages
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

On Wed, Oct 14, 2026 at 06:46:24PM +0200, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Libtpms builds manpages using pod2man, and fails if it is not
> available. The patch adds support for --disable-docs, which Buildroot
> passes by default. Found while building in a container with minimal
> dependencies.
> 
> Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Thanks applied, after tweaking the Fixes: line like for PATCH 1/3, but
also after adding another Fixes: line pointing to an autobuilder
failure that your patch will fix.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
