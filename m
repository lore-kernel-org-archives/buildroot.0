Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E74CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ED9940640;
	Tue, 13 Oct 2026 08:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2aHAGtauk_0; Tue, 13 Oct 2026 08:21:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E33264069B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879709;
	b=k5IXVk1TRMFVU/Oh2xRnpmbc92HVOU8ekKw1QFco9roU9iwkUBRbh4KP2b6VuOXXtoC6
	 Ca1HoYW6t4y3Tq8XUkt1NcEbex/NoDzpAg6tq2URpgAKx/1WXRHiuJYGUlNl2Hdum9N7t
	 zmgkkhgI53sZ3OzgZcF/BeS1Xkmy0gcuEMKAHZKMgJqAZCLqzg+qZIrO0KhzbFpv793wE
	 +y4Q1AlptePI/SeQqxU4eCr9EQGb2mKumUBAK8YSenTvejoeNfqsXa7SdL2RWDlyJYazO
	 a7+oGB/ZFK/2GNIX57mwDEYjloa9rYfDJlIIti+/hl1/sMy/Gkce3PAl6g7AGXjWXBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yrxNBIBfDfsbbSHyOaPadj2LaGhZeyG7iYcansLSugU=;
	b=bxnjxp7lWfiKQIYyZ/wbD/XTk5plUAISzQQWCiEZHFnK4qEPncRcmIdoeF+yoKQqzbNt
	 Yq2pk+KCGGaUu/76UYYGgo67tFSYXjqqlI4wj//0nUsCP17JOAr+04uZftM3RmVTPawwy
	 jZL5ouxQfDXpggtrgA4KCKUsnS6V7wjkpRIRagSolIbaNPa29NH64iLm9mSbFAcw4Mu+i
	 mnjLQqyQo3/46h0sbVD+uDlBF+td4FUfX0NdUqzjpbE7fHFXW7AiyZeajJKOP/7I5tlIB
	 x77c2RJ4z3wE/fcBdy+CsnaZWKf8k84gmxP6ZbkjmkKoeLLVscV5WR8J+1s71Zl8p/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879709;
	bh=yrxNBIBfDfsbbSHyOaPadj2LaGhZeyG7iYcansLSugU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RRENENpzHJq2IppXvuz5Dsu3d64GfRjXjn6dW5kVGlpUfJ5pICEVLrQtwFFfZCcVj
	 M0MhZk+htWe93k2IzvDCH+qNEMxML/sCn7R2VU75zbMUgkSV6WNORTHY66vA0cLZ1T
	 GNiD5TLSnJcDYXkHrhl6st+eZLXfEqM9is3LfnRLFeXZFh/44i3RsGhIzsDj5Ms50n
	 pgTmZVqwL3SB0XHhsCPJfhfh4TENAzBOx5/H8EABuzXTwAxNfBbd3Fc+wUALPVCNVC
	 lyETT1+fCapiFTRO8UCJzFbr0MP0TJ42iaag2Pits0vSO+CH89oza7XjxZ9iVKe90l
	 Oy4brI/J67zxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E33264069B;
	Tue, 13 Oct 2026 08:21:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 027541E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCA6440640
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCUzEvQ22gPS for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:21:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F0F2F404E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879707;
 b=tPnJnVauDU55G2l9v+pzF+w8RSpoOp0B4QHsphFp1yvjBTJ3IyeSOUN365BTETPwdCE4
 8YDjskBpSbpk+UlAoCqMJBJhSPbgSC47/qodR57UUCgpiG3l8+jpo8w2HTzDvprMl+lMI
 T4y07/zySTZ6IMzt/cNZ/lttxLjs/rYNZFYImwLXcPl0U7Hd+ruEbu6Sqkt2jDDpu5C95
 O0mtGQ4c1QtlBfEOcrbsnz4/tDk+ToJheSpIDvATovEoUzLmdZZMEqWjqXdWSK9efOUYt
 Mv1R2NgeLSouxMVuE+F87Zp3eapI6Qk2y/WKY7bqDz0s1GJQYlvkhrcxdSnjhlCF+vA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879707;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=xCVvlt6tGujs6ZQ7yqaVD3qZMbIjtrHjzO6rkdLk09E=;
 b=kndQ4SQ7Dh6EYO07sNoN6w6nhnwUDk/vQ2jgMFn4IDfGyYPswshkMFSN6a6kPHWrA2Ca
 byZRqs3qOvBNHWfEvxe+2ZhPiGXR3j6kfsg77FkDp2OBbQV9Ym9lzRusExWdePcPKKYRy
 yYZ0V9Umqjh6duJdfUAmYvHQSdYgkvDZWl03NbL52k5v6WZSh1WrImUdIIYV90M0qseLA
 VMPtc9fE2y/YBUBe1/DCgFrSm0owpITCzndLycbJf9Y816bCkwpREmNscIsWHiZ2U45FD
 rvV7Cbtnf3I0+y51VP8gko2f+hZqmTnBJ7B+JK/IPN7DXMCn/NHWjK8Rn+TwzKOQgFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0PyFXgi0; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0F2F404E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 69D594E411D2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3704560362;
 Tue, 13 Oct 2026 08:21:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5265511D70602; 
 Tue, 13 Oct 2026 10:21:43 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:21:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <as3qE29BlPU2QlVu@windsurf>
References: <20261011130058.3443432-1-bernd@kuhls.net>
 <20261011130058.3443432-25-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261011130058.3443432-25-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v9 24/52] package/uboot-tools: Fix build
 with OpenSSL 4.0.0
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

On Sun, Oct 11, 2026 at 03:00:29PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
