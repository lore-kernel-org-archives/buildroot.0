Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4FEC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 02:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A39340983;
	Wed,  5 Oct 2022 02:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A39340983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tn9YIqYh734k; Wed,  5 Oct 2022 02:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9233D408E9;
	Wed,  5 Oct 2022 02:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9233D408E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E893D1BF39A
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 02:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAEE760B6C
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 02:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAEE760B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_vvQG28i6cz for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 02:08:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85EB560A68
Received: from wrqvxttq.outbound-mail.sendgrid.net
 (wrqvxttq.outbound-mail.sendgrid.net [149.72.167.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85EB560A68
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 02:08:18 +0000 (UTC)
Received: by filterdrecv-7fc4c76f6-ddpsg with SMTP id
 filterdrecv-7fc4c76f6-ddpsg-1-633CE710-D
 2022-10-05 02:08:16.471249318 +0000 UTC m=+620402.020333107
Received: from athaariq.my.id (unknown) by geopod-ismtpd-4-1 (SG) with ESMTP
 id WzTMuExzS1m6eyFi6kXw1g Wed, 05 Oct 2022 02:08:15.762 +0000 (UTC)
Received: from mail.athaariq.my.id (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by athaariq.my.id (Postfix) with ESMTPSA id 20126105D6C;
 Wed,  5 Oct 2022 09:01:47 +0700 (WIB)
MIME-Version: 1.0
Date: Wed, 05 Oct 2022 02:08:16 +0000 (UTC)
From: buildroot@athaariq.my.id
In-Reply-To: <20221002074028.GB30794@scaer>
References: <20221001020445.1458953-1-buildroot@athaariq.my.id>
 <20221001155615.GA30794@scaer>
 <84f6447a658a7c5c46852dc84fe5cb1a@athaariq.my.id>
 <8c42038a335a0122dee3365ce1940920@athaariq.my.id>
 <20221002074028.GB30794@scaer>
Message-ID: <cf37e96d9442808c7bb99e7956f9b568@athaariq.my.id>
X-Sender: buildroot@athaariq.my.id
X-SG-EID: =?us-ascii?Q?cuHA57UmN3h37Du2RZTUuZwgCKztG1NrS6GYeDL2RtYjpEOCzyIdbsfrTylYvC?=
 =?us-ascii?Q?wEvb2Cq9KMSdrx55PFCNrY1IsFbGTypkZZ+EBTa?=
 =?us-ascii?Q?l2y4OIe87oP0ogMCAXmmco0hPtAt89oDSYIavFF?=
 =?us-ascii?Q?420Gok7n4V28udLCxaL8h8ZJpSzu6sp9swoLdni?=
 =?us-ascii?Q?IqzrM8ITnANbdO41rBugkVzuMvQVR0+TFEhjuQt?=
 =?us-ascii?Q?7sRhTGXkZDLWNXiMU=3D?=
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Entity-ID: 8hTT1BSDhM31GKM3tJ7/LQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=athaariq.my.id; 
 h=mime-version:from:subject:in-reply-to:references:to:cc:content-type:
 content-transfer-encoding;
 s=s1; bh=GAduN3D39w4gJob8w8ZJLLP+IB6FSUjvCM8a/6jQq58=;
 b=i8HZPiP5EpegyJoiK7gJ46kmauNY6yrAOqLipcAl/BdS/8Un4HCCHrRdzkiMJasPgjKE
 +FFyzqtEBVrA6W2vyFgLucuoKlwHk/oTINSrNbDURDQI9WxubGoIm2HgqKYBshUPqyh/Na
 U3NY26N/VAJdn8Tf1yx8JKWVUdgDxeEZrUzU3ahMOFVYRuD2f86fPEOQtAilwg25AdWOG8
 v97klCCjhWITCalXScDgFhHcc6xa4necqlJOzQ96UWx9kxx2p+3l5AYoO7MtTsXIg+bZ9S
 JE+Gg4oYk6G5K6f87crQWX12Z/VUg6Fx6oblP4WcK5nrGH8JFZ9Gf2onVB0WMibQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=s1 header.b=i8HZPiP5
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: fix fsconfig_command
 redeclaration bug
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
Cc: Romain Naour <romain.naour@gmail.com>, Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Mr. Morin,

Sorry for late reply, I'm quite hectic last two days.

> You are not being weird, no worries.

Glad to know that :)

> Yes, we really need to understand why it is broken in the first place,
> to evaluate whether your patch is correct, or whether we should change
> the way we do things in Buildroot. Hint: I think we do something in
> Buildroot that is wrong (or has become wrong as time passed), but we
> could not pinpoint it yet...

Is there any other lines of code which manage sequence of installation?

> It is not specific to the raspberrypi, we have tons of builds failing 
> on
> various architectures:
>     http://url9588.athaariq.my.id/ls/click?upn=EfMvhF2HbzWlWvoxH9jeaTgpDdcbplGK5RDVND-2B6ZFK9hCQC2WiAEjIrhodLYz5eO-2BJO20BJqwrc4lATo1NRwg-3D-3DAfCw_beVnn4Jp-2FUb-2BbeVAiSjItHJusThyvkQasPabgmUJ334L25BZoBu4-2BDqB8GH-2F13lOIyetiMWNseqo8XOa2P3TgbwwX0LwZSnBEz551VXh7QULfJDj-2BMmFJXrbyG2bmzhV8tnlx3rXaFEqxj2D6HbUpMuG0fiGFL-2FTlxTNHZ4TVNFV5tYud8vJWgB1-2FYJ3uq8XZRKx59Sy9Ok2eRA5ZSeQGA-3D-3D

This is got more interesting, upstream also experienced this issue but 
successfully fixed. Reference: 
http://url9588.athaariq.my.id/ls/click?upn=HR0k-2FCRlAlnEsA1lGB1G4hmlzVyQPcieteZMXKJ8qcLkRdBj-2FX6cy8YNfcDO-2FLRPt1izGFD3NiimghABa-2BBrOA-3D-3DEonc_beVnn4Jp-2FUb-2BbeVAiSjItHJusThyvkQasPabgmUJ334L25BZoBu4-2BDqB8GH-2F13lOIyetiMWNseqo8XOa2P3TgUGGjpBpy7evZzxTQ-2FI8tVgqm-2FzsG5O1eQ19JFczEMINKm4yv0dmYFsigmPLPNlJAgpyI1rghWLAeFqItil1jhw2qQX4KoB2KCIMJQZAnSQj8i0z-2B7O3BI83-2B0Mx0bP1eQ-3D-3D

> But if you want to be added to that list, do not hesitate to send a
> patch against the DEVELOPERS file to add yourself.

I'm going to do that after bumped Raspberry Pi kernel and also fixed 
this issue. Because this issue causes buildroot fail to build. So I 
can't test it with *trully* default configuration.

For your information, I'm also attempting to add support for Orange Pi 
Zero 2 board as Buildroot got more popular here. Especially for smart 
bike development at campus.

> Erics are everywhere! :-)
> 
> Is that what you want to be adressed by, or should we go with Athaariq?

Haha Erics are everywhere even at my campus! What about Thor, is that 
also a common name?

Regards,
Athaariq "Thor" Ardhiansyah
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
