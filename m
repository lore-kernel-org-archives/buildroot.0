Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F0BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 14:02:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C131C61076
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 14:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C131C61076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E49E403DC;
	Sun, 10 Oct 2021 14:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Br6dHfVpEHca; Sun, 10 Oct 2021 14:02:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97C3403CD;
	Sun, 10 Oct 2021 14:02:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE22F1BF403
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 14:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCF8D82A4E
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 14:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KI5_i0asZlZo for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 14:02:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F98A826C8
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 14:02:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 551BE240008;
 Sun, 10 Oct 2021 14:02:10 +0000 (UTC)
Date: Sun, 10 Oct 2021 16:02:09 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211010160209.0955a1b3@windsurf>
In-Reply-To: <CAPi7W83-ZeLBacug7pzX=hjGz14RQEo1r-EjqDPkQ2YEitN8RA@mail.gmail.com>
References: <20211009170242.486738-1-fontaine.fabrice@gmail.com>
 <20211009214659.30a58c90@windsurf>
 <CAPi7W83-ZeLBacug7pzX=hjGz14RQEo1r-EjqDPkQ2YEitN8RA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/transmission: fix build with
 autoconf >= 2.71
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 9 Oct 2021 23:01:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > I am rather confused, because I don't see any changes between autoconf
> > 2.70 and 2.71 that seem to explain this, and the message "ERROR:
> > 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work"  
> I assume that the culprit on autoconf side is:
> http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=b3b3af821a0b9e82ebe56b77b1731d2fe58f52de
> So build failure is raised since autoconf 2.70 and not 2.71.

Ah, indeed that seems more plausible.

BTW, do you understand this mess of gtkdocize and intltoolize, and the
reasoning behind the commit that you're pointing to?

> A bug has been opened on intltool but there is no upstream reaction:
> https://bugs.launchpad.net/intltool/+bug/1921816

Yeah, I've seen that. And there has been no release since 2015
apparently.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
