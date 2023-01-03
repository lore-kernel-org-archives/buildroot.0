Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00775C3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 08:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63EEA81754;
	Tue,  3 Jan 2023 08:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63EEA81754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doyaI0YthF9P; Tue,  3 Jan 2023 08:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2578815CD;
	Tue,  3 Jan 2023 08:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2578815CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC811BF2CA
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 08:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E823E40503
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 08:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E823E40503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZpc7OvT0MFW for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 08:21:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C08A3404D0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C08A3404D0
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 08:21:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50D802000A;
 Tue,  3 Jan 2023 08:21:35 +0000 (UTC)
Date: Tue, 3 Jan 2023 09:21:33 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230103092133.3d88a870@windsurf>
In-Reply-To: <40df416d-7db3-4053-28ea-a98316551069@benettiengineering.com>
References: <CB65BA13-5218-4C00-86E0-CB128E71F322@benettiengineering.com>
 <BCF6BFBB-EE5A-43FA-B64A-E2513A4A3BCF@benettiengineering.com>
 <20221231142342.1189ede4@windsurf>
 <40df416d-7db3-4053-28ea-a98316551069@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672734095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kGoYKXkp4xKqQRbsJ67eoRKG2m9bF/2fmaC2AS2X0us=;
 b=iXrujf/+aT+q+30XiAQ1N3AgxlelOUU16TTrs/46tFn4TEygscc0TDFyKyNIu+kTSWRxN9
 WC8pLzkFwdk0QGN5TSoP/lWTpQYgbekgdlLZRk1kVR/j0OmJZG7H5FN69VuSN/Wx0ESOiM
 2MOahxd+ADvTeuTH7KFKvU425YGDONGn5cX19L5J6hBlualkBpnghc/l27XRuKRjIDNOqb
 ety4Exk3OxakMqRM1wmq1E9MCifWmerYM3TbfszZkNATJpTIjWNAzrRq5mRSp4eH6WQkCo
 Q8MEx/uobvErC6X+excTJAgUJCZYHwZPLwCenBQb5o2yoNA8T3Y8M2S51nP7BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iXrujf/+
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
Cc: Kris Bahnsen <kris@embeddedts.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 31 Dec 2022 18:51:34 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Open a pull request.  
> 
> Do you mean once they create a branch for 6.1?
> Or even against 5.15, 5.10 etc. if there are changes that regard those
> versions?
> 
> Sorry but it's not clear to me what you mean.

You have a point. Indeed, until they start moving to 6.1, there's not
much you can do :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
