Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E4CC88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53CB580539;
	Tue, 15 Sep 2026 17:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mpj_VxDtSSz; Tue, 15 Sep 2026 17:22:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4F2E880DDA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789492966;
	b=fJ3sTQMbTCL1f7+SchFCQSZSE0JIQkeAaCk80Td+/8WZfnqwzwaKK3hU7BMtesjCA0uN
	 gDl6zyBf3+c7XYDvQ2lHdudye963NG5M6EnA7Q7ajdMWjqC45uVqsS5mlHZtGN56Vla4V
	 Co8id4Ifsm3gm03fo3S8LTUQA+MqqWEMS9hlW+GhphHm4ipjYsJ11ro4AGaSZJMb+qL89
	 +kDXEWoq597PjiOonYHkBM7ffn3bl1lVG4wJGadY6vMud2izAGlH0ubb7n0aKBntckByK
	 5uRQdE3g/jez4z2ESCmi0l8cOhr/3Fr1rI0QW71jScH+NbwKsjtTV9kxooOFjIXtclw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789492966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xJKAnMQWP8csrWIgPZuLOE+VRG/j+4zpy/xueDfFR4I=;
	b=iJ93qDgCpatcJat+9iHWSseGCuKg4v9VUPUEnhi8OXAhFXAEbzrYTrVSs3Ftjr5oOlo9
	 0qSxnfkMFEdmEW2L2v8ZFHqXwkHAXPpoa6KetKxuTpDbdxYLZhDqDHIBuvSjBvWhnN9a0
	 yUL6f2IchWz1x5HtpHCVYrgRmzRBRGbFuzi7Gt8yVoHMAnWKqrSC0n2ydAd+ZPHYrBTuX
	 9yARCi9p7+jBH91uwR5j1Manfng0OEioQcFLn8LO5dSU/JVZd9SfkJeTHfvTfw5fs3Dal
	 CnhQbaPZAkj7B2p8MPbL7SVlwddfPoxWyBTHbyAoeDRqIpj8aANs3p+ZQVg+TumNm9Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789492966;
	bh=xJKAnMQWP8csrWIgPZuLOE+VRG/j+4zpy/xueDfFR4I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m+DaZtWYZStLPmRJo/kNQBzuEnKlKF1vlmytvcD4UpKcFHn+RdJV0eh+ThAj5WF0k
	 zVWRNrDWmlHfD+CoA8yRe2o59W1zv4VNY130IKDIz0+S+GuwhyFXc1AOqhO/8Ep0ZC
	 gahoQXijYBAPCl+6CaiUDUmEpaW2oBUi1NPs8VyKSLTaZ+y7Arc+w5iklDd1oo68dp
	 Co+l1anvdS9YDwanLRym2S3CeXMdc7bI19DO6yWJPU72XEmKIieX+3aPVFQjcnTamg
	 D7FgCMOt5H8JBF97AnYwcT4OvIS13241RhKjqnsRwG0IpmKD8iI5zIiJXIVTFKg4Q6
	 mx5DFtw9L+zVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F2E880DDA;
	Tue, 15 Sep 2026 17:22:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5210023F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38078400FF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qcsGLFj-Yfk for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3A7A0400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789492963;
 b=qZDT6GNkvugPuJtFM9XxqKNYm19iEzJsev2BAhvHRY251+/TdRbyQ3t+3kQtHNNgMFy/
 sOr8a1MNHKsANzYzAKdNYVnWp5RWFTXV4ZU++JTt7N0ueTaXP03fjX12YRpZHALKCvdPy
 +YvDlP8evA4kbY55f/P6TI7PnWqVklcIHYy7jgYBhoA0ICW9d0x2ywS2v5Gr985BXvIu4
 9e43MDDgH1xs0VsQ5zTLBW4zB1F1GI78haRaoPN3QORIAmj905edCdkveOrbx/EXZDwtK
 vAFQzbN+t0j1A+DfyvY+NtAloT5xpXJjILRV0m3+kNl7dxpbdyywqHg0JIV+ovEwqYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789492963;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=dRFBeyPE0tdmqKF6Drfumx8x44NSIGPV7P+AVw2gUSw=;
 b=ZibwOXTz6uhDCSoqPO8aTGg1jZrhDqIz/GBATTSc1puEey0EzMb0PDClMgW9ghtDKib1
 tzmJx/xLmTwmOKyA6jrbJz+xgpqX7odxfsp8nM7KW/yvj/Mt0TE2iFv4yLpzThY2pT7VQ
 kX4G/lbgAoiZDnCaG6AejEHBAXuvxrc33FHT/I+vHa/ubkAlVD7zeGiDrkyJbi3YCafzn
 SeIL71fCqmjEySnn6Flvj7fIUtm6zwS0FM7DGhKvf57cRTNDuTlQ6DS3cyZ+jcREhQOxj
 FoXdxGbyZM63fAx8jIgUdul7dksvFm1jDiQETw2/ktsvuOpidF1tPCJnvWF12OHfgyg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o6EJuf71; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A7A0400F3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:22:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2B04278050F;
 Tue, 15 Sep 2026 19:22:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:22:38 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:22:38 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20260914213922.1847792-1-thomas.petazzoni@bootlin.com>
References: <20260914213922.1847792-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <58bcdc3c74bd0df31763ec3708cd01ae@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/sysprof: propagate ucontext-related
 dependency from libdex
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

On 14/09/2026 23:39, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_SYSPROF selects BR2_PACKAGE_LIBDEX but did not propagate:
> 
> 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
> 		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
> 
> from libdex. This commit fixes this missing dependency. In terms of
> Config.in comment, we do the same as what libdex is doing: handle it
> as a toolchain dependency (rather than an architecture dependency).
> 
> This was missed in commit a73ef093f7b40297d69c6813c44fd4626883632e,
> which added the ucontext related dependency to libdex, without
> propagating it to sysprof.
> 
> Fixes: a73ef093f7b40297d69c6813c44fd4626883632e ("package/libdex: needs 
> ucontext")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
