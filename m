Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BE0EE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B43AE416B7;
	Tue, 22 Aug 2023 20:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B43AE416B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIdltIW7sSv0; Tue, 22 Aug 2023 20:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D5E641548;
	Tue, 22 Aug 2023 20:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D5E641548
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 669E01BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40D5381A34
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40D5381A34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nj5efqY2AwcD for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:10:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C76981A1C
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C76981A1C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 351C5240009;
 Tue, 22 Aug 2023 20:10:44 +0000 (UTC)
Date: Tue, 22 Aug 2023 22:10:44 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230822221044.02c08e2a@windsurf>
In-Reply-To: <20230809220514.2089980-1-thomas.petazzoni@bootlin.com>
References: <20230809220514.2089980-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692735046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23ioiManjUpuwmHaC9p+b4v9kDI0oqCIuHRNknTrnqs=;
 b=i0owJU3KOpvKdqLf0qBXGuznHn2YXE0WNkSTJbmflxtSzxsOatuP3YanwvHtMjLOhTpOqQ
 yOg3TwHPTSsUYFBTAQSCw/XdmHdfo94em9dCHtTnfgs0cj4bDkXOgMJBtU1AwAD2mYvPMm
 WBXJcHzhfFQ3OwQxV5+zl7GczyDpOcznWsZ9XXhgUl5cbZnif/fDtmY+B8QpsH8/Pc+7ty
 ohjoOFQzRAv8Jn3q4gSiSWLBmT1ngPfvVzswS//H+Y/8RhxS5Z5H4M/ZW08KEdqLpRnIDG
 s5v81mHZLSCk8uRNeB306xKnWkIwYkRXJQbCkHHaDa5v8Lx+7CoHxNx9mFuKAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i0owJU3K
Subject: Re: [Buildroot] [PATCH] package/swupdate: install headers at the
 standard location
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
Cc: Daniel Lang <d.lang@abatec.at>, Andrey Grafin <conquistador@yandex-team.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Aug 2023 00:05:14 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> In commit eb2f2886b2364e5b6a0867f55106bf83acb064e7 ("package/swupdate:
> add staging install"), the swupdate package was changed to also be
> installed in the staging directory, as it provides an API to external
> programs, through libraries and headers.
> 
> Back then the commit log said:
> 
>     This patch installs headers and libs to STAGING_DIR, to prevent a
>     header name collision a subdirectory /usr/include/swupdate creates.
> 
> And indeed a custom INCLUDEDIR was specified. However, installing
> swupdate headers in /usr/include/swupdate/ doesn't work well, as
> progress_ipc.h (installed by swupdate) does a #include
> <swupdate_status.h>, which doesn't work as swupdate_status.h is also
> in /usr/include/swupdate/ instead of /usr/include/.
> 
> To address this Daniel Lang submitted a patch [0], which was proposed
> to upstream swupdate to fix this header inclusion. The patch was
> rejected by upstream saying that the swupdate header files should be
> installed in /usr/include.
> 
> Currently, swupdate installs only 3 headers files:
> 
>   /usr/include/network_ipc.h
>   /usr/include/swupdate_status.h
>   /usr/include/progress_ipc.h
> 
> To the best of our knowledge, this doesn't conflict with any other
> header files installed by other packages. A good proof of that is that
> even Debian (which has many more packages than Buildroot) also
> installs swupdate headers directly in /usr/include.
> 
> In addition, the original submitter of
> eb2f2886b2364e5b6a0867f55106bf83acb064e7 said "I'm not remember what
> was a problem. Probably network_ipc.h but Im not sure now. I think
> it's safe to install this headers to /usr/include w/o subdir if this
> collision was met only in my environment. PS: currently I don't see
> any collisions with this files."
> 
> So, we switch to installing swupdate into their standard location.
> 
> [0] https://patchwork.ozlabs.org/project/buildroot/patch/VI1P190MB0493D233ECC579510F8C0FC69FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/swupdate/swupdate.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
