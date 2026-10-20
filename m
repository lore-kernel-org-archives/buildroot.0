Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBCA606A31E
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HoU56TKp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB5460802;
	Tue, 20 Oct 2026 07:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPnU0ItcBVwX; Tue, 20 Oct 2026 07:21:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A29060808
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792480889;
	b=TSdBaG7DS3AaI/DWrPjH4IHukGq0sLM5AjhP9XchgzxvpuhfHbHY9hbEtu8fXAWMiFQw
	 W9+UEH7TAWOdYWIwekw1wVcYNkOW3CPwRKLDZZkZKxsYveHq7bJ9EF7PUaoyFOKhVm+ND
	 sDhhzuhNSXUxQMSkLYd38Hh3sVc4LE3uz1+ozxoOvgfffM7P9pNs+KkezzDn1Bs9y8QuH
	 OSWF4m/M7zcArXOIGbkjTGT9I5R4XNH0HfNlRx2oiDzozqiYOxuG/4+MpX1UcIRGmiHIw
	 RAk60GBkwaVhME5mfjXUkkAy9qH8Irxslv5i/a8X5VwwNTXbhvva1ybUXRGy/EuySrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792480889;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gBaQUuD3NNQ/NNVfrPZhqHHXX7P5E6v1mUH85aHeLLQ=;
	b=sxMTO9nTo4eVuUp+TDF3J03zRXYVWsID1ClsqTauXzcj3QqFXWduubN21VVTGsgiiMQj
	 oWmX8EKvtWjkKKBbK0yikgao17RsB2cbToRqz0Q0/RUcqESWp3JCkWEEJoDAT37txwZ+w
	 8Yhm62+D/DzqbQFX/OZy68Iy3rLhQHhi2bjS58zPVriysyBIWa+EQuNaxoV2BK4x1QNwy
	 3e6Bn1dHUMhMiwW1w0jasi6OlBhQoT+SgetNHBfVUTjmOI4PcFqrfdliK+08n8fnYajSe
	 vGGnCRu66YCLXbmQXVpCFZ+ahvy6PKJ/r2cIpziDpcOBI2BkIbaZcCgV7/qm8I4Rc/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792480889;
	bh=gBaQUuD3NNQ/NNVfrPZhqHHXX7P5E6v1mUH85aHeLLQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HoU56TKpEXTgiTgFPeQuOP3HOoaE/2Eq3xzJVQ0I4hw4oZxCQyhSyZj63FLvEUqvA
	 C8t5UxwqVHxo+NnO5rCEnxf+c8l/K7DCUQb1M443K9AaHkigO2rU9xT7ZhJyJ9Sh7R
	 IbZKpjnvDUQr/ZrYzj5TwZu/UbFC0wqDCp0PYJNrK0lhi91NVuiVPzpIYJocQlR2Mr
	 rzT0+RyPCSCOX4dSy9wmFbM0K1I/6R3W5DVw9NgmcOJupXk/ogu3GY5F0FD4HPOlZ/
	 i2wNzviO5HSYHutS6And9RNiOeWCHvvbWeRLrHDUN0L//DUxpbfUrZsw+uriIxCJAO
	 /DYHrjItM4qxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A29060808;
	Tue, 20 Oct 2026 07:21:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 772E223A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6904A40312
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaX__NJUNkHj for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 07:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AC5AD4016F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792480886;
 b=slDMHIQpOUk8tWrHtoAob3MrbimejMAZf+V8oUOhSRBdaPRjuv0FyEN952upcmKZrASm
 41XeIWPsXd0ol60Fgk1uw3pBnAPydgbLp9fNkyUSaKidJejbo/1omtpq48ztnHSUUdNIZ
 U25iQp/8mmL7KxIOCk4wWQo1dtrbtrHM6YWvxCeQyuhsDtmZzQ9j4qsYGEISWPYFssgcE
 8QZCHLWJkyTNVDbS/E67gDpvJwm1skkVsvUAx12/ZDiAjyUcX+v2Q2w3AWE1VCd0cqn41
 7eK1W8CRbhqS1l0Vesbr39ta9TIK27rALzfwKvqwZufR28ouig6dS9BUR4NOPCT1G5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792480886;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=kEfCvX5cI/qoY1C/lmr5ad9Q26YIeCVwKU2Hvsm/5dM=;
 b=eF0i1qYZxVDbtzvaVeF+S1xp/L5uV3mEe6G00blHJjW9LpsAy2JyxsX7RrUKS5VgZLg3
 sqV1674MbNMQLIqItL8bqHDj6vLX4puZvmBHGiR5TPiUiYaDDiMMjlsFs0q9x0PPF3kC9
 RPegkSqJB6cYbptcAe8b6wrXEerBZ0d+LffxLQb5/xuKeyzJExrrslDOOJ/2453zrkVn8
 RlOzafd+wgU0W9oFf6CKZTS8zdyKYlrjhJCuoo4n25aegLd8d+X2d4Wlw4nl2sCavPmSJ
 r9Xm27cxCvXz2TlEkS7WxqGqWTrpxlZBWVQvEmZuCpcEOVFwYEEPEK51AezMFKyh/GQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2BetxIHM; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC5AD4016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:21:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E7FD7C5CD5F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:22:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A2A1606D2;
 Tue, 20 Oct 2026 07:21:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33E6F10328D1B; 
 Tue, 20 Oct 2026 09:21:18 +0200 (CEST)
Date: Tue, 20 Oct 2026 09:21:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <atcWYN2J4nxHxf7T@windsurf>
References: <20261020052205.4504-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020052205.4504-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 07:22:04AM +0200, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.4.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Both applied to master, thanks!

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
