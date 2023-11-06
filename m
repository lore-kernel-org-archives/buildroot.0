Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2768C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 569314023C;
	Mon,  6 Nov 2023 22:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 569314023C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQCTu4KoeDVt; Mon,  6 Nov 2023 22:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9000E410CA;
	Mon,  6 Nov 2023 22:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9000E410CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 131251BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DF104215E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DF104215E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6avPxvu-jH7A for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C321142095
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C321142095
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B3E760002;
 Mon,  6 Nov 2023 22:25:53 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:59 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232359.777da9d9@windsurf>
In-Reply-To: <20231105070238.2868381-1-james.hilliard1@gmail.com>
References: <20231105070238.2868381-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRK+Aw2wLg/M6ZD2pZ0kB/5Gn8jOxvNk6VS4glE4P08=;
 b=igxoQI3yxK2QwfQiw/Ivu3tAnEI89qUim3YGBfSzENJHLjirq3KzhPXF8etgFOpGESwQBE
 awxauwoM3BEC+O03+ap5skK2DHZPwaQ0m0Gdc9eptmKGSSWWInKi4EhPvm2XuENPDwQIwd
 ShwUmLF9XOwl+Gqg1CaZIkfr/s9y1WDqN0VoPFLeg69+DD0w+RLNnrf/1ywve0wYDNUIfU
 6VjzKkI9Yur0ysTL0YpRI8277nVzmfcbCBGJS2DMqBgD2X9sDdJXDPAAPPxgiD8CjEIrlK
 Nt8A/hw+QX0RMD8SOgoDLeSZAaWeqImeVPp762pCfWYoFm1ydekzpHz/Tit2Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=igxoQI3y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-git: bump to version
 3.1.40
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 01:02:38 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required python-typing-extensions dependency.
> 
> Switch to pypi based source download.
> 
> License hash changed due to formatting tweaks:
> https://github.com/gitpython-developers/GitPython/commit/e1af18377fd69f9c1007f8abf6ccb95b3c5a6558
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-git/Config.in       | 1 -
>  package/python-git/python-git.hash | 8 +++++---
>  package/python-git/python-git.mk   | 5 +++--
>  3 files changed, 8 insertions(+), 6 deletions(-)

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
