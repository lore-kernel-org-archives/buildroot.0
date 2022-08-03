Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D76C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 07:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90B2C81801;
	Wed,  3 Aug 2022 07:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90B2C81801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8Sq7Pc4Ivbr; Wed,  3 Aug 2022 07:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1B698176E;
	Wed,  3 Aug 2022 07:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1B698176E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DCAF1BF4E5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 07:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAE164033F
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 07:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE164033F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ZMD3WTsatgz for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 07:35:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 465A440179
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 465A440179
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 07:35:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 351D81BF20B;
 Wed,  3 Aug 2022 07:35:05 +0000 (UTC)
Date: Wed, 3 Aug 2022 09:35:04 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220803093504.3ac15546@windsurf>
In-Reply-To: <20220802013359.96843-1-christian@paral.in>
References: <20220802013359.96843-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659512105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XVnKDRb/mgBdSonIgS/6dX0Rn36fnvSK6etiCkNZDw=;
 b=DgJGY76vZU8psnt3leuebTHk9fsMl5rstiBjh0EiJ6ChDkluBEPME+73cC5dQNI+6wCacK
 lbSY0DhNHxuo7tAWyIa0SwAgnml37msDIogZemlgIUtfk1rHRUUsGADvknSy0iTOpsBgrs
 qtIOq0WKJ6VOJ4NX0EzsJN+ICFH++R7z/5JYgHHHGy+/NaCpPSupBdldrhkppWVOXhe9Rq
 ZKRkCY00lQHB/6BOISY/nd+zsJc1cf9s63tcxNA555FftZLo87nGF2M7CUIn+fbiPS3ZcY
 APV9X8jW0D1V1gXwums3ErjThJdNBcCdESLZQSqpYy2IP0cJP7Cf0wgp9NTGvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DgJGY76v
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to 1.18.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Aug 2022 18:33:59 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> go1.18.4 includes security fixes to the compress/gzip, encoding/gob,
> encoding/xml, go/parser, io/fs, net/http, and path/filepath packages, as well as
> bug fixes to the compiler, the go command, the linker, the runtime, and the
> runtime/metrics package.
> 
> go1.18.5 includes security fixes to the encoding/gob and math/big packages, as
> well as bug fixes to the compiler, the go command, the runtime, and the testing
> package.
> 
> https://go.dev/doc/devel/release#go1.18.minor
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 4 ++--
>  package/go/go.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
