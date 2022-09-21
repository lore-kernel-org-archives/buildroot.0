Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB0FC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A0EB4053C;
	Wed, 21 Sep 2022 20:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A0EB4053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlwBMaQa0IYB; Wed, 21 Sep 2022 20:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD84240566;
	Wed, 21 Sep 2022 20:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD84240566
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75A6F1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57BA882FCB
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57BA882FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTxHHIkNAURx for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:29:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E3A382D45
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E3A382D45
 for <buildroot@busybox.net>; Wed, 21 Sep 2022 20:29:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4AD88240002;
 Wed, 21 Sep 2022 20:29:36 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:29:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220921222934.07100d0c@windsurf>
In-Reply-To: <20220818102829.4144-1-mf@go-sys.de>
References: <20220818102829.4144-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663792176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LzGKBBs6sMedGAdo0kBtPck4JtHCyD+R930ipz9PQ6s=;
 b=lZG1PpJ0lHz264xGZ4W9qPW3/1FGE05H8oxWmbVGWfw6dFeGzxrxsUXzY6VBTd5DlPVsKI
 +tXfudYSt0KYbG+43P4R/EOANptHEipdzWTT2jGiBGEYerlKfLfBI3h4F6CTy2Mr+VrX87
 1cO2+vHMjOmjd0yjwHr8d2iJicnmpSvoDzytyi99gMaVuPPYRY5+44MZLTjcqUgGDb525/
 yHupWo2Phbasu/3qmeKhzYkHN0K6wIkdKog0GUauGQzEtEA9Ip4L74+K0EgCpPD5nBBbKw
 yeYH4sYql/I/JjUXKZE+58nmCftjcJS7cDYAIOcUcCYiMSVaXbqTFkKo2yzyng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lZG1PpJ0
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: bump to version
 glibc-2.36.9000-50-gf465b21b06a17e26c1af7d75603afc481ebce0f6
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Thu, 18 Aug 2022 12:28:29 +0200
Michael Fischer <mf@go-sys.de> wrote:

>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
> +GLIBC_VERSION = 2.36.9000-50-gf465b21b06a17e26c1af7d75603afc481ebce0f6

Thanks for the patch, however could you generate the GLIBC_VERSION
value as explained in the comment just above?

It should give you this:

$ git describe --match 'glibc-*' --abbrev=40 origin/release/2.36/master | cut -d '-' -f 2-
2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3

Could you update with this modification, and send a revised version of
your patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
