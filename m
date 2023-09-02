Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D97C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D038405F9;
	Sat,  2 Sep 2023 15:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D038405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBHaKgPazTbp; Sat,  2 Sep 2023 15:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E466E40614;
	Sat,  2 Sep 2023 15:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E466E40614
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5D351BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E5364167A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E5364167A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEuF7QOcpHkz for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:59:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B4A641621
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B4A641621
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5615A1BF207;
 Sat,  2 Sep 2023 15:59:07 +0000 (UTC)
Date: Sat, 2 Sep 2023 17:59:06 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230902175906.42a66542@windsurf>
In-Reply-To: <20230827194003.3387773-2-james.hilliard1@gmail.com>
References: <20230827194003.3387773-1-james.hilliard1@gmail.com>
 <20230827194003.3387773-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693670347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldyaVYbLpwXdsyi4prLbWLSJxZcMxPcRKSb0u2RtGfI=;
 b=grwOBXgnMBM164GnPrNpmGs9lEYjzgYP0sWcxASDVcacnKRXjzGO8rPzxKcJAKQVDi0jnV
 6RFaKBLl+zm3X9ruFAtiQeiMMJqSScU1jXVm9gPj4gyj9UdIcO00CopxyHMS7AZKlOET2v
 ddNEk05TjQH8h4NdL8Qc92xzE2rwd9yH3AMtXwgFzVvXPg5TxGChClqNZE7D6wp35gXN4B
 Ce4p87hZrTbM/IWHC5GWUxAzQFuWBLbOZDMo4XPi/T3r+FMs9Vh666PRrZRhUxTP8l7DgX
 8vtbqFftVAFwtYnBm69zoKDnWho8+AevO9W373IQLMvSp5adSE7BFxBH8XWRig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=grwOBXgn
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: add host-python-distlib
 dependency
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
Cc: Romain Naour <romain.naour@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 27 Aug 2023 13:40:03 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The qemu documentation recommends depending on this package.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/qemu/qemu.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to next with a slightly extended commit message. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
