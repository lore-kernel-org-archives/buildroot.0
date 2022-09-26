Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84052C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED533417B4;
	Mon, 26 Sep 2022 12:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED533417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0TxW-RyyDr4; Mon, 26 Sep 2022 12:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAB5B4179D;
	Mon, 26 Sep 2022 12:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB5B4179D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACBE91BF3F7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7731460F6F
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7731460F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKDarTHemJoG for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:03:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EF3E60DC6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EF3E60DC6
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:03:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E39C60007;
 Mon, 26 Sep 2022 12:02:57 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:02:56 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20220926140256.26d48e36@windsurf>
In-Reply-To: <20220926102707.1993827-1-titouanchristophe@gmail.com>
References: <20220926102707.1993827-1-titouanchristophe@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664193777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tslaI+KS4QqkjyZvwxP7mh8I4x0M/XEHkNOkBM2NoEc=;
 b=dKxDfj+KaB/RNW05Zvye3O+RnXtnYlOjj0nK/OA2ocIzoftsR/O//OSwG93f9zu2U5WcdU
 hErEDhlr1ZIIogrgxaDInTpKXsQiQzbk/Tv1yb8xEZecbyKPezSFaui6R6uO1MMQe1Qzxp
 deujBowUeH4keKnRij677YjOnvpPipSWi64UZ8N1f8V08jmx3o6gWDKjXdw9FLPmyYOwPk
 4aJ1RJNl9ySLgx0Yuob8DZ2eJf+SzlPGcKuIblUR27oJb/GeTvqIkeG4AaCL3zE17QWEFg
 W6wr8dQYrDvdnTUDnd6HDgUPl1nFAJlqn51ACeV2neaulGnctr5FhC9Ek1Qmaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dKxDfj+K
Subject: Re: [Buildroot] [PATCH 1/1] package/waf: Bump to v2.0.24
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Sep 2022 12:27:07 +0200
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  package/waf/waf.hash | 6 +++---
>  package/waf/waf.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
