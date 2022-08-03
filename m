Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F71FC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D1E441C96;
	Wed,  3 Aug 2022 16:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D1E441C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91TkSt3PXe0I; Wed,  3 Aug 2022 16:37:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAAFE41C91;
	Wed,  3 Aug 2022 16:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAAFE41C91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B29231BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E253828E3
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E253828E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7wBz6aL7pOq for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:36:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D4F5828EF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D4F5828EF
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 16:36:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C599660006;
 Wed,  3 Aug 2022 16:36:52 +0000 (UTC)
Date: Wed, 3 Aug 2022 18:36:51 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220803183651.6f08bf1b@windsurf>
In-Reply-To: <20220802173330.15176-1-guillaume.bressaix@gmail.com>
References: <20220802173330.15176-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659544613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVI8BK1OZID8szA4iRXZcdRQKO+d+b0K6wg1tt0cjmg=;
 b=Tv5wBWO5bDveFsfMisq+wEh9fsG5mk8AKnb3nVjUHSzf8D2mSnMWbe/rHEEGPprIQf8Na4
 kFmzmYfC7o0wTMS7TvZtEZAgNPVE/ls3SOjrotOTOFZ/ejN+bARgG3gM1PQbqNt2vxjwzu
 fbLux6NPOBJRIX/IjVLqFz5/g+3emiQbCaIzFzta7bTz+jX4aEDbg/wC0aKfEK1Ul9jAuk
 cIBtKaZCGIwdCsFn80KrTa0cTcuyOynzIOvgsrTSGpRo6jp2yc6xsuqzidQeo9EVeqwjJa
 3BcA0iFwX9aapCMk9Rl60u5RNajh1kSnfx8Xe8DUHrk8HFXdSJoPSj7jvwO4pA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tv5wBWO5
Subject: Re: [Buildroot] [PATCH 1/2] package/python-scipy: fix io runtime
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Aug 2022 19:33:29 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> We need python built with the --zlib feature, for the io
> module to import properly and be usable
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
> I did not provide the correct BR flag here. Let's test this module anyway
> with the runtime test (see the following commit).
> It turns out the scipy.io module is the only one that does not work right away
> ---
>  package/python-scipy/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, with slightly reworked commit logs/titles. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
