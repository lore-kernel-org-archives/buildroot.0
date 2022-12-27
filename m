Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32B1C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E97181431;
	Tue, 27 Dec 2022 21:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E97181431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJAb7xbbfU44; Tue, 27 Dec 2022 21:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE2A38142F;
	Tue, 27 Dec 2022 21:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE2A38142F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3632A1BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11CF98142F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11CF98142F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwlzrqAiDj_2 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:32:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D58CA8142E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D58CA8142E
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:32:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC8E61BF205;
 Tue, 27 Dec 2022 21:32:39 +0000 (UTC)
Date: Tue, 27 Dec 2022 22:32:38 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221227223238.6f31e803@windsurf>
In-Reply-To: <20221223173818.51581-1-fontaine.fabrice@gmail.com>
References: <20221223173818.51581-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672176760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcD+uukE20dwE6NdFncT9KIpMO30YoyA29h6bEvRAlI=;
 b=GERNj/pTzqJTE+MrZSY1bbVqOa6HF4jhGfONfJ6FZ0ATFLYqVS1JMY+9OfDGTbFSpw3dcg
 z0BDLs1c2LDxBN7v7Tq8NhJ0Z9U5z3uZ0xqNB66ulDDATg5kiCFKfGl81CrWbb5PCWlQun
 J51ZXYz3FUHe3FW8D6KPTP6M9A5Grl+6YszL5/haO2Sq/+NGQ0S3dwBO2hJdeMb9A5hAAk
 k54rRSJh1fPrPTAiDiV9I9q9+avAyPwjaq/mZqFalOMrmkmlll9KK3ywAMeeUquw1C8Q/0
 l4N9P6tCajkVYpPJI+Q4+QAyvkg5I0YnMrybhpRp2rLfrhbl7Lq4RtcJhkOmRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GERNj/pT
Subject: Re: [Buildroot] [PATCH 1/2] package/upx: bump to version 4.0.1
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Dec 2022 18:38:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - cmake must be used since
>   https://github.com/upx/upx/commit/c7d8b6fed1b551158540e1d2e884dc224fce474c
> - ucl and zlib are directly included in upx since
>   https://github.com/upx/upx/commit/61e1366122f8d1b9e2434a8103e7af00a35ea902
> 
> https://github.com/upx/upx/blob/v4.0.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ck-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch | 80 -------------------
>  package/upx/upx.hash                          |  2 +-
>  package/upx/upx.mk                            | 22 +----
>  3 files changed, 4 insertions(+), 100 deletions(-)
>  delete mode 100644 package/upx/0001-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
