Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E551C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 13:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F6A843CF;
	Tue,  7 Jun 2022 13:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hi8xtLsrVRGI; Tue,  7 Jun 2022 13:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1C87842FF;
	Tue,  7 Jun 2022 13:12:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1882C1BF360
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 13:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04979842FF
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 13:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJlRJ0nzxpEt for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 13:12:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DAA58427F
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 13:12:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4EB742000C;
 Tue,  7 Jun 2022 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654607568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybA5JtdRXQt13kgeXh7aUgYqzTGkDrRN+lRu+btAxXc=;
 b=bpP0nFGzTbGRVz1WxflaLqnMYpWHiyJYvsIk00GJ1doetjcuG6A5ipeshRKE/AuH42QdUz
 YB991fMewz5wqDfjzjTazDoWy/Mn9lhlNVvYhyGmzQU/VZCLlNiTCfcM3SEY6yXMb27OhA
 hycnGBQJVXrjFD/08mTvEi3TzJRYvajaI909NJJkArvecziIrqI5TNbpZHLrSH9eRx2Z6q
 sIULm5fqqgyr5RyKtQObn+VRmSQy5VPMC2hggjkRkcpdvAa8B6kN314is+lmKwaOt2Yw2i
 YpMfHIMRsBDy8+H+6QfwHUkOAQX1UbYKtzhmE3Gcm4UvRw3O2SvYnEff2/yH0A==
Date: Tue, 7 Jun 2022 15:12:46 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220607151246.3f916b36@windsurf>
In-Reply-To: <CA+_SqVa+fn-_c6cEfeVZaDy7VYWw7zMY8Sy4kmG1jfcmMnt3RA@mail.gmail.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-2-angelo@amarulasolutions.com>
 <20220601212111.716a33cd@windsurf>
 <CA+_SqVacVxJkhC13fussgw9Pctmr8zrbc2DBs0m0+sqxNFfQZw@mail.gmail.com>
 <e3ffcc1c-518a-65f4-d713-2b31254238d8@mind.be>
 <CA+_SqVZiyKDxz=+0391_0jbdnE+Qt06NnT=i=n1e0zZiPN0G6g@mail.gmail.com>
 <20220607134803.630edcd7@windsurf>
 <CA+_SqVa+fn-_c6cEfeVZaDy7VYWw7zMY8Sy4kmG1jfcmMnt3RA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] package/wpa_supplicant: fixing "Invalid
 configuration line"
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
Cc: jagan@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 7 Jun 2022 14:16:19 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> > Then why do we provide an example configuration file? :-)
> 
> Is the one we provide really an example configuration file?  An example
> configuration file usually looks quite different!

Sorry I don't follow you. We provide and install
package/wpa_supplicant/wpa_supplicant.conf, which is an example
configuration.

Or perhaps your question was ironic/cynical, and I didn't get the joke?

> Indeed. It looks useless doing some configuration file mangling only to
> have it overwritten. We don't do that for other parameters, like autoscan
> for example, which in turn we should do following this logic.
> I think that the provided configuration file should work with provided
> default options, or we should consider all the optional values too, they
> are many more for wpa_supplicant. What happens if I configure EAP, or AP
> mode or the hotspot? Should we have "example" configuration sections
> enabled by those options?

I understand your point, and I agree it's difficult and probably too
complicated to have all the logic to adjust the example configuration
file to all possible sub-options of wpa_supplicant. We have to draw the
line somewhere and it's not very clear cut where to draw this line.

I just though a working wpa_cli / wpa_supplicant combo would be useful
to have as an out-of-the box experience when
BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE is enabled. I guess this was the
intention of the currently provided wpa_supplicant.conf.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
