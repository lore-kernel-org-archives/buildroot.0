Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB36CCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B435080F24;
	Mon, 19 Oct 2026 13:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lbuvsW9UVto; Mon, 19 Oct 2026 13:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 499CF80D34
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792415678;
	b=iVif2DQrnx5LHtDvmEWdWn4avUIOjzYjBDIj65STbnR76/791iM6SyRYP30g3wfpoSo6
	 Xk3PkKtASIaXpQppXj9aDcuKIxUUtWmqN8845yVJNHnZZboDbV1XDqUWnDs60DGkRY9D9
	 Q6HZPzE5BW2CM4GlwkKna1KtdXbuYoiMxBUG/BTJEw5d9FMTvqOQcEIrlQp8vSfA+L7+h
	 KNqVDIE3doCxtgjYw4rTJh6LXtFf8V0jI6G+EMGoJ3QU5B6LMnIpeMWW5p27qqQuT4vnQ
	 Dp4VTSzGcgxihj2hbBo2NeBMh7VrHMgBPZUJi69dU9fVO16M4SUlzu1kOvdULkWVn4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792415678;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=l8PYHTsiDMRur90JSzlL0ACOvFSSPUUJ+3Y47fET8zw=;
	b=n9cZ36BkUa+wYPBzREN50zrxa7EmmYXiIXeJsxVvzCsHUWhGLagA1n4QQF6DLax8Zx/g
	 srHz+xWrussz0Md6sMoq7l0PgodnpEmBrq5z0KVzLhEcmNvhlvtgKzsGp/PvtBtW27CLD
	 aqMTHThOoBKAXAt82afZ/OVqR7OLk03WaoSc0+XyTyU4U6Cu6Zce9cYEnwM3R4WGxO2L2
	 6wdlQ28h3kDHVrT6s+1H1062/hMsrxx7vPa4qVC8Y5aXInMFWJ3OvYq13iFXhEsqNkVB2
	 TMvRmJZ0pb3yhtkLJCh7vM2RPNi/xw85EGuPw95Md3bP9zzzXcpchxDMTaDcqLtAkNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792415678;
	bh=l8PYHTsiDMRur90JSzlL0ACOvFSSPUUJ+3Y47fET8zw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kt9C77f0JTsaRet5/dOgDml/xqRoe556BA5ds1yAP1RhEIK9p31c3xxOKP3Ovpma4
	 sK7i+tgC3khj4A5Cwojyu7fiVyuhxWmvWhPrzH9+eT1QUqZmc05LiFW6lKXLDo4gOd
	 bLpjja1MMEZeII8D3+7ZqAdqQcR88O3UlwvZu+TXM2crbv3goUK/WBhrzMXpgTcSIU
	 2UqCzRFuQqagpFys0jG0ftQLdw1l/3/A6tpZnFbrmSTEEw4k6AXSIdrcOEGQF49TXQ
	 TmVlJHEA53qXE//TKmJay52hKnUMvs8wbQpbw2v6l/h+BktlcRgiHtRoOe+O719iMH
	 kc1Uyec/ic1eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 499CF80D34;
	Mon, 19 Oct 2026 13:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CEA901E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6521B40656
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIqMgU9G_6-r for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:14:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03B4740655
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792415670;
 b=FlvIWJMwKahs6XybGl7Skg4DJ8AWCm32c3pZC4+36g9w8UzFH/wI4nVzdogTniKy69CQ
 boxM6YdVfgYlY+UTnBGlVS4YUQWSAwsxBLElj4U/t9POwhzhUPaMUjnMWPIwxjIJrzvby
 IfcBoczYrAqPBOeOkFELaB/LiK25ye5WN2xBxMuejC4EPjABJsNyvTKLEyGS0xZkzOoEm
 Z29/6zFXH6LvwE9dZvejWI4MrGPlqdEnS5shmMaPl//wn2W5Nbg17Y5VhOHxjj2tZVw7m
 iVtuxyfhs26iY6R5QRdp0F28GbBAqgtF/ZUMamfBjqVKUc+ZNiqBonlaa7EjA8uC0Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792415670;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=0LfcArJLiNhkUlPCpn4EcGLvxebiL6ppX5Kq8pdX2lE=;
 b=fNwqjSmwXB4brH6TgT+xO/lVZXo/K5ED9oCN+VJ6kBQQanN1EEKBC2HdIonidNTRoAZs
 gTX/C8iAYJIVe8ZIJTmV9lHIhq8Uyx4EwVIt9S3s9QYnVS+LPyxzCDnoXHPgAHjceiG85
 yEqr2j9W746Tb9+LHPw8vkA8Y2raGEk9C78gHr0JzXR/LKhpVMtN4cGgmhqcv/WIrOykm
 2GUPlaRWdwEb5AgNhnnnlfkmhLTfs2wfQuyI5FPSrrsBQ/bovj+dnGLzM9Y7oCJY0GtZF
 rwbHnWDo9BE8r9y9/EIk7R9JupUQTB5l0+u53e8BSsq6hJG0qayi4deuVgIaRFu8Shw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ee4awudK; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03B4740655
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:14:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DC83D4E4120B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:14:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B156760582;
 Mon, 19 Oct 2026 13:14:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AD5E810328D5A; 
 Mon, 19 Oct 2026 15:14:19 +0200 (CEST)
Date: Mon, 19 Oct 2026 15:14:18 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <atYXpvyRJcDGN8jE@windsurf>
References: <20261019121945.1672247-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019121945.1672247-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.6.2
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

On Mon, Oct 19, 2026 at 02:19:45PM +0200, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

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
