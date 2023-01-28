Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D590C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B01CB408B7;
	Sat, 28 Jan 2023 21:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B01CB408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kxm_SkhPX0BA; Sat, 28 Jan 2023 21:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 060D9404B9;
	Sat, 28 Jan 2023 21:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 060D9404B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 293221BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F36FE815CD
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F36FE815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7W3QGWKnWMu for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:51:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C65008148E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C65008148E
 for <buildroot@busybox.net>; Sat, 28 Jan 2023 21:51:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F1B5C240002;
 Sat, 28 Jan 2023 21:51:39 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:51:39 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230128225139.1186fb1b@windsurf>
In-Reply-To: <20230127201958.7309-1-francois.perrad@gadz.org>
References: <20230127201958.7309-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674942700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3h1KED5JxQTtu6zEFtcTRd2qJKBDYKwHzWE69gFtwk=;
 b=gQFArEGTVZtAoDzlh5QvSdBsHa5kqjn+uw3j8ICdKtmyJVuUIRK+L3UBWQPlhDOv/hkEWl
 SYCJkrnykkE9cbWfFGSo0IgVE59gGo7m8LeW4aR1zi35KCy+jI9o/bhrfh+lbpVpOHsjyl
 tjc8tSCpmn45XkUceObHcxC3TPcPFUZbVUlOd/SkEBvHlsmFIzCEZOtLQvkXcPJvXCxnh7
 VHCJeBRTyK5pyNmyd/PR/zWyW4/nxyqdgS7u1tl9cFpd5uoz0eRhHqQwOddpvfwaEMmGzn
 JC+L2AWb7SKq+ab6Rq/Hi2Ej46eChypSZgowSdVEi3pDp+ZQpOrv0/XGB88raQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gQFArEGT
Subject: Re: [Buildroot] [PATCH] package/lualogging: bump to version 1.8.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 Jan 2023 21:19:58 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> diff COPYRIGHT:
> -Copyright (c) 2004-2022 Kepler Project.
> +Copyright (c) 2004-2010 Kepler Project, 2011-2013 Neopallium, 2020-2023 Thijs Schreijer
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lualogging/lualogging.hash | 4 ++--
>  package/lualogging/lualogging.mk   | 2 +-
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
