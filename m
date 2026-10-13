Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9DBCC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F6C80B49;
	Tue, 13 Oct 2026 20:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nePX33mYyI62; Tue, 13 Oct 2026 20:57:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D88DB809CF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925048;
	b=n0neyU+O5jpM6JN7chTdocPvlzubryCwIm34QYM/JiRzwry4CxELhmmqUkjIJsA1VFIj
	 socSimHcpKtbc/zAkAK4j9SOId/1mPXotLgNl1SKqErco7dtyFWdzCgUwicJwb1WTvW8E
	 rnRqO27Rs3JFIPiUW0NtDntHhBOqcPqWuWsGE7SwLYX8eP3bdt2/UxkRwcCmEiJ3zjU6Z
	 LgoVi7cHwS1yZgBP/l0OF+GsTxyAqsALHdFw1Xl2fzkhGSF3EbfF1alT20WC0alg6kqCn
	 +J2Fty4nPqxfdc/gUdOu9M6uZYTNrHNJoTuBeohSggh0dx2wkoFefSfm5ew4EJNigqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=adgKaWgZ/kH+w42xkVXWA/vJoHq4z+zxG1dF/aBBLIQ=;
	b=ROIiblv9gL2M+dSAwVRoY42Io8atkBdzuQqZBagaqBMe704aWKUvkAaO33/NQULF36l0
	 kW5J8syTKCeatF4ObuVlCwgVAP2pISPUENZkKSAaSKoJ8zKfZK3H0iE0mI02fKF7x/CTG
	 JCXCA0w9yu29R0cys1o9r6oqF5ocLe1Rfl9t6Tzhesb+dFGEtr+XXC8OORC9E0SUqZwKf
	 yu4WLMDCQI1eWlk9TAO99gvSlCjAvJmP3dqMPGml8utBbWuTjYqmI3kEf0pFEmow2MPNs
	 QuyV5RP3JHi8/wfP+NKX8rvGtJ/S/fPZ0WXapxebpd8qCUMc/LoBMcusuxKqHsAFDdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925047;
	bh=adgKaWgZ/kH+w42xkVXWA/vJoHq4z+zxG1dF/aBBLIQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lN23zBmQSD23/wg1m6EVtpW/vyke+n0HiD7MI02NRbTCt4k0cTDRM3EkGeFpw5Qz1
	 GBsth5ulgitH4WtLEmQswmxcz0atbo7P1tmc8odl8VPw6Qut9Wk3Fdz+9JHlyl3bzL
	 5Ot/VXYeQgmgMoH6Nm1KyLVYj/onmr1Hy27cW/P4cHb8uXSKyrwwLL/mW7HIHtjNht
	 Lv56h30pT6jyJNTNF58ih9T/rcMDMppnfv0zVgaXR3rFUwEuCkBT6CD02+bys+OiU8
	 G47/TRB0kRctMHkUdRQjNfjg1mZF/FUNOfL6L0Ro3uQiR6Pa92fS5oFLCQ7vy9z0SI
	 y09NjvW4FEQ4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D88DB809CF;
	Tue, 13 Oct 2026 20:57:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 242AD2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A46860810
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APfq-3gCxa-M for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 034AC60809
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925045;
 b=fxm14p7lcmfGN1XP4OuQ9vzLKnKKIpCPqKYrsjhRk6aP4kt5z0NhzzNJv97SkF4l6qA6
 qyA1UfmXLiWFtBFcT+4NJpzmx6AoxhiCVZZfWOgGTPF/iSQtQW3HWDzmRCnH2M27QSs6R
 SYG2jhJc/iPiGN8/YzpVJKxh/vhU5ONSmMf95Pw+SSXrA3EsQX9YeT4x5wahYcgg5coqm
 tq7cre1F5BkbVeXnmlYigawt+/eJPN0KB26o9pMI/8kUNJB1Q9GatRqGx7tqMrnDcIi29
 vnmSJNf648ODrJeRVxF6jUvkuHecHCAjosRTo8vvF3/yFskO8ZytcvliDmDK3y+F99w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925045;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=FSHfgmUh+4TacX4dVDHzJ6wSizkv1r4UjftdNAw2Mic=;
 b=i5qrr6T/bpv8ceRd9H2ifCO1752kLfCdP+A23fSz8jgIl6eYAI0oEnzL0TvjqF4UEaS0
 KBLyfVuOVOQNGiYg9DLsN/Lf2vowX3lMWd+KL+vgN8+dg+tLtFety5jYvBf/udVwA7f0B
 tHTFPOZCo70oa+lkJtQEDLoPiTO30g5Bj668wbtivZLmmbmAncQgsRTlmMP7Bk/EqtBPn
 +sXZXa1s6kbnrVRwHlgLqSXlZEX8upO7n21PSjOVHOq+syPekxBLSE1hhKftK+tmekm4i
 vs9K47krykEUlPP0/SvM/sKIQ7l4NiQ/brDewb5kIYLrVZ59MdaSiPJYcx27IOWiGiA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=A0lPzjtH; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 034AC60809
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E0C98C653FA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:58:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3FA9060362;
 Tue, 13 Oct 2026 20:57:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6FC8A11D717C0; 
 Tue, 13 Oct 2026 22:57:17 +0200 (CEST)
Date: Tue, 13 Oct 2026 22:57:16 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, 
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Message-ID: <as6bGSSRWJGPOwP2@windsurf>
References: <20261013164254.1476592-29-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013164254.1476592-29-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-scp: bump to version 0.16.2
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 13, 2026 at 10:42:15AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Alexis Lothor=E9 sent the same bump yesterday, so I applied his patch
instead.

Thanks!

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
