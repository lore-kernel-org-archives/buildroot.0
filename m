Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABD4CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAE186075F;
	Tue, 13 Oct 2026 09:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQqXfvyubkBj; Tue, 13 Oct 2026 09:51:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9B67C606F5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791885081;
	b=EXRPrfdgOl9VQWx44Ua9gufVDNXx6FZTUnzSYJTx1ht4zNDv8X2F2gNnsihD3SgImSXR
	 svCAjLPqFvrth9LekWUl1hgnrXJ5B1eqarLxjQLKrum75AQ9WxR8Hdm/krH0mGQyVsqBi
	 Wv5X05z7I3wCGxjQyHt/fTaZIFCOIPr2yTNVn/49CP4tHqwV99Bgu1TIl5Gl/uP9xZux0
	 rtltzIECljhD+LtICs6MrYbnVUGQ8lUAdp7nlfl8f5iWKL89ppgl61PY1s5JcH0QXQkUy
	 ts4gvKiAumlHZBDLKcHjijDVnHhO+FdKbVYAnqCKArx6SvW578YJl/+QqAUKY2aBPig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791885081;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JesK4d2saTPg/IBsGDiyQ/dXe/F9oPoJKl56rTnYZws=;
	b=XEGMEi4751PyeB+5hht77CAnrcUPv52stZKSvNLqI3HviR2IDUsXHHie7a+cQSEKCqS2
	 y0vg6SiI2fQ6ord7qhWt87xVhabMzsQ1s7WxDgpDcN5SaPMwmY1EodH2u1x073kTftIsl
	 dUEUm5bkqaVbB7a0wDCy6MyqfujXHdHFqidu/Iyd87V8Mbo+0EPH9wJll5BlQ2F3EWuYS
	 sxAP5uUlxTE5GHiNUfYl2FvKzmyVAp6LH9lQ5vSdnmsh0ubgJ0dAYGplPtOCifZzqKrqE
	 kH9dWFmwlhpvqTxTJyBKX8Ox/k+cXOSpgysHTbRTir5x1TkjcckS6mT3aAzLHZZHpmQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791885081;
	bh=JesK4d2saTPg/IBsGDiyQ/dXe/F9oPoJKl56rTnYZws=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sFMxX2CAeELd3tIiyg912f37I/AdV1TaCxJh8Mv26g+GVd+kMu8JSJO9CghsDLnxL
	 OJxAkWgIdrCKDv9bV9DZy2/zENfqDCnpP/i6X84uqGoIK5iTA4yMKW0VAKjXtyZpUb
	 lcY8R18FyUdSU95ChAB2yeLfrrlayiV032zX+6ouPZx12sqba9GuCuXJ5jBScIVxdL
	 EU/A8LSIhFMHlz8AIII+7vpdplhoF1ijGcXf0u/zMgrPYVRG4JFPwFFRnc7tIicQpf
	 2/ITRpVMRzee7RN3Jn8noKBuNzUKHES5SUZucoqnagHrjUIWs4gsk6iDfzVDasWATM
	 vF/7Fv7MlWhog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B67C606F5;
	Tue, 13 Oct 2026 09:51:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2963A362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F1EA4067C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WKOrZHwmQDa for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:51:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B5EAC40674
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791885080;
 b=Flu/feJxev8G8XS4Ex1mR7b/gfZzQ5nFEtKDy69bNWabtR8FjBy62eqiioNfxROJJmwT
 HrpMYY3xxgUDQ2af/GPbKFv6IPTuI9eI3+enC3O1ymcnIJzHutTmOxpx6X3FfzulWxMef
 VGgIQ1ojoZQ39l+g02s1iOSBXIAS15s3qDIC+r1J6t5XOl/96LjgvPqltQOYNtcTGJ5bq
 Ymf3TZF9h5FGZTC0WUhfo009r0slqK36Ys5Ib8zi7B+PIgh4VI8edfRhxPxlARtJhNJNB
 rHBT62ko54nxRKp/YV9Izc+TdJN+WfVklrglKbyf4KopgNDHXnjzmu/mZz6R5YRz1Ww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791885080;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=K/iJFBTUOZ5zQkQrpt/3M5SFC5MRucPMxg7ZuDA+fWg=;
 b=SwdfYeqZ6NKD5HmsQi5Nc+dL+Oev9kvMopZvlPJJxE0scvvq1A31eQOgElkxncYY+qHO
 TFAuoFaF6z3tWtwGjgbY1zVkI/Vg1tj+tJch2YeCHDLb4IANnWEt+5VxN3LYUykrVgY0l
 qFILa4lxQgGM2adPaJ0jbGsmLC9omJdEeDEFpCcep3Bs1UNklGFpdwnArc7if99HQI8dX
 Qfurstb1L7fIIP/x19a9rprekG/4K7I24xdM67q2Q1s/ntZ01Mqu/U1h9F52HIoisMA9z
 sn4fUrYlBbiyqngwjpCWqVgG5ecmJzPOerz6fBn4MgsowKe86CSsM79q68KR5HekHQQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WATf3tIK; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5EAC40674
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:51:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 21F611A11F7;
 Tue, 13 Oct 2026 09:51:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E246160362;
 Tue, 13 Oct 2026 09:51:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 92C9411D70DCE; 
 Tue, 13 Oct 2026 11:51:14 +0200 (CEST)
Date: Tue, 13 Oct 2026 11:51:13 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, bernd@kuhls.net, 
 Jianhui Zhao <zhaojh329@gmail.com>
Message-ID: <as3_DSHoCrZIA-K5@windsurf>
References: <20261013083448.1588053-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013083448.1588053-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtty: bump to version 9.2.1
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

On Tue, Oct 13, 2026 at 10:34:48AM +0200, Yegor Yefremov wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This release adds support for Mbed TLS 4.x and OpenSSL 4.0 and fixes
> several memory-safety issues in the command handling.
> 
> rtty now requires libinih (found via pkg-config) for its new INI config
> file support, and no longer links against libcrypt.
> 
> Release notes: https://github.com/zhaojh329/rtty/releases/tag/v9.2.1
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

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
