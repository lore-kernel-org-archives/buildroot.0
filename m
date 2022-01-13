Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79285C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D9A740148;
	Thu, 13 Jan 2022 19:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llHEzMNr2KIk; Thu, 13 Jan 2022 19:57:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D96F400E4;
	Thu, 13 Jan 2022 19:57:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C19C1BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 248ED41634
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-Ua1nItgjQl for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:57:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08EBA415CD
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:57:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9BCF760004;
 Thu, 13 Jan 2022 19:57:34 +0000 (UTC)
Date: Thu, 13 Jan 2022 20:57:33 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220113205733.270b84f0@windsurf>
In-Reply-To: <CAPi7W80QXfaA5iTk5e2_deLChHSTPp8dO1rrhsuLE9ouJ5+cvw@mail.gmail.com>
References: <20220104204126.3631293-1-fontaine.fabrice@gmail.com>
 <db9bca01-8c19-1e3a-309a-32201e7bc76c@mind.be>
 <CAPi7W80QXfaA5iTk5e2_deLChHSTPp8dO1rrhsuLE9ouJ5+cvw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: add avahi optional
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 10 Jan 2022 08:45:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > > +GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi)  
> >
> >   In the commit message you talk about avahi-client, but here it's avahi-daemon.
> > That looks a bit weird... Can you explain?  
>  avahi-client needs avahi-daemon and dbus but perhaps we should add a
> BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT hidden option.

I suppose you will rework this patch with the new avahi hidden option
that you have added? I'll mark this particular patch as Changes
Requested.

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
