Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B592DC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4916A40C32;
	Thu, 24 Nov 2022 21:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4916A40C32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2Xl6T0rt4fN; Thu, 24 Nov 2022 21:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 987504011F;
	Thu, 24 Nov 2022 21:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 987504011F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 984E21BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ABF941C22
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ABF941C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bo8ud2mUbB67 for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:36:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ECAE41BFB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ECAE41BFB
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:36:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4DA841C0005;
 Thu, 24 Nov 2022 21:36:12 +0000 (UTC)
Date: Thu, 24 Nov 2022 22:36:11 +0100
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20221124223611.034b11d6@windsurf>
In-Reply-To: <20221123093538.15211-1-yegorslists@googlemail.com>
References: <20221123093538.15211-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669325772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eske5rCsVBHNRmx8VTVr4oSZTp3tym6uUc83Uw/KIY=;
 b=nd9o7HaRx+xMWu5DguGUlPPFRENzhY2mK05TndVQTvhEzHJllB79XTdFYywFfobrkz5SmZ
 UvhBfWZY8eIGv+pc/tjUXrbnqD8t0RhqxbXe2QZ21+Q/D/Hib12s/l9qqS4DOR96fQLFUz
 xO0WEYgQjhTVgsqtLMLPIKj2f7TTpJj1SBQUIY8+rujBBBm82CmfEaglPy+VNLP1F03YGl
 /LAOfl45uWoK7ZCZspLMZ5HQpskjHIK9P69+B7roi1EXEfjO1rq5TGUc5Pnlqd+SAhFiCk
 jQmA+5RoP0NveSHKOvYwf/Th1SQVhD94j0ijgFsq1NYfsK41jd93cS/V3OadUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nd9o7HaR
Subject: Re: [Buildroot] [PATCH 1/2 branch/next] package/python-pyspnego:
 new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Nov 2022 10:35:37 +0100
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                            |  1 +
>  package/python-pyspnego/Config.in            |  8 ++++++++
>  package/python-pyspnego/python-pyspnego.hash |  6 ++++++
>  package/python-pyspnego/python-pyspnego.mk   | 14 ++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/python-pyspnego/Config.in
>  create mode 100644 package/python-pyspnego/python-pyspnego.hash
>  create mode 100644 package/python-pyspnego/python-pyspnego.mk

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
