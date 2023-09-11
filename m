Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4EFC71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD98881ECD;
	Mon, 11 Sep 2023 19:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD98881ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDaOY_5Rcxby; Mon, 11 Sep 2023 19:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B65B81EC0;
	Mon, 11 Sep 2023 19:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B65B81EC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9FE1BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CCA94187D
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CCA94187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYoimASxFC9s for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:41:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 152FF4185B
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152FF4185B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44FFDFF80B;
 Mon, 11 Sep 2023 19:40:53 +0000 (UTC)
Date: Mon, 11 Sep 2023 21:40:51 +0200
To: Chris Packham <judge.packham@gmail.com>
Message-ID: <20230911214051.0da8179c@windsurf>
In-Reply-To: <20230911155225.0a63879f@windsurf>
References: <20230911085000.559230-1-judge.packham@gmail.com>
 <20230911155225.0a63879f@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694461271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVji5XveIzH61ZlDs6Zb8tEXeI5Q6hw5IV6le8fdOmc=;
 b=O/MqrcjYYDN/5kODV68o5WbnDVt5mVcODKJxH1hvx4eV75wl1nBZycZL1Zz4c+f2RhyK3z
 xA8i9SXfTz1IRCVDnofFuM05vW5oOf5581cTBhV1YWCiL19fo/XSbq64fccPgeojYaITSo
 8ZIrmg8O+XIryYj1876LSFsUCUd2r/grkBLdDJrrmQGH3YEmRC6u0daCl3TE/AfiOPKJE5
 vJlkH24kqyVueXB1rxNIOQIboRAKn6zPqv4KAGPWsOTPnPGRkvYzws/MVUuYPD6aYTV3lL
 CeACnP44uMa519b7UtYVBx7QPiboaGdAuY1ksr/k1Px3dnqHWj/8UpTndJ0y+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O/MqrcjY
Subject: Re: [Buildroot] [PATCH 1/2] syslog-ng: bump version to 4.3.1
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
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

On Mon, 11 Sep 2023 15:52:25 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> On Mon, 11 Sep 2023 20:49:59 +1200
> Chris Packham <judge.packham@gmail.com> wrote:
> 
> > Update to latest version. This includes a fix for CVE-2022-38725.  
> 
> So this is a security bump?

Actually, are you sure it is related to CVE-2022-38725. According to
https://nvd.nist.gov/vuln/detail/CVE-2022-38725, this CVE only affects
versions up to 3.38, and we're at 4.2.0. In addition,
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.3.1
does not mention "CVE" anywhere. Could you clarify this?

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
