Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333D3C636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BC7C40B86;
	Mon, 30 Jan 2023 21:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BC7C40B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HY_lG2bcyx72; Mon, 30 Jan 2023 21:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55C1840BF4;
	Mon, 30 Jan 2023 21:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55C1840BF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08A9D1BF291
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFFA182014
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFFA182014
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9wc8LSpploc for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:03:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7341C81E9A
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7341C81E9A
 for <buildroot@busybox.net>; Mon, 30 Jan 2023 21:03:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2BF6100002;
 Mon, 30 Jan 2023 21:03:30 +0000 (UTC)
Date: Mon, 30 Jan 2023 22:03:30 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230130220330.319b1dec@windsurf>
In-Reply-To: <20230130170713.13590-1-francois.perrad@gadz.org>
References: <20230130170713.13590-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675112611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ev2IL+HxdBHPGamA9fzFpXAywEq3clVXn4QURPfTBD4=;
 b=R0PECtaLN9RxwhUqOwW/hA9ckvxqKp2ATBhiqgLCzYza4YcYXR3gss13fETms497TMrN1M
 3pREliJsEOasQtWbvjivOsZQ6gOp6Zpd3O/o736gFFwRG8pEwdmSqMDpONT5L5aBB8qhVF
 GXlcT8nI/VL/LOwFKHlgkSsMwlBNzc7FabL4mMCq9lFdDNZnQHUQyFxZWiMSO2xzmzW4Kr
 j27aTKORgYtrDoDGFoQ2soNLJt5HWc4yiQfWNqusP7WEcLjCShZpHE5FJD+WGI47myFP1+
 CogOECylQMhaka3SaDNyzxG+dao5cgOlZH26DHtA+iafCWWjBC6F+7HQ94NZHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R0PECtaL
Subject: Re: [Buildroot] [PATCH] package/luaposix: bump to version 36.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Jan 2023 18:07:13 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> diff LICENSE:
> -Copyright (C) 2006-2021 luaposix authors
> +Copyright (C) 2006-2023 luaposix authors
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luaposix/luaposix.hash | 4 ++--
>  package/luaposix/luaposix.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
