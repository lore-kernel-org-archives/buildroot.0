Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828FEC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F24782020;
	Wed,  8 Feb 2023 15:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F24782020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8NSwji1u_Gu; Wed,  8 Feb 2023 15:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6837282018;
	Wed,  8 Feb 2023 15:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6837282018
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 408351BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B89B40BAA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B89B40BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rsTDfLZ79EM for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:58:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3E0040C1F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3E0040C1F
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:57:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1ADDE2001D;
 Wed,  8 Feb 2023 15:57:56 +0000 (UTC)
Date: Wed, 8 Feb 2023 16:57:56 +0100
To: Peter Thompson <peter.macleod.thompson@gmail.com>
Message-ID: <20230208165756.5d8dd14f@windsurf>
In-Reply-To: <20221127002135.12134-1-peter.macleod.thompson@gmail.com>
References: <20221127002135.12134-1-peter.macleod.thompson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675871877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FqkMhS5h/CZQAri8m0WG6zEsfwJMFnGEtKcMWV756zI=;
 b=Yx4BygcqNI8fQ83BIFDTsskRZREZui1J7prMoAx0oLaKVSYFAug+vJd7chYLJYr6woeBRv
 t+LdFTKGAW0nCrZUrUCvTcka4XqcaJfqwFnNHu/nSzHA7txh2lKXFivOQECCoBVZkOAEQx
 bsD1SfvYVopwwt6WqDzp68a3vh+1NLuzOcYIHMnmFmbM3lISaLMLLM2UBcW8l1La3fCCWJ
 +4U3KprslcoKggulUX3ReFPddfF+wCel0eByyS7Yl4Oa74YoK42sRF1o6wMzqiLCxm/lQK
 0U7pJNWfzV0PhtSFlv7WMXlIEI7YYViOdrh+cz4ksqmCD63+WCFHRvkzlYq5Kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yx4Bygcq
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.20.1
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

Hello Peter

On Sat, 26 Nov 2022 17:21:35 -0700
Peter Thompson <peter.macleod.thompson@gmail.com> wrote:

> LICENSE_FILES changed to LICENSE.txt for version 2.20.1.
> Previous versions used COPYING.txt.
> 
> Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
> ---
>  package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
>  package/sdl2_ttf/sdl2_ttf.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Sorry for the long delay, but you had already sent this patch on
November 19, 2022 and it was applied on November 21, 2022, so it was
too late for a new version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
