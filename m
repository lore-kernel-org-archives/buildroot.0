Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413C5CD495D
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 06:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAE7440474;
	Thu, 21 Sep 2023 06:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAE7440474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wWB70MGSs0F; Thu, 21 Sep 2023 06:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A4F1402E0;
	Thu, 21 Sep 2023 06:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A4F1402E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0001BF990
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 06:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55F62402E0
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 06:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55F62402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enXiDndNYRpd for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 06:45:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25593400AB
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 06:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25593400AB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12A4E240006;
 Thu, 21 Sep 2023 06:44:58 +0000 (UTC)
Date: Thu, 21 Sep 2023 08:44:58 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230921084458.1aff7ce8@windsurf>
In-Reply-To: <80570176-70c3-4eae-9df6-54242820b8e8@gmx.at>
References: <20230920043113.36674-2-dalang@gmx.at>
 <20230920091208.62a8b2fb@windsurf> <20230920173434.GE512384@scaer>
 <80570176-70c3-4eae-9df6-54242820b8e8@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695278699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UADGl39RbHxrEkgiUu+hSurzvpn80lOS2DrKUt4ydIo=;
 b=gnQd6G45wxNgxYEMgJxx8OEOwwCrVZU1HhQM/qell3kt3PTJSiQhL8v7J9N9k56Hj846dA
 Lp5CvUsPshBCIcB+CAHkcz8gF6XXkPY9axK8XX0lofNRfHQ8OKXaCAeYF1BpzpvdhMiAVd
 2QWVT/wXUIOfx0XmhMcwwHo1RzhWI8m0ln8fzpLslnfD4v/cDddoJOsXmNqjnCIuYHNWl5
 tgjzifZ3VUcFRIkCrmLqzVI97EGqrgplxH0u0Vj0Es05T0lmhb/H1H9K8RM9VHK73qn3WT
 xr/LgRTS5eF02bVWuCOyGUzix4pcABw8L/O6uecaLOQqyaEl4fzFSeEIXpwT/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gnQd6G45
Subject: Re: [Buildroot] [PATCH v2] package/bind: drop CVE-2017-3139 from
 IGNORE_CVES
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Sep 2023 06:09:38 +0200
Daniel Lang <dalang@gmx.at> wrote:

> Not sure pkg-stats would be the right place as, at least in my uses of it,
> I simply expect it to collect information and present it to me.
> Just like it doesn't flag outdated packages, I wouldn't expect it to flag
> mismatched CVEs or outdated CPEs for that matter.

I'm not sure to follow you here. pkg-stats is a general tool to help
with package maintenance. It provides things like the number of
check-package warnings, the number of patches, the list of CVEs
affecting the package, so it's a perfect fit to also list the CVEs
ignored but not affecting the package.

> I haven't looked at check-package closely, but the actual checking should
> be doable.
> The problem that I see is NVD's new API, because the initial download of
> all CVEs now takes ~30 minutes or so. Seeing as check-package is run on
> Gitlab CI for every push, the database needs to somehow be kept between
> runs to avoid re-downloading everything.

I don't think putting this logic in check-package is reasonable. There
is nothing CVE related in check-package right, and like you point out,
the fact that it needs the CVE database is a big change that is going
to be annoying.

I maintain my position that this should be done in pkg-stats, where we
already do all the CVE matching dance, as it's a simple addition to
pkg-stats.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
