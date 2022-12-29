Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E883C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE88C40317;
	Thu, 29 Dec 2022 09:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE88C40317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvkFltDp_xpw; Thu, 29 Dec 2022 09:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C08CC402EF;
	Thu, 29 Dec 2022 09:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08CC402EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 735921BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D88A402EF
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D88A402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srUNGA9l1bRI for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:29:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC375402EC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC375402EC
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:29:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E9031C0009;
 Thu, 29 Dec 2022 09:29:55 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:29:54 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20221229102954.2785314e@windsurf>
In-Reply-To: <20221219213343.26475-1-ps.report@gmx.net>
References: <20221219213343.26475-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672306195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdrJyutcRibK9FfJahk1Hdsg1xH52bG3X5M9wpsdlwo=;
 b=JBCF2wlHQBl31YIG3A6YuuXge31/HF0ZIvc6z01GZgt1kk6Ck6veC9T6R9BXix2iYF8SwL
 YT+CC2qB2nd+F7jqmEmRRbZWzSuqGnTZSxNOe7AFgWeCNQ6ADe8tj0kRP7QgirQZEhrg2h
 YYJ4M9NOcBBgyqfDRO5EZ6akQqkMwhKMmAXn/zZcewJS8rXgjl92GR+ydnwGUy8rgJEq/Q
 ro0Aor0mI+EXPNS577eBlTZNYKjeBBq62b8MoblwVAQ/Ixa4oOlnU5RCCdhbvv4uoahITp
 87OOZ/THTNXdXL7XRoDqwM6eKp1wKSilL1BispzaQJdkXrg9E8S07thhtxhQvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JBCF2wlH
Subject: Re: [Buildroot] [PATCH v1] package/perl-image-exiftool: new package
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

Hello Peter,

On Mon, 19 Dec 2022 22:33:43 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/Config.in                                  |  1 +
>  package/perl-image-exiftool/Config.in              |  8 ++++++++
>  .../perl-image-exiftool/perl-image-exiftool.hash   |  6 ++++++
>  package/perl-image-exiftool/perl-image-exiftool.mk | 14 ++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/perl-image-exiftool/Config.in
>  create mode 100644 package/perl-image-exiftool/perl-image-exiftool.hash
>  create mode 100644 package/perl-image-exiftool/perl-image-exiftool.mk

I've applied to master, but then later realized that you had not added
an entry in the DEVELOPERS file for this package. And you actually
dropped your entire DEVELOPERS entry a few months ago.

So what do we do? You submit new packages, but you're not ready to
maintain them? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
