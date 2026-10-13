Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6C7CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 12:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B4F480AED;
	Tue, 13 Oct 2026 12:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pti9opXhwnl; Tue, 13 Oct 2026 12:39:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C80F580AC6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791895173;
	b=IV5uP4oD1pvHVQTF+t7HSMxKdLMOkmODILnQZe6F2g6lgLGV8Li+rBwSzvDYPlcducGm
	 o0Qgeg6sTSBQrXKWAA3Oann0Cx9Ww9hblAlk8wqPYP3ukfRRwF5rmEyBXkos7TK4RBq5z
	 AtpRDyBT5sve1VPivmAyuvmN8+903ERqm12S9ufJ3buJN2+MAW/13ZkiTZNA0YZH/s9mY
	 bxIyFoIJcR1/Vuebntmp2NnoM4fNtpkbP3qcCVVueuUuRg42b5ulOGOh2l/QA7xlVvVos
	 9nCoxs+TCXl/hphOJu0WIZKApiIzCQMOY9apZaNpDsy41t1mg8ahdF4CKsMluoOGJvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791895173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wN36e+BYoc/dbW+JW6n5dNyHKXJFZB/zr4RGAMfAhLY=;
	b=XXRr/bOIsC+1nj52YYpjMH4UornXvE8H5mf03jGS3KwK+TSJFDLCOqF4pxqNAqFtYaM2
	 2r/HQS515AdXsqAh04v4dMwhPUteYnvoRXTf+nGSHWVTS1WvywOpc/YL2hmraGrm2njuB
	 ictHmVkR7O7+aAlOHax67cVbAT4C+QyK36xJmaKzwuUrWvpX7qEl4JjY2wwTZgVSafL5D
	 pwROF54fIc7uVHlBFLBeY3JzCeF7N/RtyeAT9sBDxHHUGRpFg/AhQzu0WEWxpwW29bIy9
	 rG/QOvNHEZJDSZC6/FBCheHYC0fimRADxEOl2tsBvsBr8BVqhnKJtijpruUNgWhPS+A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791895173;
	bh=wN36e+BYoc/dbW+JW6n5dNyHKXJFZB/zr4RGAMfAhLY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k25ls0hbOcF0LovCpIjAWBt9PBsdvon5zMOWv/ADPHGBrKRw8p2KO2ms4sXcRasxx
	 nWs7PDEBnPiviGEbqz66ZDK1HmlqrLDPSsWtoOeV0E/Jn1FGibfIr2Tkm9RHiMi88M
	 aJmawPrER8tsOm/+QdPwqvkbmDW93w8dcDB+Tfg6Wo//rt262KkzdDnRKb/rMpy6/u
	 6an3Nw0eulRVjxKxTqpfP3yb/ATjwvQUr03G/WWdU0NeU1Whn1IUpYw8BRfgichm9h
	 eKjDnD/O59IsXEHLQdZMvn6NhNWFTMOGqBJBZVhcGfq1DdjqrBFonignBwdrnWQYXu
	 /+Wc5BjnoyYlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80F580AC6;
	Tue, 13 Oct 2026 12:39:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D167788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 12:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F0AD605FD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 12:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHK80nRc2_aR for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 12:39:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 96BD2605F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791895171;
 b=il27gsCLyrO9sujCSIb7WAwtY1tRgl35v6wTde+aNZmE04eRJb0n6HPeOi/LSnj/uZEK
 e/+/qOC+Vva/9EuNzCZW/OoWSs0kNg2xdHbQON1HUwb9n/glXFdn0sCp+5F1pDi2V75oZ
 Ol2/X3JHEZp9UOV5V0jdMTn6gaH8afP8KUJX4UZmMBk2IZnnm7uWONHx6rbL+0BXC6/Ko
 TFBiowH2fn6Eyz9jIIysVlzUVhQ8+IXPtt2YixghUNMd6wIdgDXlrMHtda7/pSaMMKilQ
 lGWxcu2+eN5tM6/lYmh7Dr7BLhaWm8tgqngvRsALiowSX0HVNz92oN4b4bb9zyy/PAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791895171;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=CQQP+5qVaCqiwp9j6SfiF8pM/vdG0NetHCEm3I+UBqg=;
 b=sudoMKDh0oLRzFLzB2sqb/uIfDoiWUxFkpePavPmyYlS8xmynFhtamw8U8BPWG9ck2sW
 F+Qaoqh490nQSqX52UekIpT3WrVWVr/oGGJMqQ+jwuFfP8ee6zoIOm5gJeTUh2NYAe/3J
 brVt8wvuunDbm6NEcnkMduIHIvmJAT9cfyZ3kkfRbGFu6DJrwtF0cdYDZjvK8aSkju6OD
 +wnM8viLz/wwXNMw1SVSgYLpAeTUlKx7oisBtoXqYmLMfEf/c5e5SIso8ky4qxE/KxVwm
 7g0meBmJnfnTeNTzwDGeeBve6zEL3owIm6z1woiUUpIaonMB5DwpzgW2QfevlB/5aMQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QMFtXH9r; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96BD2605F3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 12:39:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 09C344E41207
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 12:39:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D19DD60362;
 Tue, 13 Oct 2026 12:39:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 866C111D7109C; 
 Tue, 13 Oct 2026 14:39:24 +0200 (CEST)
Date: Tue, 13 Oct 2026 14:39:23 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <as4mQscln9rXEJke@windsurf>
References: <20260616162515.2677961-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260616162515.2677961-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure due to
 warnings treated as errors
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

On Tue, Jun 16, 2026 at 06:25:15PM +0200, Giulio Benetti wrote:
> At the moment a lot of warnings are treated as errors and this leads to
> build failure. So let's work around the problem by setting -Wno-error
> thus keeping warnings as they are.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for the patch, but what caused those errors? Is it a new
version of GCC? If so which one? Or a new version of the driver that
added -Werror?

Without this information, our LTS maintainers won't be able to assess
whether the patch is needed just in master, or also needed in
2025.02.x.

Thanks a lot for your feedback,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
