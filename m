Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E23C3DA7A
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 10:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E29F404EC;
	Wed, 28 Dec 2022 10:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E29F404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HXGvofFkJ_Y; Wed, 28 Dec 2022 10:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55D1D40499;
	Wed, 28 Dec 2022 10:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55D1D40499
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB8401BF3FB
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 10:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFF0B607C1
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 10:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFF0B607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHsZSm4aytLy for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 10:03:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B75C607BC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B75C607BC
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 10:03:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A605E000C;
 Wed, 28 Dec 2022 10:03:34 +0000 (UTC)
Date: Wed, 28 Dec 2022 11:03:32 +0100
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20221228110332.59ff04da@windsurf>
In-Reply-To: <20221221105153.12418-1-romain.naour@smile.fr>
References: <20221221105153.12418-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672221814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmL9bsL0s46Dgnm9jcSh+TcnijfSmX58idkrxZ827pY=;
 b=ZEaIhYq+WM9D+Ke6WbcIJLcnAtFuxXV1LoC63+Vn2jt8jcLqrkItujtDzOx16pulfvwRJM
 S42qB/BPOSYI3RwBdA1TpX/1c7K606gyVeGLb+K+wE6PfN7FTxQm5Ns1iTD5wRSY3S3TKn
 hfF4r+PE3+YIZL/oT9RyiI6x1zPKU2iS9Wt5q64mzBr1ZRcQbF12p3aGNNOmwSLiXWGRWR
 dVRsUeC5cABEW3en1Thp2rjoB1mVYUlLzP38Z8e2EUANiLFcVmjYztRAgFdwZXJz/LTQ5w
 YGrgtgjHPK9AGyh/IKuhmi+rVflRVysyBaW0GlJ9qsnseFf9n+iIQCq15B3mCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZEaIhYq+
Subject: Re: [Buildroot] [PATCH] package/aubio: switch to external waf script
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

On Wed, 21 Dec 2022 11:51:53 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Since the python 3.11 version bump [1], the waf script
> bundled in aubio 0.4.9 can't be executed anymore due
> to a waf bug [2].
> 
> Use the waf script provided by the Buildroot waf package
> infrastructure after removing the old waf script and its
> libraries.
> 
> Fixes:
> http://autobuild.buildroot.org/results/e2b/e2be18415ca794c68e708f2fdfd0a1a1ff5be714
> 
> [1] 738500c296c8b1206f20e94ca3e7c5932a6a0486
> [2] https://gitlab.com/ita1024/waf/-/commit/68997828c850ce7fb30b73b4adfde35053e539d1
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/aubio/aubio.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)

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
