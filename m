Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F8C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 17:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E246828A9;
	Wed, 27 Jul 2022 17:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E246828A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltcsggQ2_t_T; Wed, 27 Jul 2022 17:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A7C827AF;
	Wed, 27 Jul 2022 17:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A7C827AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0221BF9B4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 17:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 260DE405D2
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 17:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 260DE405D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3a-FIhYtkjK for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 17:42:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94FDD400F2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94FDD400F2
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 17:42:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8FF6940004;
 Wed, 27 Jul 2022 17:42:13 +0000 (UTC)
Date: Wed, 27 Jul 2022 19:42:12 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220727194212.15785a79@windsurf>
In-Reply-To: <20220727164057.GG1134587@scaer>
References: <20220727104751.2505442-1-thomas.petazzoni@bootlin.com>
 <20220727164057.GG1134587@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658943734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSwQwvnRnqO5k1Eu3VOSSnjGgm9/XDzLH3I6jGFBNec=;
 b=h9LpUlT9G48HLiwbYUJyUtnIxRqUrdybF0wXRaQznrcXiVzITNEDJbfSD8vp1aSxJ6bOWE
 Q9xwpfVU/E+wQOWrTCUuwvXLLElm1h9jgW8dRgu0szh6T/CdK0sEP7xePW07yqoQh7Ddey
 5RYYwv4TJYYlceRPStBUU+9eUXS4kJdlf1O1LlCXNYOznG1798HL/MYa7qMNaGN3mqtAev
 JGQjphbitKsJ7wsYIunB85bv7JiIczUkbfLHyxYTfhpTxegpjceNCmEbz0N1NZQDLvGPkH
 p5XfnQUhSoa2EJ2QMKfQjwy82dR6Qkx2kvPVqTaiGgkKNs9ST4cqFa6eaN6O3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h9LpUlT9
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-rpath: send
 readelf error output to oblivion
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 18:40:57 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > Of course, it would be nicer to only filter out those warnings, but
> > filtering the error output without merging the error output into the
> > standard output is tricky, so let's keep things simple. If there is
> > really an error, readelf will abort.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> Applied to master, thanks.

Thanks! I must say I was kind of hoping you would come up with a way of
keeping the errors displayed, while filtering the warnings :-)

But another issue in this script is that it doesn't have set -o
pipefail, so if readelf fails, because the output is piped into another
process, the script will not bork. Perhaps something to fix ;-) (hint hint!)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
