Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD96C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44FA26102F;
	Wed, 23 Nov 2022 21:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44FA26102F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98m1x0_bK40H; Wed, 23 Nov 2022 21:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D1D660BC2;
	Wed, 23 Nov 2022 21:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D1D660BC2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FBA81BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39BA841638
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39BA841638
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vB1HrQfEvJrZ for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:51:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1D54415CD
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1D54415CD
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:51:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E8827240004;
 Wed, 23 Nov 2022 21:50:59 +0000 (UTC)
Date: Wed, 23 Nov 2022 22:50:59 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221123225059.65b6b796@windsurf>
In-Reply-To: <20221123195045.2956125-1-troglobit@gmail.com>
References: <20221123195045.2956125-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669240260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vk5tqseRO1WwHCs30wxaC+Z/P/xgxQgacxKH0NEu8A8=;
 b=lNK4pBEs+7hizAreDDTvKW/ioG2UUmV0t2RPBWBWEmoaleFzKPAmfZiMxFUQdA2CmgIc7K
 v4g8xtmjkG5Y6tXH1o1Wt7mpNmN93jC/dJh/6LA5DgOu+wf/AouTNMJzbLhpfWTvY1wYPk
 FIYKa98PMGyMnHeCwgccmRFSU5sKt/HIB2SQOnsJgyhzNdYivCiM+YiQyfC+MIIedumIH4
 IMLZ9UgzmpstI1OBihR5+rN5SV6J8yAYVmt0IiSJqlDywk9MJAMVJPzJA9OMjXkjlrAyW9
 ooGHijD38YCLgGNLCwonBUPl1w3QPv2vJYpdmz8yOzcStUtFRjvEILt285QW8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lNK4pBEs
Subject: Re: [Buildroot] [PATCH next 1/1] package/inadyn: bump to v2.10.0
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

On Wed, 23 Nov 2022 20:50:44 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> Highligts include support for MbedTLS and a serious memory leak fix to
> the GnuTLS backend.
> 
> Changes:
>  - Add support for MbedTLS
>  - Add support for per-provider interface to bind to
>  - Use HTTP-only for api.ipify.org, default (fallback) checkip service
> 
> Fixes:
>  - serious memory leak in GnuTLS backend
>  - ca-trust-file has no effect for GnuTLS
>  - handle easyDNS "no update required" as OK status
>  - use configured server:port, don't force port 443 for HTTPS
> 
> (From https://github.com/troglobit/inadyn/releases/tag/v2.10.0)
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/inadyn/inadyn.hash | 2 +-
>  package/inadyn/inadyn.mk   | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

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
