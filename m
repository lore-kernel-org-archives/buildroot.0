Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97BFC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:05:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B460461105
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B460461105
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805E980C41;
	Tue,  9 Nov 2021 08:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGsQqG_5D4mT; Tue,  9 Nov 2021 08:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A4A80C1E;
	Tue,  9 Nov 2021 08:05:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 748BC1BF3B9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62FA1606EF
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMiqtrzOT-7j for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:05:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90AC9606A8
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:05:07 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 38C8B22234;
 Tue,  9 Nov 2021 09:04:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636445100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCiCoQHtPwV9My5dGmsU3rzQDXdBKB2tpBfnlODDurQ=;
 b=eAvG2RNLGpc+9pJAbjlrLEZZFqLemJBJIHI4FUFqLIVIncQQ/DfZhEgQU48FOeDoYA0StQ
 k0bQ0ys5pVOI4noowzNxVJHDS5R3bePD1LAT6Wdd8qY7Q9fhFVKkQ1QYuTkj5QOXHBF++T
 RPDpF5xMrSac4+MrIDkaiql4LqVV5B8=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 09:04:58 +0100
From: Michael Walle <michael@walle.cc>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20211108230520.4007148-8-giulio.benetti@benettiengineering.com>
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
 <20211108230520.4007148-8-giulio.benetti@benettiengineering.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <eea83befc9a6f40dad4efa7a4ae019de@walle.cc>
X-Sender: michael@walle.cc
Subject: Re: [Buildroot] [PATCH 7/7] board/kontron/smarc-sal28/genimage.cfg:
 fix option suffix
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?Q?Micha=C5=82_=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 2021-11-09 00:05, schrieb Giulio Benetti:
> Option 'offset = 4k' must be 'option = 4K'.

Why is this is a 'must'? Apparently it works, no? So if anything
it is for unifying; but even then it's moving in the wrong
direction. There is no "K" prefix in si units. Stictly speaking
there is no "KB"; there is a "kB" or a "KiB".

Anyway. I'll let the buildroot maintainers decide on this.

-michael
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
