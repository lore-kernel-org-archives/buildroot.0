Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF64FC636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 791004179B;
	Wed, 15 Feb 2023 21:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 791004179B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDKpiuEb1-eO; Wed, 15 Feb 2023 21:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8280A417A6;
	Wed, 15 Feb 2023 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8280A417A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 281511BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF67140278
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF67140278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blo9LcHc-udh for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:38:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E436402B3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E436402B3
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:38:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6EE9740009;
 Wed, 15 Feb 2023 21:38:34 +0000 (UTC)
Date: Wed, 15 Feb 2023 22:38:33 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230215223833.06e095ef@windsurf>
In-Reply-To: <20230213200604.2539630-1-yann.morin.1998@free.fr>
References: <20230213200604.2539630-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676497114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjhiu92WRQkswX1ue1xmzRqtofBKFx8gHOmpcGjRBmM=;
 b=ID+IyY/OwS/4lgyqiEIPOAERY8PVv42i0XQoruUaTFPaoNSxVt1DDhRPt7Omx5CRYhlQ0t
 83AOtSlsoKfSvpIfMyqiWSucVkElHbLD+TNOM/fTcyLqIdcdVkL07NZsLuDZYlk4yj9S5E
 qllCfGhy5WjHYXPjGV1Az6L8JO1Ujpsr9a7utrC0pOs4OMah0A8PzUiAFzdQU2b6nWJgh2
 GNMlwIkxOtlNRzhADOkzBi3Q9YdNvlAnj5zyBWEo8UoZR0rpkpssX0+q/7QELh5qCtO+DT
 77hO2BARMESquPBan8utNa4sm+XsKinLg+xIjiAk0zpuW7nze7qnLyEXaGztKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ID+IyY/O
Subject: Re: [Buildroot] [PATCH] package/flannel: use the github helper
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
Cc: Geoff Levand <geoff@infradead.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 Feb 2023 21:06:04 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Currently, flannel uses an ad-hoc github URL and a version-only tarball
> name, even though we already had the github helper (introduced in 2013)
> when flannel was introduced (in 2016).
> 
> Switch to the github helper, which allows us to get a properly named
> tarball.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Geoff Levand <geoff@infradead.org>
> ---
>  package/flannel/flannel.hash | 2 +-
>  package/flannel/flannel.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

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
