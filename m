Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B29C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4299409B4;
	Tue,  2 Aug 2022 21:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4299409B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CeumK2n3rkEA; Tue,  2 Aug 2022 21:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7150340946;
	Tue,  2 Aug 2022 21:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7150340946
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E10F1BF28F
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26F23408E7
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26F23408E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4akkYsSFId8D for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 21:18:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AECDF402D1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AECDF402D1
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 21:18:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CFDD71BF203;
 Tue,  2 Aug 2022 21:18:34 +0000 (UTC)
Date: Tue, 2 Aug 2022 23:18:33 +0200
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220802231833.6617455e@windsurf>
In-Reply-To: <CADYdroNPVcCoHyPj7zsufP0JQiaXnYTsPNvze3CsSpW0fPT46w@mail.gmail.com>
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
 <20220801185444.0f41358e@windsurf>
 <CADYdroMZn_F88AN2qtVbr+54=eAgJ4+e+d2d3_ErcPggynyGzA@mail.gmail.com>
 <20220802104049.560f9001@windsurf>
 <CADYdroPfP0DZeHr3zEm052phSmi+iJFUomumySKgcU7JwWXJ4Q@mail.gmail.com>
 <20220802113926.11f5814a@windsurf>
 <CADYdroNPVcCoHyPj7zsufP0JQiaXnYTsPNvze3CsSpW0fPT46w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659475115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2QEG8kZ5rtUPtjjoh57L3PjFfXsKtwulpsn2sbX4Uk=;
 b=hWsU4gl2AOFu+yqBb5jWc9BT0V2LT0AjKjirLKpqIMJH+tCL9XHnjrpjCaz6fA8UzlNdR7
 UIgAr8HfafrAwAIQ+MhMx3Ww5HZ5Gi/1KVDf+spnYyXRimRHVhyBhDO1/8poAWv7dtxmTs
 6EaQ84xFagJL3em76NX20mN0lF7ZBM0uYVDNbKSSGKYNKJ0Q/puitvCoawL0bPWG3cj+oD
 uxZ41CfBQUEz0M7rgvqsitLcte+i7ednkxlGVJU5BVUiodZRnmq+1VOJtxV4kySx5dc5YP
 wGyRO8g6z7IILNwnn5Dd9soPYZXHenpxz+MethLNIYttF9uzu7zevxPAYdaotg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hWsU4gl2
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 2 Aug 2022 12:45:01 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> > Could you try if it does? If so, I think this is OK. We will see how
> > many other packages are affected. If only wipe is affected, fixing wipe
> > is fine. If too many packages are affected, we will have to think of a
> > different solution.  
> 
> Gives alot warnings, but yes, fixes the issue.

Will you send a patch?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
