Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63843CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28CF14143B;
	Sat,  3 Oct 2026 12:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xfmTEnQB5BO; Sat,  3 Oct 2026 12:55:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6E78241432
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032112;
	b=NKo2GueMr9BB4GsagDOTUbNAMudp8IfROtr7G6aOilZTRrYoathSy3bgCqiyEibySDKx
	 FDqX/nrkCzjakN1QTq5sOuysacmkmugfSEoXdEg5fvs80k4pOqqydw9gTfo8rlFRC4j83
	 jJJBn7kfgSneX7NDiMPKKKf0X0Gaum7ycCz1IelFThhbTP3d2wLfzBXOyb1dBYHIv8w/L
	 1nWxU0XlFuZ5xLrAeo3Hx8U4vy+RBvyZ2OVfS+3r7XmEHCd6F5O8Xz1uUAweYacruA9j4
	 8rAB/Pkab5JrVPGVOJ0ITxMsxOvwfAc+Q80DUqTw2fbBxqo82VU8q8Gpx+QKXMS8BTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032112;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pJUbeJGNaIFb7qX3vxjjR7edKT9QQhRnxiDNXRGJxg4=;
	b=rGBcO/QMSojKlpe8qaeGxC7LNU+foCUtn+KD4thRpELxgI+2NfetxubqOopgK6qoTN2N
	 3OzvjyQNb82ehjAzaBZkGtuKZ5PXli9I53HJpYobBsDhkoj3AvaqM3eSZf1TME+GlDehy
	 ADogy8XDj/vo6ZpV/8smSVNmKfjZr0BIvJYoYam+a+vgPTGPREkRXTU8v3MBAwvJoWEhm
	 VZCtqB9a+qsTmZzobMMuazRKADQV+A4Y0eL/N5euU3nN4hb0YKnl+Lqg5Oj3jVAQVO5zo
	 1asrjHgSO+eiPVDCvFoMTErxFODWsMcLE/UZFC9sYpC5cWYySeh+iBERHehTdaKI7aQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032112;
	bh=pJUbeJGNaIFb7qX3vxjjR7edKT9QQhRnxiDNXRGJxg4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NnBLgKK/6buKXvx+RIt8jIT3V/fWnOI39ztAonetH2YSItA9TIIKve07Ge23Uv9+j
	 qnk0SkDskcUyAu5Mlxkg7QQjy9YMv2xdFRqsqwVwoKda3SWTfrxZdAGSwNJMXvVJoK
	 ziFR4ow0XRxjchSQcd8qz37BlvrBaE0iTNtv0nJ3sh8iLZHTaNmmuJFX5bH2LohA5/
	 ZqvQ3DeOYpkWCRThsUI3tmAn8rcVmDq45qHxnkDoMEBqSYIOBc0N7n6NKpyWAZ3/Gh
	 Klrw5xiYszFJovPAuUwXBEVlna5HQXMa0d6bDJirwX3wT4icB+iBWG0ESG7/ikUrWa
	 h+1iEK4VfiEpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E78241432;
	Sat,  3 Oct 2026 12:55:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F14E1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ACD741432
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVKxyZ2bEcmP for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:55:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ADED541422
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032109;
 b=n3+jzdt9WX7HUGWNzBn/iWDNI5LhyAqtAv8c45PDG/w9JhvdTBv4Qpa8A3t+0CA7Zm1K
 OP6VXaJX/7gnwfvppJRjcmMLltPO2oRe+R7Q5k64Bix5RTi52B2qA/bDhmoMMCXUs3ctY
 EeGGYTTgF24pdzBlu7g6PrtDYb+ntvNJGRWE8xxuf1t0D5qy7SP8sPhNurJEroMjkveBB
 asH08QtXNTPCl8yedJl6t3Umt+2c131mEuW2Uitfmd0m4eUmxY1gJBp/mDIPLoEx4WJ5H
 OKXqNtG00dTecM7c0lrsXCnNnayt4xx1IjZOxQouXW7NpBKUkK5+2KUC5lisV1nFf7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032109;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=867W8x8Q5gUWO+TzzOXubdk1nHbIO9MVRcZrq9o94VA=;
 b=p8lCA2VQ+jMEBTIdhKV2E+UJARRvqZLBA7vGYtGJB0E9KCkZisr5M3DFwg/l3xDweZyg
 SXrHDDqR0t76fEZyM1ZmZRWXG13PAgk/+VGE5qUOqZ+1oz12pfbiGAYfisv7vNvo646EC
 mDQt3gWSbwQhDPyCoBD3M4wPSo6Z+RlVq2AaAe+4kAu0XDmvYd4Yravgk0PzDdCWtUDhQ
 M5XZtqrMs44yNXeIUJe+LA4IrfBd2CVvUs8rhBxjKBObOmXuytNMMf+iyZX4mNE9I7fY4
 OqJNG/SJAyg/VJ8/mb2dWd8bMM5jw5UZct1UcqtiZhuhwozhecVEd7TNHHRTCCCdEdQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Xur4G41f; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADED541422
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:55:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B84AC4E41129;
 Sat,  3 Oct 2026 12:55:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8BEE5604FF;
 Sat,  3 Oct 2026 12:55:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9F1D103283A3; 
 Sat,  3 Oct 2026 14:55:06 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:55:06 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD7JuL-vp6ZyVrM@windsurf>
References: <20261003084453.545653-36-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-36-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/supervisor: bump to version
 4.3.0
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

On Sat, Oct 03, 2026 at 02:44:21AM -0600, James Hilliard wrote:
> Drop the no longer required python-setuptools runtime dependency.
> 
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
