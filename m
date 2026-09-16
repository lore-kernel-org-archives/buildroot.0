Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD03BC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A5F4046C;
	Wed, 16 Sep 2026 21:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pERkJIjudYG0; Wed, 16 Sep 2026 21:12:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AEFA14040F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789593145;
	b=lcZTeq/49q2Kq52/YmwA0IO69Aav7m9u/woHrswyGiBBR4OaeIH3TylLxy/H2NaO1iIq
	 G0qzpR2L1u6J+73hb1Skeu6C3uGzqHkK6mJGw9EQtj65p2AD25ENrYPN0GbCUsA14raFa
	 XC4Gx/Iz3rbMnM4FOEFcc9jaMDa2mQoPXf/90FCeooxYvDGy42+LOjnW2AeAz5QChjN2W
	 PsdgPIhZx2QrxaHwkJh/8q/g0yi4LpNUPeiLhFYrt069gRFP336sSXeOyAFdVsWJbiuxL
	 dJ+vsUY1C8/41vcjDA7QnqotcjPKTlJ7NXTw2WqPwF4Sr29KiZ+lNySeXdxS0viWW9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789593145;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hg5/qLCKe+9B5kgDaFdYFoaOKCufTgiY5xVx93tei7c=;
	b=oL7SonwVqpGtIhbqkiIyNdW+VP1TNEOXwbO9pa4IVlTF/hQc1tVljuQhymi6trmylSKE
	 7ZKlyB/61VLXmPd1wYAiysifeASU9te/DkSJJVtw6NrYmxbicHYVR4yhHcTINGuPeqEyA
	 UtU7CSttujOafDVN87PIKacQZI5A9OmlyDhLOOK498voO5oS6FAB6yuiuzUFMBbsly6Ie
	 z2CelrEf6xsL4R8+azUprS/B+hkltGINpLnKf7s0ht8oNYJ5w32xzNTweg1ZbcKuUYiO5
	 PV/loRNJw1/AfW/fyj3Q/WShH9HJYopU3Vu74l3M8aa4wqpq5txPkvNuJiK/GgH7Ijw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789593145;
	bh=Hg5/qLCKe+9B5kgDaFdYFoaOKCufTgiY5xVx93tei7c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eeDQR2HUcvwoVb6oUzqOY2f7VhBJ7kCTMmJC6qqove/HhAnLpfcvDXCvz2zytqMwN
	 xvfjP5dhisVxHe4kiUlo0LHX1fARv2TUl9MJRSqjUH1cpFqH855xAj5LszHCT/9WiJ
	 axNZX2P3oUltg9SER+alD0cl6W4H8mqQAiAx4BVDUFhILuIdVumjQFpwSQxJvm9OIH
	 PsAbhMGSloYUE5dUSzkaJtBb34O25MluAGVBNWNI3KS4RBUQDixShc2ADwLQrqGZu2
	 c4cyPEyIhPe9bZxLpFnzwt71zoAiEO9OyE6Eu8CJ4DXLS+Ula4FBXbsRac/0IL/mw6
	 BDFUvFelPsVsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEFA14040F;
	Wed, 16 Sep 2026 21:12:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9AC22E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B2164040F
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_ZVM-ocJAT2 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:12:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4D8B8403EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789593142;
 b=KzxbbaqjcEq8atq28YESAELXDSwJ2YC3aqVWatXR5tbF8i381nM/olHQPI8x0zS+T35u
 Rk6XWL/wSflrLajtYeJWanqWdM03BBMMUgwj+XV4v+b7ZV5toR1nVXvid8IgrkML+gwJ9
 K2bQUSCDGuK2DLa8mObdkl4em4KA8lEKcL1wvN0DKLlLCv13qkXJ7hwnrWFICBTgKzPCQ
 DiCGGRGrEuTNbukm/dZPcl9ZE1YQU/Pnx+JRBw5xDqWcGD0X9a3cp8UMqHaJtuqJ2BKJj
 o76Byf8AvWMW8uqGSzPNO+b6ndHX/fhf5w11p0/5LF8Dc/3lT2OJkOczkTaDBUTJj2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789593142;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=9YFNgJw3Eekx7+hCZXAGHuhe866tG6Y82+uqtkCCkk4=;
 b=pB3MfzKLDwMwblyxALtFSLzyClFtWJbMXpld/Q7/buEhxAlevmriIxichda7ouTJjXB3
 zd1E/V87RpAbfcQ4C4z5KVDtTzbcTYoMp9++u8etCork/xj5X5davgG2AiSKqrkklLC52
 gFHbwTpiwyBYljvkqCaNCJoOTPMzoO89k7K1wHxUnnEVVosZ/qWK0XtdT04GUuLxmFbS/
 GTdmEiDp8WZ4HahiIoFiK9l3FRv1eX4HsVdgjOq/8Wh/JZoDM1QLnXRyn9OiQ5y101dGK
 8iMakJvuwRUpOFQMqT1hfibdO7QyjkzIbwFUg4R0EpL1gZ88wGRkgKhOtjZ+YPDkGNg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xdwqzbdg; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D8B8403EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:12:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 574F84E40754;
 Wed, 16 Sep 2026 21:12:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BF1FF60337;
 Wed, 16 Sep 2026 21:12:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6D3F11C79EA0; 
 Wed, 16 Sep 2026 23:12:13 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:12:13 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org
Message-ID: <aqsFjxyqJ3GlK8lT@windsurf>
References: <20260616160614.2665216-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260616160614.2665216-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure due to warnings treated as errors
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

Hello,

On Tue, Jun 16, 2026 at 06:06:14PM +0200, Giulio Benetti wrote:
> A the moment build fails because all warnings are treated as errors
> except only 3 specific ones, but the problem is that there are many
> warnings that arise with gcc version increasing, so let's simply pass
> -Werror to ignore every warning in place of the previous 3 specific
> ignored warnings.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

There is this patch from you:

  https://patchwork.buildroot.org/project/buildroot/patch/20260616160614.2665216-1-giulio.benetti@benettiengineering.com/

And something that looks somewhat similar from Christian:

  https://patchwork.buildroot.org/project/buildroot/patch/20250304040150.92329-1-christian@aperture.us/

even though they don't take the same approach as fixing the problem.

However, neither can be applied because both commit logs are not
sufficient. They are basically saying "fix stuff". We need to
understand what broke the build. Is it because of a more recent
kernel? A more recent gcc? It did use to build, so why did it start
failing? Without this information, we cannot know whether the fix
needs to be backported to our LTS branches.

I'm going to mark both pacthes as Changes Requested. Can you respin a
better version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
