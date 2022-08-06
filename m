Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732CC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 13:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 521E560F53;
	Sat,  6 Aug 2022 13:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 521E560F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2BsyyXvBI2o; Sat,  6 Aug 2022 13:45:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E7F60B54;
	Sat,  6 Aug 2022 13:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E7F60B54
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B51681BF2B5
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 13:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D8C660B54
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 13:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D8C660B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-FdK2iqht5j for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 13:45:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A01C60B52
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A01C60B52
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 13:45:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0CFB8240009;
 Sat,  6 Aug 2022 13:45:14 +0000 (UTC)
Date: Sat, 6 Aug 2022 15:45:13 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220806154513.221975be@windsurf>
In-Reply-To: <20220805162906.GC3621445@scaer>
References: <20220804203555.29029-1-thomas.petazzoni@bootlin.com>
 <20220804203555.29029-2-thomas.petazzoni@bootlin.com>
 <20220805162906.GC3621445@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659793515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdcL9Bt52ATK2lNMOs7lq7z4xvKeMtukqFvpnvdvuwQ=;
 b=Fs6ucCYI0Sr/J3n1e3Vr46ZUxXBC+VpG0b2FntUrNk2fxSaodOcT1iAd1Pw6mDZfv9g1wO
 sWOCdDf3YsbjV1BfjEEUZcBm+8oxLNzmF5gthyitkFqgcF1vdK/TQLbbIut/P2Ib0YP/j7
 PXe0xI9moOujGSngJ+5r6lFLJK6n4W1pUN0JIK+5TlQQdvT9PQLTxVkeKwwXK8JFthnnwS
 WEAcHh4xlBeujHike0PrwQZg6Y685QIOEMBxJbFHCzxqOZ6ydjVxfEVjkp9Mf/npRM/fWd
 Ugrg9zi/Gna/gwMj4+iNEwuJMvwuxdjKVL5Q/GA1fOQsvrwn9QvEFWK9raoCXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fs6ucCYI
Subject: Re: [Buildroot] [PATCH 2/2] package/pistache: enable on uClibc
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
Cc: Thomas Ruschival <thomas@ruschival.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 5 Aug 2022 18:29:06 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> As I understand, this patch is not really upstreamable, or at least not
> in this state.
> 
> However, this means we will have to carry over and over, because
> existing uclibc-based toolchains will still be usad in the future, even
> when newer uclibc-ng contains the new definitions, so we can't drop this
> patch because it may always needed when using external toolchains...

No, we will not have to carry it over and over. Regarding uClibc-ng, we
require using a reasonably recent version of uClibc-ng. So my plan
would be to keep this hack for a few months, until at least the Bootlin
uClibc toolchains are rebuilt with a recent enough uClibc-ng, and then
drop this hack.

So no, the goal is not to keep this hack patch forever.

What I'm proposing to do for pistache is exactly the same as I did in
commit fa4dba4aa202de20e3821eace5513aad81c23275, for openswan. Waldemar
was simply proposing to re-enable openswan for uClibc, because
uClibc-ng 1.0.41 has the necessary definitions. But in the immediate
term, that would have caused build break with Bootlin toolchains. So
until they are re-generated, I have added a hack patch that avoids the
uClibc build issue entirely, also with the goal of dropping the patch
when the toolchains are rebuilt.

> So, I think a version that is upstreamable would be nice...

I'm not sure it's worth the effort to introduce more complexity
upstream for this missing definition in uClibc. We should just fix it
in uClibc (I have already reported the issue), and that's it.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
