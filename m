Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9B6C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 22:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 640D4405C1;
	Fri, 25 Nov 2022 22:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 640D4405C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HaJcyL1mpfJ4; Fri, 25 Nov 2022 22:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 970B3401AE;
	Fri, 25 Nov 2022 22:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 970B3401AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 884571BF3D0
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 564FB401ED
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564FB401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gyxxjcpp-YUi for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 22:16:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 370E9401AE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 370E9401AE
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 22:16:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B418A40003;
 Fri, 25 Nov 2022 22:16:30 +0000 (UTC)
Date: Fri, 25 Nov 2022 23:16:29 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221125231629.42706ce0@windsurf>
In-Reply-To: <20221125140800.38511-1-neal.frager@amd.com>
References: <20221125140800.38511-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669414591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqZjjtfZE8qHA8KIjsxfzQCkvjDQmJLssrpJH634bds=;
 b=jw3ebSmxayp+bctRl++zs2cmifrkEL7CGUpL9y5mTrjOV9hQDLyuttsB4HZDAXQyXp85Dw
 J0a252IZ3SUCoYtMVewEFfm22x+wj/cl2aynr77lsS4Q0jp7B1QY2qtcD1imCdKgZsbEIV
 iM5zOI706daeeP6DxzIApyFZTPUQnKSQ55qZzdtFWLrmT8p1SfSVrp1fUD763GsyjLPGTR
 BTlZelBNqVW5QLk8GSkTa8FEv7suYdvqCvHNWoyqReY1xyCb4wtWayOy/cnYWCvokO4SV9
 Uhj/p20t9uzP9GL+wd21T9tLBgef75UbUxeHUlY0l6+Su2b9r2b7A6d/+8NumQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jw3ebSmx
Subject: Re: [Buildroot] [PATCH v7 1/2] package/versal-firmware: new package
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
Cc: michal.simek@amd.com, kris.chaplin@amd.com, terry.oneal@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Nov 2022 07:07:59 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch adds support for downloading versal microblaze firmware binaries.
> These are necessary for booting Xilinx versal devices.
> 
> The location of these binaries is temporary, and will soon be added to the
> Xilinx firmware repository.  The temporary location is using the same free
> distribution license as the Xilinx firmware repository.
> 
> Once these files are available on the Xilinx repository, this package will
> be updated to the new location.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

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
