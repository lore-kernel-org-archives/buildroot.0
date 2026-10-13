Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5E9CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB776087F;
	Tue, 13 Oct 2026 21:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxniVV6QIGIf; Tue, 13 Oct 2026 21:27:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3AA3E605D1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791926852;
	b=g39ej4zUHx8wzeT16fRqETClcUa7DAr8Ut88lWVPlLefYBdwwbm5hB/3zD1/CFsqExPh
	 PHPdzTgrGG9WBh/QrtgaM2q5AfmXX85YrsafKS3+yqZF1MxAeAKfRo+Y6YevHvPtIi2eJ
	 pi/THzqHWjwIbSI09g9ZjD/EQq1rd/wJjtcazZO49MXiExZBBYWiSB66cVbRBnWprVRTG
	 jw4ankhls005LZU27Fd7tcLL4Qt6Uvm7EyxKWK6jtgCbNQ/Dl4WGdeK1iaNZFc3r90DhG
	 Na2CNqcsr75s6lcZxFXyN154A/nS/ZRozJb95bxr4JR2AZYNUQR4EKE282ixQUyWIFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791926852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y7LBWozrW6Zq4lAoVXAoY/gaMzvAAIzBaqWTNiljk+o=;
	b=KPl6UPuAauf5C2iqK0BBgQu0gx8G90SOCZf8qDlD1BsxAo3j51o2KQrXbQ3b/3ZiMent
	 hGYOgoMDaL7PjtlbDziYdeWn9w4jfglfRk/pNHidjE2MktQMFEcQ1xdrHY0x2UkZmj1L4
	 saB/1pBooxfkAHhwEi9S4Hc1UrlPTakgr2C7HE+6uala4MbBMgb+9CaneCacyDkqe9hbp
	 SSwcCuiW4bW7vri5/BGIcZzd4wCzCZbMbhtLXYGrEItPUjJ7kZDxFo41xXrLxWVdt1NIK
	 5XoKAB4OpPFOKWN3gKn2BQz/rSa7AAsUgnOXGnEqQDE2TiRqh0bdfGtZd7xnyar2vFg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791926852;
	bh=Y7LBWozrW6Zq4lAoVXAoY/gaMzvAAIzBaqWTNiljk+o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X9lZlgJf5wS/8RrddKZD7fQldVEYcxq7AiswKrmIbbBUYpsIBKdhRDvN6XUN1Xc2y
	 VPXDUPG9Tk3WKyDIlxpwh5V0MZRo0goJ/Fk+KzvfqwyfSy5nHYZ3xohn1xmd8helOE
	 W+y7A8edhpz0eb21/fwuTvpKa8StG1jV5QtA2tA66Wkclb9oQgA9lGthjnwzv9Y3Fn
	 6hx4tLvnHCAIrIUhr2G8bbBMGHa9v+NYKFVI+jRLck8KUdl7wmJHfCORVOHg3BuJdX
	 RmXoMIa+bhKp975aYXcRPVRUgm64Zjz5vEniUnXfqVXLWE2SbSO+bBMekGcn09jHlU
	 Nlq9UPC5G81rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA3E605D1;
	Tue, 13 Oct 2026 21:27:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C3082AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29993606B3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBcblKWvKwwz for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:27:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D5285605D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791926850;
 b=FDCKF/OHMkVSieQ6tQjxOQ3vNRvnIlLLWxibeW56BrssQ1KVsVRMSxNROq8zmyl2zbLM
 gpN6HGtvC32V7VvpXbdMLRRSaQ8qHKslAUg3fVyBUzPyKzFVYm5omil3dVNaUGAkqpW3F
 pbNelYmPPpRX93qjR9OVUqFinPcHzYKm+m5EGitmvkJ9QGGB8A1/dmGSpMVo4BX+3xzG+
 IkpOyNKdddaeEJbV78JZApuH/2KqoU1iQMnCvY9suzQzFqZgIWFsLajQyiSrVW9E4+UGD
 /Hafdieczg73/NiSZjgTSQtch4TrTzYHkDOZcG0P7f2dFjamCf/WyCx6r+HGQbwUQvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791926850;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=k4UfpeAlSCVA4L7PC9UsR0xGuINv78t2yNbiz1eBoSQ=;
 b=JsWJimSWpcWSOENOyiRsXE8CtV6Cz6G72oFzggpffrcPu7ya8OuMcqOiSqg+GlRPFuSB
 hmxqv5wuu3U93MtMPCGcx+HG+Oa/4+9XxlkD73UKF6AxtNa06v9t4FxObS5BBSPPZ/rDL
 pmLRk6NtI5c3/Qlq5rMx9C3TtenfZFyKAjYMKqebOxkPUEcCSrvW/EfnweB2H8KDvKJ2G
 02f1trmVLIlLy1geQjIU2s6P3YOvX6Q6Buf194+FjCc7by2HtJqpg6ypWo3sUwQ2xt3tK
 S37DrcfdZEoxY5LXEz13zXE0NEQuWhudp4az7N6yPyaPE14nbIwwZ4PYHFJdR3O0Fig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=n9W+jlxb; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5285605D1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:27:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3E3F54E41208;
 Tue, 13 Oct 2026 21:27:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7415460362;
 Tue, 13 Oct 2026 21:27:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B722811D7178A; 
 Tue, 13 Oct 2026 23:27:19 +0200 (CEST)
Date: Tue, 13 Oct 2026 23:27:18 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>
Message-ID: <as6iK7oiOh2ip6Nx@windsurf>
References: <20261013204240.2392493-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013204240.2392493-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pydantic-core: bump to
 version 2.50.1
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

On Tue, Oct 13, 2026 at 02:42:39PM -0600, James Hilliard wrote:
> This is the version required by pydantic 2.14.1.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Both patches applied to master, thanks!

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
