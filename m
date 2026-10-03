Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC032CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C0916061A;
	Sat,  3 Oct 2026 15:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlklXLx8rsHX; Sat,  3 Oct 2026 15:42:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ABF4760628
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042134;
	b=sR7C0mfNQB2HTyCSam1Ke9J2OVJdVE0kzO05GATtcdpwUi5ehevjHFuTIEae57ofGc4D
	 0gCT1Le/qcnkklj19nr9oYQnBm0OUG4au3lKb6GQd6lvRnFf2hmxsgJnaiMsimde8wui8
	 Kmrg6Gup1CH0WteEGZ4oodgH0Ilrla8tuc0BF9rfb2sADhuYWAM8IQEfFzACKTzvIL2/x
	 YFDGXqjqsQB+HXdlQ6PERwxp1V3cZwGWX2STKvuQ9fqSZNy63FaLNgS+N5DBwsi46VXC1
	 RS3u007azL8dVHkJLvOpdzijDq3BxGnhXt/+uOHbtIQ3yT6R5eegT+0+pbQpZSv68bQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042134;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Cwk7xihUPipEK6MD1Ne3edfVxJ07IKfihgAQpmEIlNw=;
	b=OWt5lIJ8AWeKWs707CH6dgo1kXaD4vGfYysGU+RbkOwTyeRtuDbWYNR6pTiqKWpEWaZR
	 FsSxyto+NcZBGlF40kA+CEvW3ZU8ESXrhJpJOhs7j01ECoaQ+On8Bdmth9pBVZhZ0biLL
	 PTIzNZSDwgUJdhuQncGXn1MyubouzQ8BB3kNDVJAlP0v06KOiEPge/v3RZPbMh++WKgma
	 rS6cV85SF31WeZYCxbrx0jGTlcFv9nHbLMFQN4BG29InextCjd6knOrNVo1WifgSNU9vD
	 mkg4qgDWYYs2YjVHQHOAg+ckeaO4PMSpDz2saZ+uFyVYDOBOu5xTsfiMxa/QR1BjZag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042134;
	bh=Cwk7xihUPipEK6MD1Ne3edfVxJ07IKfihgAQpmEIlNw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cXVSJcOPCsTVWW4Gn/QWAwwYsMpXn3HW3174IUqy/b5Qf8GVqsws1gAp4h4pjnWBv
	 UyNT4o4aEQD+YOtcojMi4QFrsl0pGHfRgOUTpIHsiTfXup6tM3I3TPduiwuao+s54X
	 vCTMGRNKO8trud7Fb4w/pPKD9T5fyyPbgDOiUPIXCliRY3iWJGezerigBcmf7HlOcr
	 ys0RuCBLsGRoxA9zyc/AcudX4/qkEVl/gkH63R5wGoYlk0jl/ml9TbgZIL9a5/ksGO
	 3Eorg+WPJ8n/wfrtLH/1O65i8JoIQJLs0Ifq6QJOS3t9lGpbGbxkOY1/m8md9+0y6O
	 f5casafwQDszw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF4760628;
	Sat,  3 Oct 2026 15:42:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8125D263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6666360628
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7sWx4cljMAQ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:42:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 070476061A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042132;
 b=KCR6V33m3gaaUaZVNIPKau8T9ZTineiURrgllvHy3YZKAoQF7dQhRKo9vBh0aZHMgQ/N
 9Dm3YVvZoa8DM27Rm6RTiBQ06GJKNP+V5P7LMKSC/fSpBfrvgzY98qKZb1voPfem04+4c
 0fVxL0FL/kiWnxNiyUL8lcVgLaRC90iMZgUVb+neqmWnTRjtfoe6dudomxgOWCLCVVvKP
 u/8odm/eqhJtO+zCYABhqfHN9CHQwOcSqckjgqJ2/ci9ARHFdvmSSUcg+uOk4MUbosYRX
 705iQVMWHQlK1Fhyo9rEJxpM22YAdCxnZGnEcAe71G2wK5c1zapfK7mirwkZZ8GimJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042132;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=P7gnsysfyexhSya0/uXNRIQG5z8uFD2a5i1iyQlsklM=;
 b=TgUXWa4irHBnwIHNcnboA/3MGcc9BHEhmPAM2UYGfb/ZaOOAJUK/J3tLESpZeSw5xhug
 OCg/ExhssdPtYXQIVK+bPJ6An3cSAmQlgzlspZ/B7yf7qzaoWF28MSsZiF/VEanvPF/c9
 NLw9bH/6zA/mI5CblGl/mSqU/PtLnWubx7FyLHyUwU2BdwhxyS5HNSYe4jqSZ+WkX0aWt
 OiTAgJmEe1P5RBcEbunfgWDVtc5A2CnW/lOAK6h2B7wPCrqe96FlhMo9C0/nzCgY8/31k
 N5zm2SV2hrv18flwossnImp0xV0Z2XejSEEbKmlWTwV+G04fuSbTg5QK8O7ha9jo0zQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0vCCdYKr; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 070476061A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:42:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 955B54E41134;
 Sat,  3 Oct 2026 15:42:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 63657604FF;
 Sat,  3 Oct 2026 15:42:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D32D1032827F; 
 Sat,  3 Oct 2026 17:42:04 +0200 (CEST)
Date: Sat, 3 Oct 2026 17:42:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <asEiMmjEY_NIfIss@windsurf>
References: <20261003070128.1295458-1-bernd@kuhls.net>
 <20261003070128.1295458-79-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003070128.1295458-79-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 079/114] package/python-scipy: bump version
 to 1.18.1
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

On Sat, Oct 03, 2026 at 09:00:51AM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-scipy/python-scipy.hash | 4 ++--
>  package/python-scipy/python-scipy.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

This patch breaks legal-info for this package.

Please do NOT resend the whole series, as I'm applying most patches.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
