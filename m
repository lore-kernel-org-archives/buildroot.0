Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDEAC88E75
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 08:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE51140B17;
	Fri, 18 Sep 2026 08:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UTw6veuaxQI; Fri, 18 Sep 2026 08:03:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 956D440B0E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789718593;
	b=H4chQ0PwoBWkrq8YK8WMCDuRIdr630u9pw1Y70twehbbYLwgcpV9TUq2Zi329JKdQQGN
	 1Ay3/Tt9Bf0Trd+blNTMKTwlaxmex7C63RwPnQcJoUVzoqd00KBup15Tiexy2gTqFBBu/
	 Re+YU4JJsq2Pf7prT+h5bktdPVh053PTF1olKLyyQzg5Sw8tr3xfNiatd8xZoWId+3QuR
	 zsUVmUi2NgdhmNtTp62h4CO3Bg5D9Gpa8mHmqa448BtJIWky21qLFxCmAN6u83d9JxRGM
	 tkRi4Xc4BWGe+YHM84NXCK3VIgFCldm5rNVetFUdhY7qWDMOj2qkr3h4lcYf7bit8dQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789718593;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KJERp6U07iUOAL9u3yJSl+Q09S1V9FKhjk1Vvik3gvE=;
	b=h9CITk9Z4oyGyHKFgYVx+4yawe2vC9sBQ+FNXPCeWqmKOELL1X3u77+VZiuiXDr9kG3v
	 qgOOBuAvL3Gzjcu7vg4ZkWFC4GIyrzxmNEUsI5Mx0ZROgZAD2qhkaLHTDYAFWEjDQTXfU
	 F8xbbERGsAUcGzglR2WsvSppd/ClCiCgJDahyvRY+WP35srkxU3qR5eCF+UaAtLmho8ZY
	 s6E+ftWhLlOENQshpMGKq5fkStl9SlRzQ/mVsHez5cVwwVROyQLlkEGibnikzNTMLs89V
	 lvYdxmcZrL9ydxlrdH7CBFSFWtDB++eeIdPTNQs+nCQRezVgVBxeFnbFKwpIUURStlg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789718593;
	bh=KJERp6U07iUOAL9u3yJSl+Q09S1V9FKhjk1Vvik3gvE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OLcBaChs5rspoAeIrQIxIiV9XnhLKUo1NMhjoxoAwA0OaWHr0+puFnkOQNfAqrZgt
	 dFEMgZws6pz8AHxO6b64taEZts3VzK4Z+p9dVWU6DgKjJWeyIsBANfOrJLnlobf+Q5
	 dlLvU3x+n6CLdAOEjeX+1c9I2zEkhHwqmp+vNUVmNnIbXwBbaWBmq8GZWBT1P8VZ7L
	 kO5Wk9XiiQMsHsCYQ1O5CAjScGmMO3sVjiz266hmoVd6cx4LBKM6UNMj9aS38ABitg
	 00cy5BxXrCgP13i/46C2sg7dq0nuhjLuYBnoeyjKSdpHZ1PRv7Q0Laicg+2kyUpd9r
	 eOPNYy1CRuSPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 956D440B0E;
	Fri, 18 Sep 2026 08:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC32437A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B29F381184
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yakAGHWBVlE for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 08:03:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3F5EE81170
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789718590;
 b=nNc+yCmXzDH6U3BmFUluuWgy4GixmGSzeXU8/7tuQOUmcaMQUOKNjxR3wiAIPaX2Fgui
 ybPomEdqHru3tQIim76tPEVrSCysrRm8oOFJnwhNgMI5Ws6iM86K00FVdfyjctX+uvMVm
 unDw6d4tCcKibdXnc7x711zr7jdDz3j8/GLvoxoTBa7gv6H4zgNbc8WLKAtvpqHda3R7h
 9DQXHdpW11GMYgkSm4Fz9ybmC2mFiM65hc2+ONZnJMxUUBBMAvBocp/2Zm5zNSeDAdd8H
 fUq+imW0vQsX3N+Ch+nLcpuPZaVabXWJlEqlo8yixOnCeeLXhflhmhe6RClZ7OoeG0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789718590;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Gd15H/YWJhI6bVrlLb3rky4ll4NkFotGoSACN/Dx7JE=;
 b=eFt4TqGC7DLVBv1N9zv6xI0GD4HukKnKZnTUkNM352j3kVg0mvYkolK4jamgMG5fmV3g
 cEo6Mk6O/sY7SDe4Mc18BGEGR9o+E5mvVocjOzsoL1b+CikPq2jwz0MJkhaW8JQOazymB
 7eleY+KsnbpKJF3m5qqK6/s2lX52XgPJ4J3q30L0GAM+pponoAgHSdLpZgKBynd1AoMeV
 s3WAc7EjepFzMYFivM2C8Z4guU+yUZ+g21yrrEMl/a3WKLSFQPdceskefTB9citMm/lhm
 LTRCaL1Thj6K8I/vFLod9etnYQs2mUIFkqp5NEX50ZxIgDKfD9uCf5znBoePBHlLFjg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FTtFmrmi; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F5EE81170
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:03:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 96B741A0983
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:03:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6B09F60649;
 Fri, 18 Sep 2026 08:03:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0DB611C7B09D; 
 Fri, 18 Sep 2026 10:03:00 +0200 (CEST)
Date: Fri, 18 Sep 2026 10:02:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <aqzwL_YFmTlM-v-V@windsurf>
References: <20260917173111.3023501-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917173111.3023501-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: fix build with weston 16.x
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

On Thu, Sep 17, 2026 at 07:31:11PM +0200, Bernd Kuhls wrote:
> Buildroot commit c5c0a76751a7e9ba1a8816da68218db9e1379eb9 bumped weston
> to 16.0.0 causing a configure error with cog:
> 
> Run-time dependency libweston-15-protocols found: NO  (tried pkg-config)
> Run-time dependency libweston-14-protocols found: NO  (tried pkg-config)
> Run-time dependency libweston-13-protocols found: NO  (tried pkg-config)
> Run-time dependency libweston-12-protocols found: NO  (tried pkg-config)
> Run-time dependency libweston-11-protocols found: NO  (tried pkg-config)
> Run-time dependency libweston-10-protocols found: NO  (tried pkg-config)
> Run-time dependency libweston-9-protocols found: NO  (tried pkg-config)
> Run-time dependency libweston-8-protocols found: NO  (tried pkg-config)
> 
> output/build/cog-0.18.5/platform/wayland/meson.build:67:8: ERROR:
>  Problem encountered: No usable weston-protocols dependency found
> 
> This error was not yet found by the autobuilders and is solved by adding
> a patch James Hilliard sent upstream.
> 
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
