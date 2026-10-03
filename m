Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0064DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA36A812E8;
	Sat,  3 Oct 2026 12:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTLGxdiBtUop; Sat,  3 Oct 2026 12:36:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F13BA81235
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791031002;
	b=YOCcJqXZWojLiUMiO+Px47YVmzv7no8+EUK8ijeTZlYRFFS+zcKgDHyhWshx2YkC+9ft
	 LW86e6lEyDor/J3Vr3bITxZIMIP/rtwbSX4JGu6i9nEbk+Xgh0XCUcN60Laeh6M2EPjPo
	 tu6B0rchHR4GVjghpEjbO7W5xt9M1wByCN68b0Ug5Sx4lwsButKE8wJ9sw39SAbYr3dJ/
	 NHkdTDQiHItSsmmE0cvaX+kp400RSFwWQll1n4s1tMckwVFsAqtMKons952TRNXAmkXUN
	 2duSk5+drdJsZ7ti3aXVagsGrw7nTPURSvJWZ47+IaOm+VCJeqh5rOVAI7iopXV07QQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791031002;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/zhIt9Aq4wvp0aAYWOEfK6jQjlVc4+J8k751nY+WufE=;
	b=NFXxdiGfAher1LkH+rPtu5UVX8n0e6UNWBVcYMQzv7VM8BYsa48N0u+ppwglcAyHV6tA
	 38fdT+DD0WxeHe0xZke2DCYilv++YQnRjtfGHAWr7UndP1p4DFaKxMBrg3KCQz37jyqoV
	 30Re1EDOvXp1w4X6eQDGiZlWtLo7VimxMqxNrD3IP/vrtOTPJf0V1PKT1hDidcto1w8zI
	 C9ViS9jFavINPrJS6O5NMC9LfSA+Rvryn4wpStM+iEjTYPj3g4N7LX62HNuuz1oWcGpp+
	 WpAn3vz+3xso+z/HsvJxYHFemr6DpuxWSjSRo9B5DMqhVeBejLVkL2sdeAaE4T5uPiA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791031002;
	bh=/zhIt9Aq4wvp0aAYWOEfK6jQjlVc4+J8k751nY+WufE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jo1QUiPKlx77UdOD8vmJxHvhej602Le1Hi5FrEfWzSaLxV/GFCmV2eGzzfmmDv+sB
	 gCUjZYw/bRffoCHq1AppB4KxLzpfY+6EXnxljHiCZyab4kRWtxZqL0Bbst3GuPIPTv
	 8AmZH8BzD10zwioT6is5Qm580v/NF6xLWDv9WdefU7jPSlf3GYW745K/kGLvk4Agfg
	 vcWtswaL0556DkHHHs53IFf0Qh2KOQ3ELM52fNx0/F8qqz+SGpDd8XyjcaKXhacJs/
	 P2Sc8TcA59T822tBOxuRxY24SmQZu1rN6zo3rQp8mTqq78Ksbz6Rwosvi2DNT6T8Ms
	 RQWODYl1ih25g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F13BA81235;
	Sat,  3 Oct 2026 12:36:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE2A032F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF2AB6067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cy0eCnpD-1et for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:36:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DB0E060667
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030999;
 b=RTvi5vuc9ZqOrVVYAw7+aV+o4bYJ3Kb+yqzcK7+/i7pBUS91/XKKisjvPb+AcX2TgtOa
 7so6Syqx1dSrYPWTf1gbDPWxYhoMOglQ6dSuZBFQVOiKFU5sYGVRVdDECMyBlDsNamHMw
 Kzsqs/l2Ca1fDG5NnSeGo845sJT37h5NWkDLYjq+XzFAwN4ptMJ4+rp6CSCGKkEB+Jd0d
 I3peDoXSANuCmXWrmhbh1Tv/cLJLm9smlkRaLgudFPlCZTYEchDk7jUJv4015tywAzRev
 kEgOZOxK0YLaV/YzZlr2XAXQQcnyAFH1AvKmTrHfHQL2m2P7NRomNl8TVnJfwZN/xkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030999;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=GTIH1v5jgAqbe6p72riT89a+svbquxoiFrUZGh68L7E=;
 b=AWG9VYFjelqgDDLw0T2W7P243/4nGEqJa16ilCvwmIUrQLCj8MKcaqHALxbyWu5VusVy
 w+kZECktUN8CwpxGlrenco+v+FTUSf6lLNiA4VeHj01q74XmWeEynQULhEJbgg0cY2vhd
 ovtN4aZgNBm6c5vP5AnceYRzLO009Rksd4sQ8pRzkoXY1hdDMA0jHEH1IWnZVMACAprus
 jBHHEbyJL4h/kGJN0Dvqc0xQqigbaHNW4SmQ3VaMYWHe7tb6x7mb7PDOLc4RlMaJBGpZG
 0ggwmgB7IYcFsyzdMF0CTT7ZXqAy1iTddCgcpove1pXM5eUer5X7Jf1gPi72MFYfoow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mNf9RBDW; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB0E060667
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 124674E41128
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DA3F9604FF;
 Sat,  3 Oct 2026 12:36:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E682A103283A3; 
 Sat,  3 Oct 2026 14:36:35 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:36:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <asD2z9BquF00I4yC@windsurf>
References: <20261003084453.545653-16-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-16-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-magic-wormhole: bump to
 version 0.24.0
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

On Sat, Oct 03, 2026 at 02:44:01AM -0600, James Hilliard wrote:
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
