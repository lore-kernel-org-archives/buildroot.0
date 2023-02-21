Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB68C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD685827F0;
	Tue, 21 Feb 2023 08:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD685827F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANljRLJF6QJ3; Tue, 21 Feb 2023 08:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4E9582884;
	Tue, 21 Feb 2023 08:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E9582884
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9F531BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7670742AEC
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7670742AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjHZQk3MWfkL for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:28:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 456A642AA6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 456A642AA6
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:28:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6E2B224000E;
 Tue, 21 Feb 2023 08:28:56 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:28:55 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230221092855.0385f44e@windsurf>
In-Reply-To: <20230219222048.22093-2-troglobit@gmail.com>
References: <20230219222048.22093-1-troglobit@gmail.com>
 <20230219222048.22093-2-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676968136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hRJd6wCQ3+rVt+zpLS25Ow6vnQVvVHuVfiRxuUcm/B8=;
 b=Fy60tK/yxIFUiWJgWxz+isn1H+NLXHSf8k9QNkvvnwM6NVzBjlJsOtDVdsEeaBMFswo2ni
 kI7Efu6Y/knB9OU8UAyWB2b4AGAKZ7IdKe6DgFi7IF12L3yPunjm02v58MHd8269mw/BbA
 wqK3+LjJZFopY11HULbcTWG/JYH8sbg2ass96aPgwo+Hrvl5HhKzveN4OEZ0d5eYwK9jbq
 5+M18pzT7dSQF4MrVoSQ9JgJjNrUPnElQsMQqa5JTu+axDKVJ7QfInGRAeP78h0quUZHR4
 K98ieskpnvjpJ12+hZ1Qt6LaR6GoGK6SPRzH1OTmsc2H6OK+Y+Dzq++veROwGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fy60tK/y
Subject: Re: [Buildroot] [PATCH 1/1] package/ssdp-responder: bump to v2.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Feb 2023 23:20:47 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> ChangeLog:
>  - https://github.com/troglobit/ssdp-responder/releases/tag/v2.0
>  - https://github.com/troglobit/ssdp-responder/blob/v2.0/ChangeLog.md
> 
> Critical Fixes:
>  - Fix periodic busy loop causing intermittent 100% CPU load
>  - Fix invalid <UDN>uuid:uuid:...</UDN> in description.xml (dup uuid:)
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/ssdp-responder/ssdp-responder.hash | 2 +-
>  package/ssdp-responder/ssdp-responder.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
