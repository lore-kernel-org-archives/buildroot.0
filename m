Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23A5C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80B0E817E4;
	Tue, 23 Aug 2022 20:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80B0E817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuE8pjjqHCU2; Tue, 23 Aug 2022 20:17:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C92981765;
	Tue, 23 Aug 2022 20:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C92981765
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DA521BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAEEE81765
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAEEE81765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGoH6B4t7EhD for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:17:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 853728175F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 853728175F
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:17:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2FF071C0007;
 Tue, 23 Aug 2022 20:17:53 +0000 (UTC)
Date: Tue, 23 Aug 2022 22:17:51 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220823221751.3d3b18dd@windsurf>
In-Reply-To: <20220821154901.327525-1-romain.naour@gmail.com>
References: <20220821154901.327525-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661285873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blNnOwj/lzJnl5+t2dLOZh+Jec9djToCVyCrTxAL0k0=;
 b=d6EoOP6Np2zsjh8V2ZmILFTbr3rPOLT6bZCg0D5uNVIn4VaMB1gkvcue3nSR6UwCprQkAu
 vtLXMvWRgqGitxqshtx13FNQOT1btIe19rhwRKlX5dhuWpl9tEVBhRvQgLY/StDPfDU8ny
 KXkAFFiydF5MN3uquxyibRss7VJ/0ySRCgbjbAJ15cVetd/aDW1LfqaEZ+nqo4JOSQrY1B
 SkDGd3iUSX6J7cbjNpO3sgBWQEEAE+iKixc3vCwk0tLspVLgTAESP4U5QWTGK7QDiUaF4S
 gWp+sO92qa7AhNc9DDarVrINvgD2rv0RJqBm9Kyf7QyPtNbUtBjhhjMQ9gHw0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d6EoOP6N
Subject: Re: [Buildroot] [for-next] package/poke: bump to version 1.4
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

On Sun, 21 Aug 2022 17:49:01 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> See:
> http://www.jemarch.net/poke-2.4-relnotes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/poke/poke.hash | 2 +-
>  package/poke/poke.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks. Sadly, I realized too late that there was a
typo in your commit title: you're not bumping to 1.4, but 2.4. Too
late, I had already pushed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
