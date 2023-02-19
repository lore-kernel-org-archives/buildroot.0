Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8CEC636CC
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 20:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA12640B83;
	Sun, 19 Feb 2023 20:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA12640B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zjj3-iVn5K5i; Sun, 19 Feb 2023 20:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 206FC40B48;
	Sun, 19 Feb 2023 20:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 206FC40B48
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7B671BF2B6
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92C9640B48
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92C9640B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUMDLMNifEG7 for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 20:58:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67342405F5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67342405F5
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 20:58:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 60B3560003;
 Sun, 19 Feb 2023 20:58:04 +0000 (UTC)
Date: Sun, 19 Feb 2023 21:58:03 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20230219215803.1ad7ae5b@windsurf>
In-Reply-To: <20230218112449.1753677-1-buildroot@heine.tech>
References: <20230218112449.1753677-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676840284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGGchMx6tYSYbSiD4rEnwV68p9UReQGVDD+YP2Qgb70=;
 b=WZkrnK/XgRKc7V5cA3DD5fazS/4TE+FXn9GOu1+bMnB/uvS0VlHfTFwnu7YyTF5eUnHNoT
 sk3Wn3oqRiagiLg8TLu0TpLF/gIUmBD9PhGjh3OV6ZcQupPxOmfi/QJ5J9s3luocMRWsAf
 07hIwWTwSWcu5DCVaRMPvkX1DU51RIQGkIZfFrxSwBRNdFpolIlwiOMRZq6vKSmuAZyWfo
 VDKZpwA8iCr1i0eWesuc3m0jmJM3hePf5l8u6htSFl5n4JeyJ2xcilBfTyEmM5e+P9qlDf
 UgW1koD3hvY8KfGYWVYpPcZz8ZQ+8xqXbQpbiZDoSkYxgA/Bc26zh3DbdP+aVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WZkrnK/X
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.3.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 18 Feb 2023 12:24:45 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> raise the minimum gcc to 5 as stated in release notes for 3.1.0 [0].
> 
> [0] https://github.com/catchorg/Catch2/releases/tag/v3.1.0
> ---
>  package/catch2/Config.in   | 6 +++---
>  package/catch2/catch2.hash | 2 +-
>  package/catch2/catch2.mk   | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
