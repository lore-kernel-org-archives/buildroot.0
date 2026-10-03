Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC88CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A16814DC;
	Sat,  3 Oct 2026 18:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NP_jdPIfIoqc; Sat,  3 Oct 2026 18:40:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D1B24814C7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791052839;
	b=dMf+Imnr4Bgs4/nLFXYcsLadBglbTuk+wHoFTvRRm3spczgETk3WCiIPloEVmYmIriVC
	 BX+6+3ih7rSKjSf3yB9mgrU7lRyAibWM9enYW0e0A6LOdH4AuqbfhMT9gYuNcSmBD5jxT
	 mstv1Uba4q3wj/oxfwfG0GKKgL/jTAIB4Zf89DyAh3D/C4NEkDYepuoUatFam3K++cvZ0
	 5NgjCxUvu+5zyK6KugNEuQEcxwTzeXWQ4HIaFU3+EOOMfTnl/8Bl+wKs8VccTSYT+yWDz
	 pTub92DhStVYA6Ep2/fFmo4gNxVVkw8FhFWKauBgYgjCJiRM+HBfAPZwx6tXz5rqXMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791052839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vOFskJzDqKD88zPKtqs6208ehiTT9OgV08PNMS50fIU=;
	b=WFgcIfiRrBnlo6cXvqSXUdFR7GP3IAlsZJnAy5Iiwd3brD/Z3jOmvDkeCxZKihO7bXyy
	 d5qkmB5Pz9XslhIsFHa3OPrHGu4jEATnmO7ORghAj6KwHL4mKEZPSh/VphvM9R3G5etJD
	 XBinD/rWqtaLDq/SYgDh4ziy9/vI2PByUX2HJY7r18//VeU7fScSGQ2oBDTkQyLnvWFVD
	 0mkB/Pnez6mQtP40eLL5niQU9r0v/7NiXmZBX7nb9dh9IhBNO7+Z1I85z1TOVLCjrkVYG
	 VIItMTckxzuVldkQqJNjruYMh7Y//bz7QAtQxsgfmU7Sy34BSCpYJ0M0wwQQqDzGzMg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791052839;
	bh=vOFskJzDqKD88zPKtqs6208ehiTT9OgV08PNMS50fIU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o2rzPxvZLCQvGL/rVPdKqnFJAATHOooA123TzWw/nIvnq0VCAM6Ze57Y+ckKjcNZ8
	 XD16MYIKIKUuj8fLMcav8EwiJoBAZczp/+zfw6zGwOW062fDsycStChIBhbdjupqMV
	 jMbPJ6bUQF3W/fiE6cUJNW0Ylwramwx9hr5TRrhXf3KR4NiyV1XtTtXjEz3zvbFdTn
	 pK2c9IR5jFQykZBRv2G83VogpjbnSSPpvTWUFdrRhI/OhG3fdAzQx0faW9ELBM2A2a
	 s1Z3H/AiEMjVubcv0bYHh3I4ypQqwflbKDlHL41s34CXdT+kKaX/N3Vxg+QsoBELqE
	 /Oe9BAI9e8BQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1B24814C7;
	Sat,  3 Oct 2026 18:40:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBEB6435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1DD76069C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K03vD9nJqUzC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:40:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ED13060683
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791052838;
 b=OVMgcEiuYOPoN0rm2oqefdz/qNzw1/Hb2gEHZ3QoUT6VzJ9ryucOId5sbiz1OWkf7TGh
 pr9PkyAJTr9jURX0kxURPLki5+RjedvzufrAeFfiQ2TXViZHnGlxG+sajLNHcLLC1LzD5
 fZQS5INzTVW08jZgD7T2Bbx7856Nna3cnK5smtpjQ5UNwdET8DajRV64/3PQqw88oY6RA
 lnwsil3jaOh/o6UvF78Cf/SnvL7Al9mpeBQso7kT+WdqvdbHBF3kQjVO1fLEwFKLJIgYD
 O/vnUkPqGXT+kO48dTInEZZRztyZsV9eq4+IIffseFZ1iIY8XYXERvgLdzMSZMKRcxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791052838;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=qoVOEj8EHKf0PtPfB84LRj1UeAOX+pKB7Siu8MiSe8Y=;
 b=oA/z1jovaMU8Hvnp8JB0ICalZBqx71sQbgPgEjhUUFVzd2upFyQWrrPnRc+EwUWzwGaN
 lcj0aKOC6Y+lE1B2on67p+Er9hUmWj4WH4sn4LFN7povFCrd5PV0EJw/U5ff+mc8NOe99
 /lujyUtskmpdkaa5z5I5OrS/JVXtf7fJSpV/tx/DBKKS53r77ZoBT6hfUQci7j3XQ8Kof
 mQrvD42UhAQgpE2/BvIVh4gc8rVyAt/8t5waMoCP1nbBPIo1OSYqGTPjs3Ea6DOpByqHR
 PKhPuT+1nXmeTg0pIj43qDVZiI3fOkxrgofTvel6M+MJG24n8jqGghKskKura12fZxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xjPs9KGG; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED13060683
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:40:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AF45A1A1106;
 Sat,  3 Oct 2026 18:40:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 755A6604FF;
 Sat,  3 Oct 2026 18:40:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 743D810328170; 
 Sat,  3 Oct 2026 20:40:31 +0200 (CEST)
Date: Sat, 3 Oct 2026 20:40:31 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Scott Fan <fancp2007@gmail.com>,
 "Yann E. MORIN" <yann.morin@orange.com>
Message-ID: <asFMGgD1V4TYbifi@windsurf>
References: <20260904134208.4707-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260904134208.4707-1-tianyuanhao3@163.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: switch chrony.service
 to Type=notify
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

On Fri, Sep 04, 2026 at 06:42:08AM -0700, TIAN Yuanhao wrote:
> Since 4.7, chronyd implements the systemd notify protocol natively
> (upstream commit cb11184, "main: add support for systemd
> notification"): it sends READY=1 to $NOTIFY_SOCKET once fully
> initialised and ready to accept commands.
> 
> Type=simple cannot observe that signal. systemd marks the unit active
> as soon as the process starts, before chronyd is ready, and gpsd may
> follow immediately: its drop-in br-chrony.conf orders it only with
> After=chrony.service.
> 
> Switch to Type=notify so the ordering holds. chronyd's -n mode
> (don't detach) suits Type=notify, and no libsystemd dependency
> is added.
> 
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Scott Fan <fancp2007@gmail.com>
> Cc: Yann E. MORIN <yann.morin@orange.com>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

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
