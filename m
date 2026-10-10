Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C6FCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 06:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 110086061F;
	Sat, 10 Oct 2026 06:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIc_DuhP-mrl; Sat, 10 Oct 2026 06:58:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3348A60629
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791615496;
	b=O3R46Xz60nj39m3yTkfQrL1hmhS1rOL1+IIhXPQ+RsIGnFVWY+BRgTDD1/AOS5Tx4I1o
	 Ikui/fwIbbguukzDZ24XX7JEihnxrkUsErPPG/qPvk/vwRbhlO9vgdn/rAGa7xKy98+Q2
	 4tNLmQSch1Dp03pBs03iQ+hnt56b1Iu48MrfQLuqN6RYpBSYyJ/6PdI62QH2XC2G7bh/n
	 QnYdXUcZxTG4J7IvR84YfMMOrkeaEKfkM7+DgyJjoVwgi6wYNhteQ/MKvrW4iSZuyFSRB
	 CXoxpMiDLDEiyU/VVL5u2aPdDy3P3cikKLZjTSLJH8Nn7FpJpYAmgtrHTO+b+MFD1XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791615496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2Na7eoX6fjrrZCpcypMLQCjuNiTKkvwp/BDv24yUjG8=;
	b=lYjtQpAE5lMWUUECOMI1pdS6nuCZuIlhGacKxOyop08cttB9EtC6B6hoLOOMZG5lIMvz
	 JFLJgMzEDZQnzoKTeGz65SwUL9bZq0/sz10MlSdkt/+92M1H3C/2COQRro1W8b8v+V76+
	 pbQOjPL0SzBC6LML+aCX9zt03OWc7UTs8jh5AxESmVXrknSBdXmz5+rRdl5CxPzF8NnXT
	 2tUWXYg/6iGJOfgbkMw+2wmmo4tGADuDJERoh3wefKvKKu63cXpq1o7KC/Eh6VSOe4WTh
	 5Ug4qR88g23t7KwQC0eIerJ4KNcytDsohC5b9dCAx2C7vSwQQhDlz61Z4GTjCTjVvTw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791615496;
	bh=2Na7eoX6fjrrZCpcypMLQCjuNiTKkvwp/BDv24yUjG8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N5L21LhvwtLL5pMVb19lBbVxAA+bZ+IgGDG3OIlWMAsHKiGu6MNGWBzQQOGDXd2VY
	 lnjXJUvBiF8G8X3LvJZLOwnSY9gY8Zlkc/LZBW9y30Y+PLSUmLNketKU41gsMzmRM/
	 IoAUpU7OmTgwSoQM7E0a0JrS2jZbAj6ZSmmNtcYG4lRJvNay6AGJQDFOblY0YLG0U9
	 5vaY/Jms15ccDpQ+YHB08bPgxQBbdvELhVOnicnHuRHSDqf5+eLJwXb0Gy8neVMESi
	 HxIgz4MoQwuhA7HnrBy+G3PlE9TGwkbpfAaONvQK6CV5WBXVCzftpPq7KA3lKy+ZoN
	 yZXNO6RUyvhmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3348A60629;
	Sat, 10 Oct 2026 06:58:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AB40235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CA7640068
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njiDpmTlRYjb for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 06:58:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 430CB40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791615493;
 b=PV//vc380l1NgeTjoxPQGlKoMitMHifu3ySjKCgvm1NJq0CUN6x6HYVd5idMbccZ20TH
 K/ajoDsi4gwsLUJl8fqxaADAChsRXFpdk8aAyxWfFVT3dC8VP54G6KGJ4lTiDUCSq2aC0
 fHqFHExVYvxzqGVU0mNfuMkr3hHFxeGhv0tBtLqVOZouWU0pWrVctuG96Xk1AIrOAGudN
 2lsfRBnmYxd80l6dTQCVeirH+8nWPZz5oKhOZaFcZJWig4jCXifPsko61vTntlLjTOupP
 zyFF29pVdtXqid8k0fQ2Q/22LKcKGrUiCA1XkCGKFnF4xfIu61D5lxUa7xlIkPeoxCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791615493;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=P+EZj4hWfL5yX7k2tyS+J2JvyETfn+2eAqwQDY3b260=;
 b=Jje8fw9HsjwNsBofn3fE3BTY1jRyoi18xj7Q4Qkl0Gx5P3YXbYocLSPx0guSYiNfxuX0
 xfELBQGj+0fL1DAKiHpzHGfCNUrhaLpEEl3YQ3rtYcnpoTUHttwmjhNQs+4qtspHEubQ7
 UvLCd+636hgyh6YC6+mAsQb/O2ugHG3GiWcIqjqyE4islkfPixngYQnXpIC9GkuqOrUiH
 2jPi0hw9tP3egD7AIdGYhXm5cLVPYV3rZpoxde1obK+NkoPXc78doUBBSiujsIeSVou7+
 V0+pEey2i+cUefvNNVR0U3c1yGKyCY3Yam5zm4defvFdiCRq4bDcxL+rSLALaeQHGlg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sDhThPCd; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 430CB40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:58:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 210B54E411CB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:58:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A22AF6075C;
 Sat, 10 Oct 2026 06:58:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9DF7511D70BC3; 
 Sat, 10 Oct 2026 08:58:08 +0200 (CEST)
Date: Sat, 10 Oct 2026 08:58:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asnh-sHKhGDTk-Fk@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-24-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-24-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 23/84] package/poco: bump version to
 1.15.3
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

On Tue, Oct 06, 2026 at 06:20:04PM +0200, Bernd Kuhls wrote:
> https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

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
