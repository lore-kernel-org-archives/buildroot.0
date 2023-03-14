Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3589BC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B018740902;
	Tue, 14 Mar 2023 08:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B018740902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAml-29FWUfo; Tue, 14 Mar 2023 08:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7BE7408A9;
	Tue, 14 Mar 2023 08:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7BE7408A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23FF11BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4FEC8140D
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4FEC8140D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4T9pJWdgld6 for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:43:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F5381413
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5F5381413
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:43:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 060DDC000B;
 Tue, 14 Mar 2023 08:43:03 +0000 (UTC)
Date: Tue, 14 Mar 2023 09:43:03 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230314094303.2e7dc5bd@windsurf>
In-Reply-To: <VI1P190MB049361B7F42628BA25F562D89FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB049361B7F42628BA25F562D89FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678783384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=celesXpeos9A0FWz1IRanrwC1zUjr383/6DK22EBJvo=;
 b=UTBEgLuf1cPqDoiqW5S7OofbdOEBv9AKCpwtDy/DYQiVNv9vC45xyEjPDeSm0WSe/SMH0d
 yKr+BwKHsXdgQYddPtVzajf3Huy221CYcIjpYWJExXeFAMWILvBsmIAhGkOFXNDgWL7QcB
 6SczYxlZgD2eZEym9a/jgXMrOC6fh3BrJ2Ps+rbI4lK1KP1fJxGW368HIzA8rD8JhUCtqT
 4NrArb8pBZuU9h3eyZeRJ4owbYM/Rd3udqq4+mGz5QDQs8fp1F+0xC31k4N11xWigCBk9N
 GygMwxicXupejsRjfAtWXd9qthf93oanSM69xB3cacg1LHXyGraeUkaJ1iaWfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UTBEgLuf
Subject: Re: [Buildroot] [PATCH v2 1/2] package/lzop: fix COPYING hash
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Mar 2023 08:08:26 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> The version bump in ce95217 forgot to update the hash of the license
> file.
> Changes include a new address for Free Software Foundation, Inc.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/c8a/c8ab973077067b2aa57e4f3ab51bd41ca1543d6f/
>  
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
> v1 -> v2:
> - Add Signed-off-by
> ---
>  package/lzop/lzop.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
