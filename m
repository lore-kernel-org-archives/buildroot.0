Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0487C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6638E84037;
	Sat,  6 Jan 2024 09:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6638E84037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCTjp6vzhIKY; Sat,  6 Jan 2024 09:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B19ED83E88;
	Sat,  6 Jan 2024 09:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B19ED83E88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEB01BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4495E40493
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4495E40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwGMuJw5Ye4o for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:51:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57995403B3
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57995403B3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C11D60002;
 Sat,  6 Jan 2024 09:51:12 +0000 (UTC)
Date: Sat, 6 Jan 2024 10:51:11 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240106105111.3d67b7e0@windsurf>
In-Reply-To: <20240105131116.390644-1-fontaine.fabrice@gmail.com>
References: <20240105131116.390644-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704534672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4TmHVep1LSnLp+WngU8VG/Ej0ZLsQXVtBppo0jEOvFU=;
 b=R8wgyVnnCa/VSCs0aQxb6ygLkA1SdRkk+F71gD/lOdylwmT26bS/UZsTh+o/xbg8sy6/5W
 sZc1dLbJvMxZqE7Xd+Q3Ce4HgUFPYvsIwW8E4sv+QBjdv6i/LRpCQQtvntkNXpp6WM5T5n
 0z1etCfdkTqE5IuN7CiI3VD5fujQHjFL+VjNTl/jfRK85IFnJBV1O08JZYajejO7IRhscL
 PWvfnpelE+1IGX+pRQThlTjZswjM78ijoea4nq0e7nepk7KKzcE2nJlqpuHCk9xnReolz2
 V8VvEIZIYvvh9EuirQchiL0XgC6bQ6fwTI9gp64WF7D8eZAd7E2lAHPD9QIg1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R8wgyVnn
Subject: Re: [Buildroot] [PATCH 1/1] package/cups: add openssl optional
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Jan 2024 14:11:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> openssl is an optional dependency since bump to version 2.4.2 in commit
> 433fd541eaa37db3241eed16df6ae1f51d81335b and
> https://github.com/OpenPrinting/cups/commit/3e9f2c04d620cccf2a09c43791ed9d8bb717c9da
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cups/cups.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
