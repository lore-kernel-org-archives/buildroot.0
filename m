Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676A1C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 093AE40C65;
	Mon, 26 Sep 2022 12:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 093AE40C65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEU256NQ9A8S; Mon, 26 Sep 2022 12:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F9FF40C46;
	Mon, 26 Sep 2022 12:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F9FF40C46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA041BF3B0
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7198C40290
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7198C40290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPozmP0j9r_H for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:09:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B8BE40209
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B8BE40209
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:09:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2BED240005;
 Mon, 26 Sep 2022 12:09:06 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:09:06 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220926140906.6167d2e3@windsurf>
In-Reply-To: <20220924230826.283565-1-giulio.benetti@benettiengineering.com>
References: <20220924230826.283565-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664194147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ek1KkovSXpXnHE/QmNadSI3+GSnaOUXCz+rISmtgreg=;
 b=pIbvIyFsGrfcwLNnKqpZq+2tf9x9qsGWqTfN5nYk8RUEAKEPzuKRANFq2YR1zkIybFQWax
 zDb9bljWISlEJ4fThA0L+RC8xnLgP+cTUUbPQw2jcybd2DM4Gl+WvbooTdAIKOyrF5SH2+
 ozK7umBu0wP9sZI7evo1Nv+CE5f9d2VAMH7eW/Lf/pBKZI+H7dzLs8uAOlio8Xctlwl9fU
 UVlI+GJziIE42qpGSZIUNiOMOUT/F/eHqiuR7XwQgsCD+ghqbN76RDMjqz+Dhf1VWJmE/c
 pW6EnFyIgtsz0wcpuzOIdLpROAhnhCDIxSreF1XrATSZ5E2R7VN0WUV7ZGiJUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pIbvIyFs
Subject: Re: [Buildroot] [PATCH] package/collectd: work around gcc bug 68485
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Sep 2022 01:08:26 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> collectd is impacted by the microblaze-specific gcc bug #68485 [0].
> 
> As for all other impacted packages, force no optimisation when using a
> toolchain riddled with that bug.
> 
> Fixes:
>    http://autobuild.buildroot.net/results/6a8/6a87bbe17e6f606a97097800dc484a7b17bffa7d/
> 
> [0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/collectd/collectd.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

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
