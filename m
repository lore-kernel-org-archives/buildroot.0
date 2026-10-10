Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E239CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E953605E5;
	Sat, 10 Oct 2026 20:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aEtQIzRoipN; Sat, 10 Oct 2026 20:17:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BD2286061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663440;
	b=V5YNI+v7G+ZabS/EbBjlenSZOSmgMQbmdMPJ5y15B3QC6YdU4nxHHPVO2IIT3PA79uYU
	 KFOSkZZRWdutiTpSbNEyKAVLXFK77o+NNEUp9epEU/xVbHqTcfnR01kyGwNa1g9k357eT
	 NIA963cnGLIF+HXv+HLgXUHRrfUVIrMCzOOYvUQsiVjD+UDbnCh9SE7Mp/2abq3y03TcP
	 ErytLwFhwf75rJ6HS8dybPBUhyIThS3OfM/ZrWSxdV7wi+mDfcOpW37KYvcNB/ojPnFvU
	 fhh6rOKpLGq2Kv5HnERUKdY2BXDOBi+RgY826E73DPIrg40uAcUIKR4468TB1Eg/tIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663440;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hlMff7vPnT+YYuLtxPXgqAAE271HplPH2BxBnQ3eF+w=;
	b=ADmJ/I0rzkOTwJ0tAiOocsJtAIhhoGtdOJ1aWVB2UvTkXparBxXbXRh44whhBWtA7yT2
	 3Agc+pYdXctbQzHI896uNRGdJ2/9AVar09XMIjP1lZwMjBbUsNKjkObx4KEJMyF63+1N3
	 qzURw8rPgGWsqtJySAG+1NTbIonsIveUAjc+x/L8aqI52Dr820+KGSNUymm+tP0LjpANt
	 oAIE9aIa0k9pJ7Sj4Im39/z98AeC4DHL6vEW6R+LBzv8vClDpbyPga9l7NXbr9Lfn+uPD
	 5OH5XPnnTTVERx0MY7dAQH/zQzFTsiUZ5CsP3d4Tm2US7uCzz10lggHW/luUWbPUF1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663440;
	bh=hlMff7vPnT+YYuLtxPXgqAAE271HplPH2BxBnQ3eF+w=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=LEwwW88sQOwVxUYCOSzUZ/wjVSqZmc+VoxODtEILu1+JsziD3GVuCFYmcGFYURHY0
	 eg+vZxZAGfqsh9+Yc7LpJuLCGgm15AiIsZ7dInrWCUJmNYIziH7qzK7cMuU26ioFZk
	 2FstOemCqL9ev5bGWH5H4EDV3e1t+n0THhMO2pN42kRr+9YTAkePsCVBBVX9dtcARX
	 YIZZrgB8bedMhUJDGK08B5eMkoce3vSqOKfvMRet9+1tm1RsquHECLYsFx2u99cfRT
	 psZZWvC6zAllysTnDYAbpVqtg8/fHDkYZ75zTnFlwG/SqBPY2PIl4re/77FCdQL22O
	 DXsVYTxU2lhrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD2286061D;
	Sat, 10 Oct 2026 20:17:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1B92105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87A2D80D77
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2pTZfMK5OmT for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:17:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A87A80C92
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663437;
 b=E5GT/5tEEkCp74SQ0Rh21KeLS9Q39g/eAUucVf+JwibfBrfeYC79eO+xfqvpMxMZGtHu
 EOBqnmqTN8cBaIj5BjrbE9fB88BzwfjhHWR+woVxT08Oh/lmY/PsPnRIqi2OAh22pdTVM
 Q0Jn8SRp6xqY7uQKyAnY7Zzz33nKYoR89B+LkQTuC0Gu7USe3vb6Pzc69oThFAoYsEZ8s
 YGPPPRWQD9OTl76LXH9osbQOw4L2NEBrOBkHV7taXI+XSGAtenrSQH8c+1B/Gj8pk+jVV
 Eal+CSv/API/mvWUARmjAB9QBdmozSl5NFIJmO1029QhnrAhUUdsCcPmdMScPtpLecg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663437;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Za3wyRWftrbEmnfBUCEK/2A/Bpq+7HQt8+IlxQJGxQQ=;
 b=Y9dQJwSNVnhkOsTZgUea72GkLXgl7yYGQquAEcurWllLOswwpTg2k7tnhJvj3tHwGUxV
 FUb+Pf9LMF6IYTPbSvkKEYH5qRqFCWJyR/qq36+Rzc3mG1T9fYIou7dQefeBazubwxSLr
 2SMk20CLJ/hbF3bDYnUEj5JWTnKTrcjJR/ap+hYcf3rFKWWRIvF7CUbxdyGyaJaqXGAf1
 fNS6fGXehJktXbU7kW4ZN+ItMfx+VawMOwtmvMJROr693tbiaDz0s88dTbymyVt2iDwBw
 m0j3BNaJw138FRnG0+3T3QjjCNTEDz9fui0Qib60R5/t4XYiUJJPgSwlD5L6NjD9V9w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=G+GTKDZu; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A87A80C92
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:17:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8A2C21A11CA;
 Sat, 10 Oct 2026 20:17:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5E6B26075C;
 Sat, 10 Oct 2026 20:17:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB56D11D70962; 
 Sat, 10 Oct 2026 22:17:11 +0200 (CEST)
Date: Sat, 10 Oct 2026 22:17:10 +0200
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <asqdH5biTsCTfVXp@windsurf>
References: <20231009131120.134257-1-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009131120.134257-1-nolange79@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: fix build with old
 glibc
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 09, 2023 at 03:11:20PM +0200, Norbert Lange wrote:
> The build still fails if newer kernel versions are mixed with older
> glibc versions (Kernel 6.1 and glibc 2.28 for example).
> 
> Apply upstream fix [1], see bug report [2].
> 
> [1] - https://github.com/schubi2/util-linux/commit/8d67fc4e66816791aaadf0b03940b96c6dc3d92c
> [2] - https://github.com/util-linux/util-linux/issues/2448
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Sorry for the very long delay. In the mean time, the patch you were
backporting was merged in util-linux 2.40, and we are using 2.40 in
2015.02.x and 2.41 in current master. Therefore I've marked your patch
as Not Applicable in patchwork.

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
