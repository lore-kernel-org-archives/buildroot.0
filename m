Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E555C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA6E440573;
	Thu, 29 Dec 2022 09:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA6E440573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPeWsknoDORj; Thu, 29 Dec 2022 09:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1304140480;
	Thu, 29 Dec 2022 09:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1304140480
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 333F51BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A04640201
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A04640201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_Dr6VahNxH5 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:05:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7FD4016D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB7FD4016D
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:05:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C1D9E1BF20B;
 Thu, 29 Dec 2022 09:05:06 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:05:05 +0100
To: Joel Carlson <joelsoncarl@gmail.com>
Message-ID: <20221229100505.4d6ead32@windsurf>
In-Reply-To: <20221228230326.3799157-1-JoelsonCarl@gmail.com>
References: <20221228230326.3799157-1-JoelsonCarl@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gawbI0JWXgi46sytHZSFBGV15vvh60+EAEGjDUxFScs=;
 b=NUN12DbSgJlNjAJYzBAU+e0VH7ThrBGWv430fYsEWxH+Vb/7UAswGj8+Ca3HH+vRtkeW1r
 N3Vu4NyrZt8mnMWBNPccUa1mLImP2coBgDKi+6emctIUOn1+JpiX3q8NuAuhzfTHa3D6NH
 j8TXUgKeEbVPp4qaaeIppC1YU+fWwH8Hrh/XK06gVxpv/nQza72Nn9l3kHfIVRbSi51pQP
 RryXLGJ5Jz8ODMsf0FZrwjAeYHgnOwvrSN16n2DLL6ZX6skSbu3byWEJb9TqgoJSJr54CM
 VP31QzTFq0Y0998V1B5LEQo1t9eEfzp1BkOiZcezCytjgR4yrKcaj+KMFBWeCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NUN12DbS
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: bump version to
 0.10.3
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
Cc: Koen Martens <gmc@sonologic.nl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Dec 2022 16:03:26 -0700
Joel Carlson <joelsoncarl@gmail.com> wrote:

> The 0.10 line offers minor improvements and bug fixes.
> 
> The previous security bump from 0.9.1 to 0.9.2 fixed CVE-2022-46149,
> which was also present in 0.10.2, but is fixed within 0.10.3.
> 
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> ---
>  package/capnproto/capnproto.hash | 2 +-
>  package/capnproto/capnproto.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
