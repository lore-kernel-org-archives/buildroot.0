Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A11FC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25116072A;
	Mon,  1 Aug 2022 17:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25116072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87nYKtmPu9fD; Mon,  1 Aug 2022 17:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1204B60803;
	Mon,  1 Aug 2022 17:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1204B60803
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FADF1BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34F6681B14
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F6681B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uF4HgrUspzM2 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:40:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97BC481B10
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97BC481B10
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:40:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 261431BF207;
 Mon,  1 Aug 2022 17:40:20 +0000 (UTC)
Date: Mon, 1 Aug 2022 19:40:18 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220801194018.067e4426@windsurf>
In-Reply-To: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659375621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJlXmxijdbfFWsog+bqfEukWjn4zLZ/FwKqGemAdlgc=;
 b=UXdALUUNgXGsOzWWC1SK5FcFfAqkL8+qYmXhDjLClk6NUR0ap1HCxypkXe1PX0dQwNWL/c
 SuDfPIBB1GSlAe8MVA+tBRmwx7xtXpTTIuP066xFHhHjycJAZjqmTCmiJDju+a76IkrERO
 6Aob/xqffplh+tWwY/lpxik/3iz0Ndrxz3Cp9uNqvn/PBIvigiWwTwj38bvpIGtE+Okdty
 XCzdJkPdCTiIJsyUcpvnlmkpOFQlcSSBMzpvZaYEVOPVKnQjoU6KZkEQX9Gxe73hUaCyQJ
 xsVwvmbqJOlSrh1RsWMbrB/bfgu5qMyAHRNT4ruj0NOR29Ca2Jr016vLyJTJ7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UXdALUUN
Subject: Re: [Buildroot] [PATCH v5 1/4] package/python-gast: new host-only
 package
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
Cc: jmfriedt@femto-st.fr, gwen@trabucayre.com,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 21:29:45 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Generated with scanpypi and converted to host.
> 
> It is a dependency of python-beniget and python-pythran.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/python-gast/python-gast.hash |  5 +++++
>  package/python-gast/python-gast.mk   | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/python-gast/python-gast.hash
>  create mode 100644 package/python-gast/python-gast.mk

Applied to master with an entry in the DEVELOPERS file pointing to
Guillaume, assuming he is willing to maintain this package. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
