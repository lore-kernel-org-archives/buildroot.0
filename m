Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50974C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 14:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0CB14155F;
	Sun,  7 Aug 2022 14:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0CB14155F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ihZIx5Kq25W; Sun,  7 Aug 2022 14:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7935E41523;
	Sun,  7 Aug 2022 14:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7935E41523
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9561BF307
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AD8B81493
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AD8B81493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JbGMINxN2LH for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 14:56:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96FD18146E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96FD18146E
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 14:56:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5FF4A1BF203;
 Sun,  7 Aug 2022 14:56:53 +0000 (UTC)
Date: Sun, 7 Aug 2022 16:56:52 +0200
To: Emile Cormier <emile.cormier.jr@gmail.com>
Message-ID: <20220807165652.12b97fd8@windsurf>
In-Reply-To: <20220403221953.1158787-4-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-4-emile.cormier.jr@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659884213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWgCp64SieYws4IM0fMvho61tx/1bJumwNN8xX6WaHQ=;
 b=TvDfM8/vLhRdp8xvbwkuzR0hgE7TuTO8KX5wY00Xc0/YWDdehPlkHuZuwl7qLTmVzIXmFI
 qoNX3dKjiLIcauRX9vnd7sj/156vInAFFJ6GhwEAk+nu28K0/+oOUwpypslZQPEYuszSdi
 cuhVxeZE0G5qcNcjLYsx/joEPjnQErNQZBbrc424k1PX/w3gclpXrDpAnWHXI6ChynQ7Q3
 y0NqvdgzRf+VyuGORGAlzziFoT90pG2Vy33mJbiY0QPEhaB9DQebYcUTZRQc0We6xQ6B1m
 7TUsRW1ReGVGSyLwMhPjKfqkS60LzzJcW9wfNLXCBaVOpBHT9IP2gEIpTnG3kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TvDfM8/v
Subject: Re: [Buildroot] [PATCH 4/6] package/python-twised: added conch and
 serial support
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  3 Apr 2022 19:19:51 -0300
Emile Cormier <emile.cormier.jr@gmail.com> wrote:

> From: ecorm <ecorm@users.noreply.github.com>
> 
> The conch subpackage is required by python-crossbar.
> Added the serial subpackage while I was at it (not required by
> Crossbar).
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
> ---
>  package/python-twisted/Config.in | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied to master with fixed From: field and slightly improved commit
log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
