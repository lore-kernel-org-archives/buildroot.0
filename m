Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF217CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A0BD60EED;
	Sat,  3 Oct 2026 10:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRRZd5sI1BE1; Sat,  3 Oct 2026 10:08:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D77E260EBA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022131;
	b=e/qeJSA3Nz75weiHxfQpC2NcNFJjpIEzbNRIifBpB38Xovi1oPhBWk/b3NJG0TPIVwH2
	 jo2TgMQC7GqjWrEtLg8Ra0KR2Yu9vdhYSRbAYJkOV3BFl945Doe3hfJ4JELougCiNIUuo
	 en+lW2sxJNXmqu/9q8QHoLgliH5qPh+GniJfG9nRZoo8LYhMPHT2hFVSqgJwAMPmXJbbJ
	 uRTz2HYUMsq7g+vn83w0+PXIHIP6B/VrqV4mZPFGMn32Fn2vQjumJNOfT6zOkKfqAl5TG
	 //WMXF7+SYlUIruijAj0OlEHprR5pLcJL0UrBpb2ID3AFiY+YCHdMJNMaqhiUwxiqbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022131;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BvzwlrjjHoB1ke1s0DmkhFkoyTTOcHomyP6TYGyjWt4=;
	b=DJ3XOIPH6xAiF3hc14DV/zZqRdu4ibQflzJ+wuhVSrsebjiRstx++86unVina7vI//qf
	 tAEg05xAXrGF2Vvz7rPima9QypvSDXHLwigSUIWIkp9uT+uHpYY9fA9fq+rFlioejRDNg
	 8HqGnjZ4gkOy2mEOclq1WC+5V7YXYC8PWRHSHMcZN/tu5Lomo64+VAYbJ7/pEAK3xOCei
	 55zxTDWX2h4wGRnZTxjJv1OSLRfyyy232b48nR5so9UNJKPjUerZgXYfK+4ZbZQQvBwE3
	 cAI6YkHjR1o+f33+2hbatr+207hqLL3K6TQeW/Bf6XKt+A+ARbi/VwnupvVYutLPgTg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022130;
	bh=BvzwlrjjHoB1ke1s0DmkhFkoyTTOcHomyP6TYGyjWt4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZDFkAdiCRZvnlInColoR/wXmxpJ4VWMmFrQjP+de6iEjmE6rJ2dXwf3UmZdW+FiJX
	 /Tc8tWVAMfPdYxWfC0TxeBq2je9EyvAJlHYcQBvX3GQ1wOg01oh2WK7CQ0K9VJ31TC
	 JGM3NsVR3wuIC+F+VUWcHMZOS3hTUY24BiqFNBUW3tdeE/J6yYiEJcEhHm6Ab0kh2C
	 uRQEsmgcu3E+ZPJwoKhG/1vgLW3p+KXwlHLtu1XaPDFKTeF2nTRDpOM27ijYvF1/fJ
	 pZvWZ4A/0lJTvcLqUY5Cm4RLjlpHRU4XHaoCheFRqISnokdbFiXvLaQwS21Z81HocZ
	 ALdUetaLTBB5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D77E260EBA;
	Sat,  3 Oct 2026 10:08:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F722335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CFD780E31
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzVL0K63c5ef for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4A9F880DE9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022128;
 b=N6DRz+DNnW2MGLXSUNv69jZ/yu0XKhpChKQe0E91l3boQS/mACbn6EKz2BdMF83ZIm+d
 nIvShZosC5qtoX+VPCeaJNTYhSSxtx5Vz6Fz9TI7Ej4fK2J/HcFVhUWE/M1zADOQbffAx
 7N72Lkfk9L7uUePXtPX23329rO0p9jjadQYfbZwFgJlGkzQ70aiesDgeYmrB/gnXi01Ty
 36RK1+r3+Nrvo4FrzLbkuljEA5vUQnutAE66tJGrIFFpdLmzLN+jBQiGRY4hLINcgQvOd
 5G22SATsPeSk/arir1YNFATutKVOVy5HVul2fLqeSt5Zehg1LT4Vlf1N7ih41ZC9xtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022128;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=aVdkXyF9yoBGxsPJyRfV1dV5wFhu/4qNp+wOAMc89rY=;
 b=EvQjkft/d6U1oJrRkRPmo0RDGrT9VetP3H8yz0Sqr8+EATQOl136N9CS9F6sCbXehUM1
 edd0sdHi2vCWBIDcQYxwEMw8QFF/h1DCc6fyz8GEVPGX7bpwjtQ1EWq9tJY86G+Qn3qiY
 gg5er0gm1ufeC2hKYLucVwxwry2MdcaNmIilYEgDiVNhQ8Xi4w9XcaLL4hMAOwlvKMLAR
 fBgtiowY0idTXqR2Nt24IwcyrArjLSPy1kmwk5n7m8eVOWxSLiew7X/mw88sPd7hyHult
 a21jVeW33+HgTNJySGh2K07D9p6n71aCxh88T8i/x7TiLAYKjaEN5f4b/af5H6kYvxg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nCD42iZ8; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A9F880DE9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 222844E4112C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ED82C604FF;
 Sat,  3 Oct 2026 10:08:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4317510328386; 
 Sat,  3 Oct 2026 12:08:45 +0200 (CEST)
Date: Sat, 3 Oct 2026 12:08:44 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asDUJ4tdNl9nImgW@windsurf>
References: <20261003084453.545653-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-3-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bitarray: bump to
 version 3.11.0
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

On Sat, Oct 03, 2026 at 02:43:48AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
