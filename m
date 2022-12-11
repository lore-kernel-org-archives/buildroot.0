Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119EBC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B85E4091F;
	Sun, 11 Dec 2022 10:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B85E4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LsDuoVDFYad; Sun, 11 Dec 2022 10:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C78CD4091E;
	Sun, 11 Dec 2022 10:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C78CD4091E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEDE31BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D73A81493
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D73A81493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATEVf9ruybU3 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:33:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DBD080BE7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DBD080BE7
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:33:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8DCDCE0006;
 Sun, 11 Dec 2022 10:33:04 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:33:03 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211113303.1ef77acc@windsurf>
In-Reply-To: <20221208212748.4132861-1-christian@paral.in>
References: <20221208212748.4132861-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670754784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3I6Beb+XDaV9NQ5qt0uoZAyex+wuhTmiRuKLEU5ehk=;
 b=Jj8F3yYvwRp3OAZXNXFCalBb1DtdIszd2LQPyIK1dk6iam8datyMJX/ZRaSlMrmuu9G82d
 DXfYmr0r4rxblk0vbMYSY3wfJF18ZlFF+Rkxaj6xC/xgH1ts0N9skHGDDPSLNf9b8LtiMW
 OMcheqotf/y2d/H6iG1d4NdqyXs4r8Ay5OdkdSGDrvj5ZlF07JJITPX0zoS/W0Bi97ebfe
 ijM9gr8T1m1Ctwp8k5RDgyOXMhll6AkVIn8jK50t4OEA7kOgoviveJNuu2J3NfKlupIoQC
 to1fCpvot7QHk3gAroQXwvC4WfVuZay0WtInTYFfXyziDoiY3vXq+VjpZ7DxRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jj8F3yYv
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: bump to version 1.7.2
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

On Thu,  8 Dec 2022 13:27:48 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Bugfixes:
> 
> https://github.com/containers/crun/releases/tag/1.7.2
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/crun/crun.hash | 2 +-
>  package/crun/crun.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
