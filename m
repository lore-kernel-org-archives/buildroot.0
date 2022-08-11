Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA20C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C28C961071;
	Thu, 11 Aug 2022 20:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C28C961071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijMP9lgkDCzc; Thu, 11 Aug 2022 20:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E9960FD2;
	Thu, 11 Aug 2022 20:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4E9960FD2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B5B61BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE14D4013D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE14D4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QL96BAt37mX for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:43:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4068400E2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4068400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:43:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71D19240003;
 Thu, 11 Aug 2022 20:43:26 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:43:25 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220811224325.7c53c957@windsurf>
In-Reply-To: <894c61eb360ab14745063a31b1ff835f9854ff3e.1660158610.git.stefan@agner.ch>
References: <894c61eb360ab14745063a31b1ff835f9854ff3e.1660158610.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660250607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OyCxmlxm6+yA83fB1EPEhy1/bw6Ge+SCLCXn396onuc=;
 b=fUX1QBKmzN3F9Rskh4Y4jje0Uq2NSJW4Gej/ANbTLKR9rSrk9BQVXJJhHekoZXnbmee6le
 Tnt6TftpUXA6+TYvBlgOHrV7lqoYzzjAGMGacgh4bwKg2VAYDqX3Fqrwhxu6CKEtOti93G
 bcmvUQsx9ZPHe7c1D/UDOLYCfQzAn4HVp/0u8UKoSH0q0AudyADFfsI7ZwimE5RP5MVerV
 BnJPEbNPYjdXjWZHvYiLZS0BoGbsP+YDFElmtys4U68lUQdzDyEy1OZZcD3lgmFnXEJRRW
 WI/DukMbLnzAShRZwh3GgKMZ2bdIgOLqf2h2S5HsNtpUfn4LN9ZdKSA0zP6+TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fUX1QBKm
Subject: Re: [Buildroot] [PATCH v2] package/docker-proxy: bump version to
 f6ccccb1c082
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

On Wed, 10 Aug 2022 21:10:17 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Which is the version used by docker 20.10.17:
> https://github.com/moby/moby/blob/v20.10.17/hack/dockerfile/install/proxy.installer
> 
> The repository also moved to the moby GitHub organization, follow
> that move.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/docker-proxy/docker-proxy.hash | 2 +-
>  package/docker-proxy/docker-proxy.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
