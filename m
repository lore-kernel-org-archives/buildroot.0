Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6C5C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1731A4181F;
	Wed, 30 Aug 2023 21:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1731A4181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xvz0qqgpSocs; Wed, 30 Aug 2023 21:58:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 492F44184C;
	Wed, 30 Aug 2023 21:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 492F44184C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4BFA1BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7125682FA5
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7125682FA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2q1fwAK_wQf for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:58:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36CD482F99
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36CD482F99
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4618FF802;
 Wed, 30 Aug 2023 21:58:04 +0000 (UTC)
Date: Wed, 30 Aug 2023 23:58:03 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230830235803.2de7c788@windsurf>
In-Reply-To: <20230830155926.2831345-1-aduskett@gmail.com>
References: <20230830155926.2831345-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693432685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDx0L5Okk3+xvKHrakVIzsuJh3GjX9FFvm0NNEb2Src=;
 b=I+Os3cLRJVbtcBzHc19f8MLQWMsNxskMI8QYDGQo7FO8BdWRq9mZaXe9f9DAfRBfL/A3w2
 AEC4a6BJ5H9vSGColmHawf3KigZgRTI7jI4wD4XcbpdVI7aGqxtE+LrMuriGMN8ysP33Tw
 Qh27+DFBUVoLMrjQGi2quP3w7G/+a92VoVPhw1UzwqgN6sUo8uTKq1XbzkmF5aIuV8jJwa
 gq3LUyPzZqslmhHZ/VCnNIonibJa09oeQmr97v04uHims+NREKaTbh2IWRKluIEjqTgM3k
 uaXojWLsYguGtgP24hFzjsO6N9rLvqR8W7yMN97kKiz4u0RYSMxXx3pQ31xwug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I+Os3cLR
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: security bump
 versions to 11.0.20+8 and 17.0.8+7
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
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Wed, 30 Aug 2023 09:59:26 -0600
Adam Duskett <aduskett@gmail.com> wrote:

> Fixed the following security issues:
> 
> * CVEs
>   - CVE-2023-22006
>   - CVE-2023-22036
>   - CVE-2023-22041
>   - CVE-2023-22044
>   - CVE-2023-22045
>   - CVE-2023-22049
>   - CVE-2023-25193

One thing that bothers me is that none of these CVEs were identified by our pkg-stats script:

  http://autobuild.buildroot.net/stats/master.html

https://nvd.nist.gov/vuln/detail/CVE-2023-25193 is reported against
harfbuzz, not openjdk. Are we using a vendored version of harfbuzz in
openjdk?

Could you check the other CVEs and figure out why pkg-stats doesn't find them?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
