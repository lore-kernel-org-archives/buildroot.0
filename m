Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9725FCA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE4B640E04;
	Fri,  2 Oct 2026 19:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDT-Sd1UkYsq; Fri,  2 Oct 2026 19:25:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 885F640DDD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969104;
	b=PohCbj+EH8Yy0CKt9cE5EgeK7kkz2z+fIvslZlfK7OOalGLxznUPA7AVrBbCjDmgGEwB
	 DvxRArDxJRguiGPUD06BHpXD7jzeAh1JjULA322qwv0R5ZnXmGUxHJvv5httSMsSeN6UW
	 mimY3Yom6MnjcKOtgotdXR7+UzaPVq2XabpkbOTS63RcX9eVUIq+FJVRWtzkcoCDlqdB5
	 3Iu5TNklU/ZIzSQ6j0xO6zf0y4NEf5PQACOKERQ01iUTHu3+uYxVaap9WEr0UXf1jEHOq
	 TCN11MRNB7uOwiMJTCw52Nel8xd3cn7vLN9G+YTe4r4R8zbq46relhLrBkjiWGp4J3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969104;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sBLzgjCOy3cLef3k0wRPpQhWUcMHIA+6p4T4bwp7c7A=;
	b=bVUttqeI5Zpu4jFXvTtLMkM7FJW9MB8HklmUyscq3/PR9ISKtuqXSo9OTRdqj+4jvLB8
	 d6vfLudftvIpt41NLQfWSJP7rsFvi/m72nZf7IuI3MtELywP3MLMWv1tdWBh4dhdprw1d
	 xL8MEAyZAqw3L+LKgpwVlHoYJtXU9beeMxRTue+DlI5eKQsA8Z9i2JbP2ps69pC9SeBCx
	 xB2iasj3lPTP8/LstFXofhtBXBQ89ADU5vfaFXS9bjUSyDl9m+J1uPOv04Agvrxn/ubOS
	 6CN6oFVZ2s3N8Es1SQ0AFdZVGmI6pkQrivx45JhPBcX747bUUw+jqcl26PyyAr3V7PQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969104;
	bh=sBLzgjCOy3cLef3k0wRPpQhWUcMHIA+6p4T4bwp7c7A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gdbGDy7NO1p7wvs0lZ/saP54kJGJSKHhRmKCKfzYysyZANP7UI9gkYALiEmamJu8u
	 tXiuzVFlIfNCVHO5/QsNNLmaQ7u3FchaAGBsd4vIwXnPD52QmpynUSNUftLEL0s1Yb
	 hvETaDjefm3hPhXsiHaroW9Ltv06aUoMs5dlKnZQSNhN5lPSCGQ3RyqrM/iBkFwU0P
	 Us7vzgFgEAvYVYUP2FDkdqcf7GJHWMUyLQevlCMQ8Kk3vgIFg+foxvCjjTFKXPlHuJ
	 2yE9tyff5NVSbpIdgQ5e/lTjFhcc/qEtoFmDfUFzrm+ipkTBMbik8xDTORM0itU/bw
	 rTvk82O8LMkuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 885F640DDD;
	Fri,  2 Oct 2026 19:25:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 460EE1D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3804C81183
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohC2w0isI5od for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:25:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B581D80F2F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969101;
 b=JVF0HrEoGHTI1t+fP7+GPpOjm7EcuQZNY/Aa8Pka2ignj92KinBLP/U77x5ZxHWUD2ni
 aX14NQN9PWKI3JOOEUtr2Qh7bP0ZwkdTqFn9cUrmM7FH53KAezWC7rS2udY2mQVZ8VSJL
 DR8Mdy2YjfJva9HXgeEOXon5nBkaqqvWRaoqkkzjYuRiAAJp1/vau54BAnYENkKPSigU8
 KuO+8L5ufuwe6mpk2WXUFOJps0NwtwP1qjow9OH8UqxWctDxya2VS7T8URcC7qjkBruKR
 Bdf8SxEozyzKwqVHyFrujB+ieOF7RAaD3ZENato/a8CNCegHRrz9SDAJ/n34Oda3YkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969101;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Iz0bIXhnD08nJq6vLuM3zg4AizFBzrAiO+JuDjatLR4=;
 b=mRKuyTJ6km76OiQ85Wx2deIeeiuORY3YAmUBVC0TAAkKT8wTjQzWLG6acR8TcqmpQDen
 Xu3hFcRzCXDpTgnI3nsOCoQJ4FAvmgknl0h+bIymWxxp1OxafCKNg7p9GQIMVSqCd1vUb
 K8hs/VUb/HlBcjRtaQ6Rl6/m34+oLGK8sdqohAP3gQAni8E7Nv55D4P3T1BZ0AjEUXLy7
 CemdGfIS90IPGbIrlVJQRc37XUPVw4a5NZAIM/JqNdh0jTge1lfagilK+xJulhYejYxyf
 44PZ8JI3Me8AJ/6MMPBDKA5HZhHd5G84/6nfAvKQVXlvDKx7lwEASwQ7aYy0PQBif1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LfC1JHGt; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B581D80F2F
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 19:24:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 99F391A10EC
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 19:24:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66239603DC;
 Fri,  2 Oct 2026 19:24:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47105103282D9; 
 Fri,  2 Oct 2026 21:24:50 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:24:49 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <asAE_eXWDXCaffzT@windsurf>
References: <20261002054247.51494-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002054247.51494-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/gawk: bump to version 5.4.1
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

On Fri, Oct 02, 2026 at 07:42:47AM +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

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
