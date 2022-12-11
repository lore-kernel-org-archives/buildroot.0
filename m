Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B58C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 889D940441;
	Sun, 11 Dec 2022 10:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 889D940441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPFdP0ZpPXf1; Sun, 11 Dec 2022 10:32:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA8D3403A7;
	Sun, 11 Dec 2022 10:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA8D3403A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 867711BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EDC340441
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EDC340441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEwsrsBBF41Z for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:32:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58651403A7
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58651403A7
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:32:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 646AE240002;
 Sun, 11 Dec 2022 10:32:31 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:32:30 +0100
To: Stephan Henningsen <stephan@asklandd.dk>
Message-ID: <20221211113230.6da216db@windsurf>
In-Reply-To: <M6CLMR.WAXSW1IX7UPU3@asklandd.dk>
References: <M6CLMR.WAXSW1IX7UPU3@asklandd.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670754751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5aVt0AEZ3ynKGertzbCiniKWXp4rYohjesUvwQhsMk=;
 b=NuEqzBBLBUIVtYfJ1UO/i1VbaigAfZJ5ywZNLnmqmwA+zaq1tqC/LfBo63iNvIT4w4UTXM
 CDgXa9HYcRZ1Rg3HmskHvQqDbE5MZF11D3/9DOml/0yEIPDk0FEUeGu5JwhBaOT3eZgOaG
 4Y3AxTPYEpNntc2AnRW6xWLv5n0f3W6ZWBkdvi0B2kKdyKyS/iMymfUNJLm8LXaktHYgXp
 NwvORy2P8Q2dumG3M8FfKrgMpOXB59cRgsCAI4bKnYL08U1QPGieyjdpUSJy19urSO8EpQ
 Z/t/yXo6WcLRWcjn8Li5gWRGP+Xwl5azgTCVpFhcwVkOnYPfGORm+t94MFnZUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NuEqzBBL
Subject: Re: [Buildroot] linux-firmware-add-intel-6e.patch
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stephan,

On Thu, 08 Dec 2022 22:11:10 +0100
Stephan Henningsen <stephan@asklandd.dk> wrote:

> Config.in: add option for installing firmware files for Intel 6/6E 
> devices
> linux-firmware.mk: add target for installing firmware files for Intel 
> 6/6E devices
> 
> Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>

Here again, your patch appears badly damaged on the mailing list,
please use git send-email.

Nevertheless, I applied it manually, and did:

  https://gitlab.com/buildroot.org/buildroot/-/commit/b55dfdb286ddb7fb4f35c20b731a4c93bd3ff201

It would be great if you could fix your patch submission tooling for
the next contributions, in order to make them easier to review/apply.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
