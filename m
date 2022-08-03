Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357FCC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 08:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC68F81570;
	Wed,  3 Aug 2022 08:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC68F81570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhHLDp-BaNY0; Wed,  3 Aug 2022 08:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD22814C9;
	Wed,  3 Aug 2022 08:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD22814C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9063E1BF5DA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 08:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AB66814C9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 08:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AB66814C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNny_yo8OZY9 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 08:55:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1974881497
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1974881497
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 08:55:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D68D11C0007;
 Wed,  3 Aug 2022 08:55:49 +0000 (UTC)
Date: Wed, 3 Aug 2022 10:55:48 +0200
To: Kyle Harding via buildroot <buildroot@buildroot.org>
Message-ID: <20220803105548.114297a8@windsurf>
In-Reply-To: <20220803015159.1659573-1-kyle@balena.io>
References: <20220803015159.1659573-1-kyle@balena.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659516950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyD7cuhMVVXqz4I393sWn0DYx1rPbRc96yY+GShShSU=;
 b=eTvYwvOjNBrCy2HmnLz4LQPFX6zy3q+cmFL2AcRRWcA9bisy78Vtj4RqLzlVCUM384Unjm
 /vUpg7brNWZDgvP8nFQ+BgGAaAteJhZeLP45qTY6JZHUMP567oLkNGoEpjmm6tXpXZ3rW/
 0XbVFCRlnuIedIuq17NWmTkwSATNPdOhc52UI7Ek2aCR39E1Gt7Oa6eU0+QXUC2i9HtD45
 AVVBdiV5gk+CLc/S8rHkuXMHG4uitv76QacqKYM7hQvQjA8GH8NGnzqEKxj+Zsd9e6acA6
 M7ER/ug6g6FjBXKTy4faDnXfgQDt1H78HaR2/RZ95QDNBMmzFSiUNt3Sp0dBWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eTvYwvOj
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.16.2
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
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Aug 2022 21:51:59 -0400
Kyle Harding via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Kyle Harding <kyle@balena.io>
> ---
>  package/unbound/unbound.hash | 4 ++--
>  package/unbound/unbound.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
