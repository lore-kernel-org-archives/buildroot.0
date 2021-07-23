Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753F3C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 06:45:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF16060EAF
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 06:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF16060EAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7377460730;
	Fri, 23 Jul 2021 06:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLsLpmvdEX7m; Fri, 23 Jul 2021 06:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6FA4606D9;
	Fri, 23 Jul 2021 06:45:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34A8A1BF5E0
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 06:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23A2540613
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 06:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLmtnugbUp8x for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 06:45:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9657405E0
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 06:45:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B082CE0006;
 Fri, 23 Jul 2021 06:45:35 +0000 (UTC)
Date: Fri, 23 Jul 2021 08:45:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Edmundo Ferreira <fc.edmundo@gmail.com>
Message-ID: <20210723084534.5a480291@windsurf>
In-Reply-To: <CAFv936FFHCcDM3LWC=A+Dd8pv4LSEbJuEHiDLZ2R9NVwf4xOJQ@mail.gmail.com>
References: <20210608202434.10092-1-edmundo.ferreira@esa.int>
 <20210722230738.57510350@windsurf>
 <CAFv936FFHCcDM3LWC=A+Dd8pv4LSEbJuEHiDLZ2R9NVwf4xOJQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 31/35] package/x265: fixes SITE since
 upstream repo was moved
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thijs Vermeir <thijsvermeir@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Edmundo,

On Thu, 22 Jul 2021 23:52:05 +0200
Edmundo Ferreira <fc.edmundo@gmail.com> wrote:

> Sure I'll check for a version bump on the new URL.
> 
> Sorry for that. I didn't take into consideration the caching of the
> packages in sources.buildroot.com.
> 
> As for the hash being wrong that is strange since I have that patch and our
> gitlab pipelines are fine. Maybe I'm being victim of our own package cache.

Probably not, check carefully your logs: just like me, you're probably
falling back to sources.buildroot.net, because the hash in
package/x265/x265.hash doesn't watch what you are downloading from the
new location.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
