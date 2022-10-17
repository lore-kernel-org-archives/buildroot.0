Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B04C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 12:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C17160D4E;
	Mon, 17 Oct 2022 12:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C17160D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQj-_yiLjiqo; Mon, 17 Oct 2022 12:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82B8060C22;
	Mon, 17 Oct 2022 12:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82B8060C22
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A83EC1BF3DE
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 12:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91791405BE
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 12:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91791405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OT56LDGu5IEA for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 12:21:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A58B405CD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A58B405CD
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 12:21:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F197020017;
 Mon, 17 Oct 2022 12:21:10 +0000 (UTC)
Date: Mon, 17 Oct 2022 14:21:09 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221017142109.424863e1@windsurf>
In-Reply-To: <CADvTj4qT7BZY4QhkC0A=LFQ5x2fgWBAdECaAGFxu5VUE=ukgxw@mail.gmail.com>
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
 <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
 <20221016075056.GI2503@scaer>
 <CADvTj4rBi3uu2bXJy=Tp76NV6Yjk7--EtDOm0kmxi47XOVsQ=Q@mail.gmail.com>
 <20221016160505.GK2503@scaer>
 <CADvTj4q+ztJca7+MEcOK5-gd94155C0X1s0_5-SvCxp=XXOptg@mail.gmail.com>
 <20221017091644.1104527b@windsurf>
 <CADvTj4qT7BZY4QhkC0A=LFQ5x2fgWBAdECaAGFxu5VUE=ukgxw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666009272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCVviit4mUtRxOt67MiwUfCJebNsMOIrTw513/jJzFg=;
 b=cDBQUYfz2neJmH2uu6qXeRogEmdNTmmziYPomR6Gx46iHkfCXuqq9YldMVaXwu0qFbBOv5
 OKzQ7KWa3iFKYgfim39FUj0Db4NprPv/b5aumxcYeoGmjUZ0V29/F36ZocaoIk474dpDrH
 hyGo5gId3Yj2Hlfa6sW8z/dPmeqiwSIscgVaVw7/jQO5E6PlKX72IUyvhiqw8h1MmzHAb5
 KxPrwKZcUCGTaNDAZcIyyG/Nj9XAzQKqZE/5ksO3q77jTHrJ1N/I6AglfuL/yMiIcVhkQ+
 1zeMGUTjgATJ5QNbVptqnLotnEzUrtTLCO+d3ZCeVELjyR2wvwRk1f5jx1V3bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cDBQUYfz
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Oct 2022 07:29:52 -0400
James Hilliard <james.hilliard1@gmail.com> wrote:

> The shuffle=random changes don't require modifying autobuild-run, I'm
> just tweaking the path to make in my autobuild service environment and
> then passing an additional config flag to autobuild-run like this:
> --make-opts="--shuffle=random"

Right, but my point stands: it's custom usage/configuration of
autobuild-run that we would prefer to discuss on the mailing list first
before deploying/enabling.

> Well builds were mostly failing in the same place due to deterministic
> build ordering, I was trying to make it so that we would see failures
> in different places as that's more useful compared with always seeing
> the same errors.
> 
> To me seeing the same errors most of the time indicates there's some
> major coverage issues with the autobuilders which need fixing.

I think you're missing a point here: many of the builds today are
failing due to the glibc 2.36 bump. So pretty much every single build
that is glibc based will indeed fail with some error related to this
glibc bump.

Your additional randomization will not change anything to this. It's
just that we now have the glibc bump issues + the newly discovered
issues related to the extra randomization + the usual amount of build
issues.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
