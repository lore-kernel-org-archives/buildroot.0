Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF054C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81B66612A2;
	Wed, 20 Jul 2022 16:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81B66612A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-o3fEkmYutp; Wed, 20 Jul 2022 16:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C62160B9D;
	Wed, 20 Jul 2022 16:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C62160B9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92E841BF352
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D043818DC
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D043818DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b01BgG1hA630 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:41:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64DAD818C0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64DAD818C0
 for <buildroot@busybox.net>; Wed, 20 Jul 2022 16:41:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 40C551C0005;
 Wed, 20 Jul 2022 16:41:19 +0000 (UTC)
Date: Wed, 20 Jul 2022 18:41:18 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20220720184118.5dbbfe6f@windsurf>
In-Reply-To: <7e2b2434ee6372f950cce9f78a113fc1ef71d047.1658307245.git.baruch@tkos.co.il>
References: <7e2b2434ee6372f950cce9f78a113fc1ef71d047.1658307245.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658335279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9Pv77F2aA5agJEMvYzcT2ApNomUc5AAb9zsw6AYYjQ=;
 b=F0LqZgY3FzdSmZoprNxUv6htwFrkBTvAVMVELDOg6Qazs9OQsJ1KcRZnWABJFfyZAnPGH9
 Tocr6HcnNHPz6EdgDjnX7N9VoEEQCF/3JllyAFbMU/45dT+ljIe9FUzy292WFQp5gD4abn
 q38sYSDBPtvYjuB7nYWFJu8vGj/1fvC8nnKQB5QxcWrOZW/BUclSmVF+HdEV6/QR24Invg
 MdOvaTTlgRuRrDgJx822HvFZ9ibUGoqgnymNwYT8z/9Uqky49RMkwLgbyeqVvvSaAuy84U
 9NIxIIc/C1rQj0NuSRb5hWkzRhl2Ij1lfePHhdbLmWepXiiPNnXcj1SHOKQviQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F0LqZgY3
Subject: Re: [Buildroot] [PATCH] package/zeromq: drop libuuid dependency
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
Cc: buildroot@busybox.net, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Jul 2022 11:54:05 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> ZeroMQ removed the libuuid dependency in version 3.1.0, 10+ years ago.
> 
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/zeromq/Config.in | 2 --
>  package/zeromq/zeromq.mk | 1 -
>  2 files changed, 3 deletions(-)

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
