Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E636C61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E38260622;
	Sat, 29 Aug 2026 21:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qww-L7lRJE5l; Sat, 29 Aug 2026 21:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788037857;
	bh=JJngN6gh9GyccjGVORsWJVgF1XvGk/SF26MJ+0W4uqA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rYLQJS5T2cB6A/gGkmIEv8Au2FWJgTQzewP3gr0sCNK4au258Fh+FjHKRNzkxLko/
	 0L2GuoDtHx+zAMTGCEhjzIIIeQQmCPQi501IvlUOqr5hRlq2CLVpbEw42G+l5yaFdo
	 VrfIMeXCWfqFGg0d8tmy1RW0wmHSOa8yORLMvsjwUKJYjG8Yhx188hXt5pWF+n7DHe
	 27lKqv+wpn8PdrGy3uOsEemddKe0uwhxwj8ry5aCcUyW7703DDO1EsbUXjAfIMPRvd
	 6tUrUf9D9zSL8SzZpxWG67re83i+Rim5VhOh+r6fF2aB+xPtaxr5ZL72sChTwZvMba
	 rR5a/70mIAZzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F67605EE;
	Sat, 29 Aug 2026 21:10:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83C53118
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E53605EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XNrB48310cn for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:10:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E9DF605D0
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:10:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 658CB1A1868
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:10:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3AF3B6053C;
 Sat, 29 Aug 2026 21:10:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 80D0211C781D9; 
 Sat, 29 Aug 2026 23:10:47 +0200 (CEST)
Date: Sat, 29 Aug 2026 23:10:47 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Will Newton <will.newton@gmail.com>
Message-ID: <apNKwe0k1xBfU7L-@windsurf>
References: <20260823-fix-host-erlang-v1-1-4886b00d10f0@bootlin.com>
 <apNKif-4jB4g8g0l@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apNKif-4jB4g8g0l@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/erlang: fix link failure on
 odbcserver
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

On Sat, Aug 29, 2026 at 11:09:53PM +0200, Thomas Petazzoni wrote:
> > Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>
> =

> Applied to next, thanks!

And of course, being a fix, it should have been applied to master, so
I've applied to master as well.

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
