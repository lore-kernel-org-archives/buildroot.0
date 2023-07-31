Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2BCC04A94
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1951D40A07;
	Mon, 31 Jul 2023 21:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1951D40A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y2niMoz-cAk5; Mon, 31 Jul 2023 21:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6157408B0;
	Mon, 31 Jul 2023 21:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6157408B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 296671BF20B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0156180BDC
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0156180BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Bh-woG53wyo for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:57:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0B1580C08
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0B1580C08
Received: by mail.gandi.net (Postfix) with ESMTPSA id 078DFC0003;
 Mon, 31 Jul 2023 21:57:38 +0000 (UTC)
Date: Mon, 31 Jul 2023 23:57:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230731235737.3a0eb6a5@windsurf>
In-Reply-To: <20230731214559.99648-1-james.hilliard1@gmail.com>
References: <20230731214559.99648-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690840659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NsroCdWmbHkl5jdp1xe3HTNuCw23qa65PQehjC+eBw=;
 b=o/oX7jboD78p82hwAYS8/6iKZjxUkX7kxqgKRt7JQNf4aXu6VxaxHmsYJP917RR+oOnc/F
 tFsNI4PuIssc2aTABFLcek/5WSD24LwTv+TZ3A8XsGkGpcDenFMfZUOP2f8NUPGAcv6/cI
 BLfSZTtmrgYXuS2zUmZADCiVTSEbOVNRD7bqqHvZYmvuT4+OeOyJbmHBkkJyjoYv9gBaE8
 vgvODQKIwCnuapsm3t0Gu8iNQTeiFQ7nhWIDQjpEaxDtnYJBKOByNby9MI5ZJHUlCQRGbw
 WyUZohUvqSQgHev+cUfmfjNM6PeQHYVo8WWmDViQLRI8DsBg/AQT0BvK+ToJng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o/oX7jbo
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: select kdb
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 31 Jul 2023 15:45:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to select BR2_PACKAGE_KBD when building systemd with vconsole.
> 
> Fixes:
> systemd-vconsole-setup[129]: /usr/bin/loadkeys failed with exit status 1.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Same question as always: since when is this needed? I suppose since
commit 36d275f695936b7a54738c0354572944c1f08d87 ("package/systemd: bump
to version 254"), but I don't know, and Peter will have an even harder
time figuring this out when he will try to figure out which commits in
master need to be backported to the stable branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
