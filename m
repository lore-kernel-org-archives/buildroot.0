Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E230C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C9E409F8;
	Wed, 27 Jul 2022 10:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05C9E409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAYQDDABg34W; Wed, 27 Jul 2022 10:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB240409EC;
	Wed, 27 Jul 2022 10:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB240409EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D85D1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7555D812A4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7555D812A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_ehSGuF-CDC for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:13:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 740A480DE9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 740A480DE9
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:13:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A6041BF203;
 Wed, 27 Jul 2022 10:13:54 +0000 (UTC)
Date: Wed, 27 Jul 2022 12:13:53 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727121353.602bc74f@windsurf>
In-Reply-To: <20220727092123.985892-1-fontaine.fabrice@gmail.com>
References: <20220727092123.985892-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658916834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWpBP0XjFaBDm/HQ6CeT3uAf6mkn5KP7aB5fNYKvFRQ=;
 b=PU1ChEg/S+YtNodZz45VTfTFI8HkPuS0I1t1pwxkLgYokf6gQZ9YnSkBA+t08aH7AzmlXg
 zxmGg9BfYD8ooPJqaGJu4QkYdkVjXG9mu41MFAbVXZRkOAhFhI+qyvXVUD/TKUOxFTMOmH
 OrrbqqvMnsZxTiPWalfYRuCy0ls2j/+s1QCB1rRdCJ9G2mnd+7IKTbvteqaMiG+IltDJ8b
 sQ5hC8YnaWF0JQEOD/vk2XNtq9p1mEngj8rTVqFOl8eRkV/f8abqII0NjEc99qYMC07vzc
 nrc308HYRo5nPEXQ6OdG6JvFXMFGRb1/DEkszs25RqlGWFkxVzxXMt+pHPy8Hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PU1ChEg/
Subject: Re: [Buildroot] [PATCH 1/1] package/drbd-utils: bump to version
 9.21.4
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 11:21:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/LINBIT/drbd-utils/blob/v9.21.4/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/drbd-utils/drbd-utils.hash | 2 +-
>  package/drbd-utils/drbd-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
