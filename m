Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3779CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B0C0413E9;
	Sat,  3 Oct 2026 12:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCeKrWIUSffF; Sat,  3 Oct 2026 12:54:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8D8AB413EA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032055;
	b=B+kmziaQfi1FFA9pKm922aSn0cgtW2sy6DFPM/6/53UROewD7bImNSdQRq7qm9TjFY2M
	 I2gHTy39p1DvJVRr42cB1KZdvxOzZyh8zg6nYgIr/UPPBPdY81qlRsXfDzqC8olTZE4KG
	 A+Z0QAHYfwj0eCDhWSM/y2+TPGfnJ+EkdOyqG+2S0+DWDvCnsOEI+wetLu3VgCf3e0Op/
	 pvegT8scIHKSOKbD30XoRh3lQo4EmFZhjyR82/31lM4j5RagZwIFafYdyLasI86/tEti/
	 sHvKac+9GJuS9K6Z5ViWWLzT3xwOxHqxamcTA17vuDt8j20xCJMjsT0HsSPBBV9ZImQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032055;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uuUQSvSGxUWvRAws0+nyv12CJLItqufjxsxIO3zs8IA=;
	b=bQrtku63NsjaNtwPTzeU56FQ77BTsa5t1BiE9UbMrDMXK4M8v6Pc2/ferSXNWRzsbrG1
	 td3u0aXLxUmxekfqE6ZgBERELNk9+xXotyHjMOYyXmfjK/igYPRn4keA7YH4Xj+uyjPwA
	 5l/uEv4cPgLY/kPP0op8BTPrgI2PPUWBDByh6gISkm2BfA5/3aEmd3kU761DoAjjDNITK
	 6Fng2az8OxnHf25VkIvCYOjrFsnT9qi9iqlWAAOUkezGluHkVeYrezBVECmb+Ab4IXYTF
	 B5lDTDb8egPprmzbBOYQhrjxxM0BdjG19wjoYAsu88PWOlzvPtonQnNi77Loi4bqOCA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032055;
	bh=uuUQSvSGxUWvRAws0+nyv12CJLItqufjxsxIO3zs8IA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=scBp+jsCohHrQuXL8u2LB1x94X5Sybkb004eNsJTK0BC5mxj+XTwDinic1D2vO9+t
	 QrAppEOMXJQ5mNimxllyHtr/kMw+m/t+V5jWHxCMH+NY/rOyuJ7XjxPGkxVopipwJn
	 iL87UXQyerAoBmEHPDGgzjzhVbWVQzQkZ5Ye77BJll/iFV7ZWZJIXQHuJQ55tNNyiN
	 aI/g8Rmxx5UtL8kSh+MChY3LpuhOh/MV3HLqd9bF7i6x5NdavJ12AfQ9Pl1no8lvpp
	 YBzuHtG8JvxY9xxhl2vD/AiFuyX7MebnCEaOH6Z/k8zrpWO3AGpAk+3uX5HHkVpxm7
	 IcuBeVZJhVZHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D8AB413EA;
	Sat,  3 Oct 2026 12:54:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06FD11A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1607413FB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yuNsMK-JTuK for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 094E6413EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032053;
 b=BUdI/zEPN405tZi/4OXPlw+dL0TVaOz9XYX/t8EE8UVih2nXA2EpzjbRXLHynfKqrC9I
 C91BoDPDJenMABjrq+XW0eo27GYsvjojZcbx8c1Qk7GhPmNMjHFp4Mk2enOLL28MqXZUt
 FmQoiLFn8QBbJohMB/HFwm1xMXvqaVYeXVqdLLTsQ+/3t519jOl2QWjAbzggdH7EktQ0C
 yfIzNjBpr+Li+s5pC09giv8FGuGSkOgKvNX9ekbtd+i3BtVpiIwdcTC8l62PT+8hghc1v
 Id1gdJqp31l4EABX1VxWEMo1nIOVelbvXgSVPHcqv+mddRUIzcwsU34E07JrUAHcmZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032053;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=vZwYy5O+aSk9SkxD+sNtgR7fxIXFFaUILnyTfhzUOzg=;
 b=JbfWlY0nBz+dZD9niMgTEwR086C91kxJflz5K5+2DrROTDckotFhU5521vcbimGD+4yk
 7y0JOQ6sQjpB5ezkewMEsegoGcuRAj8nKEqVPmKBzoBt4gbd8luyh3FGikvRsWmYbTR/w
 1H4z8c6BxnpfDYmz8Alui5YwR0snKVaUq7irQ8nz1jw/NaKOATSJ4wJi1J3SLC1dUG+1E
 1To5HvANJjBtJb2uNWRZi2dcVh4gjT2iFt2UdKZede4wkHovwiYX8nh+BBlQBKRyRhjyI
 G89akmtkdjEV2w74rH6djcijpDqCZCE4pMGKgiVnTVITGRUbmzkweLI2FqCmwZ4qGGQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NSQwd7JJ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 094E6413EA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B43F84E41129
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 89DDB604FF;
 Sat,  3 Oct 2026 12:54:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF09E103283A3; 
 Sat,  3 Oct 2026 14:54:09 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:54:09 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD67hYpgj21QgEt@windsurf>
References: <20261003084453.545653-30-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-30-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version
 6.0.0
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

On Sat, Oct 03, 2026 at 02:44:15AM -0600, James Hilliard wrote:
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
