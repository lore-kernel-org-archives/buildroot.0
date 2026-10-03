Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BF7CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92785817A1;
	Sat,  3 Oct 2026 14:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vKs8LroG8fY; Sat,  3 Oct 2026 14:08:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8A27981765
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036522;
	b=kAgvUJBh/mcCZ0z3/+DFnrCvHB+X6XFPu/lN6wGOb5Eu7mwBzFIRdI7VezhJwUjx93b7
	 ueFnDUsN++uSD7ULn6QPIfpcVI8vaYtvzzqFBTeNeSAshKYhr4VYWRAFKKDZS5VvY9gf2
	 2K9uINL2Zb/B1ndvVbxeA9HojjBWaAeYfTYuKj/6rIU9YcWF82OD6UY9BMsfJdTnqNZCw
	 xhbng/J3ICfTQqqplx5Z7xh8REvfvGSZI6zVg22zuTH3kDPyWgAV+TkJ4nLls2WH66RxB
	 C8KIGlsQfkce3JYje3/P02iiHZqLh/9v9W0rOEuV5i0mPdLvogKRgU3hc36RFB/wmQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036522;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/7NnRpQbi4V3Kudy0StLaJbgGQnkoNbSahxaZpyolbg=;
	b=qJtQMM1VRseMR/cVXmz4k8WaQXrPGUKFhGIRpIPx6xg53YwTPeQ6TF00FqOIlkgNthu2
	 DniFCi1YFRoKcBqTDE+SYc/oDn4yh6wQKQFDLINbN3HcrIaHtxLPOB3VQzCw5PV/KBKJ9
	 pM+Uqui1xHYyJ9M08Li5DhoaUK7AhQaUWTk0tmmlwUtQXSJPmcvAL2JHdpXAYLKv5UMB3
	 pQCG6lDUxsFs5fWN18U+ZxqF37+JzQzYqCRS5XTO7USYncMIoPBEwl+xdBmdEowwu/w7I
	 ADkistxh5RNJ0zBMuaTjVtLq1SKWZ428yIpDy63WEQ0dVLK1VGpYVLoziVK41b3zOqA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036522;
	bh=/7NnRpQbi4V3Kudy0StLaJbgGQnkoNbSahxaZpyolbg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c3gNaBDrIxw4+xtUc9+YKm+6FNTie9OrYwvCA8Anlxfg2Foy+bLGmf7mdP7fMOacv
	 ARFdp4QI5os2xOzYerK+8H16bat58LCgBMR9UdIXnEURsPBP/2rb1Z+sPOS1RJlpaG
	 aKFOvvzmMb/F5TSElautE8xa1WYi2y3NQ75Ci6TtDd2Wgrt5oxLW6g/X/IayHEM5D8
	 TzuwCVxOG98/J72kCsY75FxcIPxcNepN25U0iQfnATFJmubKql4/IauzRQgVVxBJgc
	 qNXLvXilfMg1yBrm38YepNGNGn8KbivPF2oWFSd9skNP/TXbusZU0HNHzbAWjdLUua
	 G/2ILDFVvhF2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A27981765;
	Sat,  3 Oct 2026 14:08:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C813F282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5C8960F8E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfXMXP28Vd-O for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EA9CF60F40
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036521;
 b=Ck8405+DRlQhhp3vp3UKOSPqeax4+OIiU+G2kWUccbTJvQQakg0EVibgrVDHV2gf208M
 oZaFCkdIl2xb1YuibuyURvsa7EwUpxGGhtOqs6MFoUsPuakcSPuDpW3THI40BQHPjDvRL
 Q5xQsRakPWXGcWUU6kU92LsQFKQ5PwrvQjyxfCkbD2Ax3tm62bc8sy17kKg/ngNlAWrbd
 DVUPsbqN81EbRIn2aCBgVy5EP9tNASUrGedS7RtnV1T35HHkXPEARRnxtG5anxtxGYUPr
 +ws4wSXapuzFXWK3jVvfLP0AYQ9dwGbYnizj+w3vXlM8/DObCfcYqrE2hiajlJJM9xw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036521;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=K1iRlt4Wgc9WFtWrs/ccJMB/ZG7fyb9ksGRALurZf2w=;
 b=gc48IHJ12iP2edE5JNp1aqKo0wGSkJoyqvy3OqOunIap/IMAPXvobZfq9/kBLK661z2D
 caLS1YTw+gJzGK+/N8Iw3cZ7qRXN4dRnOekrfNGV3oCsx9kmq2/RLsei5MayML32nXiEy
 2YxKSTuXy+NEEWoL0aYD+U5DU2j7wP5ppxIY4O3zdc0B4d+eq+2u42AezRzmdhPP7AItU
 yknWEviOC4/Dxro3URtTLc41Qps25Rx6gKJSvWzggkW6EczsKhn3kStfmHlXLb64LR8cB
 u0QmZ1p9Mf/lC8oGBx247x5YSIrNeit1JT1x3ip4bdFcz7OlV8gf+eeWmDA1dLRFLAQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QfRji8pV; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA9CF60F40
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 028481A10E4;
 Sat,  3 Oct 2026 14:08:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C4B48604FF;
 Sat,  3 Oct 2026 14:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC1781032827F; 
 Sat,  3 Oct 2026 16:08:35 +0200 (CEST)
Date: Sat, 3 Oct 2026 16:08:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <asEMX6FmSYyZyBrn@windsurf>
References: <20261003084804.2462501-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084804.2462501-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-logbook: bump version to
 1.10.1
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

On Sat, Oct 03, 2026 at 10:48:04AM +0200, Bernd Kuhls wrote:
> https://github.com/getlogbook/logbook/blob/1.10.1/CHANGES
> 
> Updated license hash due to upstream commit
> https://github.com/getlogbook/logbook/commit/963dd98736ae223f4f19028d19cc4fc3b5bcb4bf
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
