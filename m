Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728F0C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED51181F54;
	Wed, 15 Feb 2023 21:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED51181F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fat_BW64IsuB; Wed, 15 Feb 2023 21:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E24B813D6;
	Wed, 15 Feb 2023 21:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E24B813D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 669561BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33B34607F5
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33B34607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmY2S59oxeIf for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F050160776
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F050160776
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:02:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AB80A1BF209;
 Wed, 15 Feb 2023 21:02:54 +0000 (UTC)
Date: Wed, 15 Feb 2023 22:02:53 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230215220253.7f688e55@windsurf>
In-Reply-To: <20230214105033.1042139-1-giulio.benetti@benettiengineering.com>
References: <20230214105033.1042139-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676494975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1iruZ8bVxhpJwkqjrIyzgBBuuMj6Y/Hn+Zb4Bltjhg0=;
 b=GWccgC6xDcO6H5l1O4i8wfP2bHXHh+oyvKaY2rVlZ8UDFqPWvTTPK2+B2cscV1Dlu7SoIx
 bklVk/NQuGmi3ZBiwt/32SJJWWMLrfTr8Ddl9A3oeZALVUyKNarTSGYNaZ9XjTzT6OJMqR
 MtPqgmYis6VbqtGQPI8/WNfo5bdzufWxQKU7MIzZq86IVIsTwDe0sWWH9CTd0cJ5uKDxRS
 q4LIIqz1V1vfiTMQjrbmVjyR42FwkZ7dXT2yuwFcmFxnzWb94qCn6wMupmo8MB7OoQ5alA
 LxhWpzgMGDilWPcEGacLDM7Jy0gB+ITf6fA35wCAfBDkPhvBLbNsFxRCg8OM5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GWccgC6x
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: disable package for
 s390x architecture
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Feb 2023 11:50:33 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
> package for this architecture.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3a74d393cdbc308eab9ec3f0f9e420947669a0ea/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8821cu/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Note: I have seen the discussion that Yann started, and I replied on
your other patch proposal. For now I have applied this patch as-is
because it fixes an autobuilder issue: it is the most obvious/immediate
fix we have.

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
