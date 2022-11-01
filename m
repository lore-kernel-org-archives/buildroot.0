Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E087EC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38019818C9;
	Tue,  1 Nov 2022 20:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38019818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBQFKCrbmVsl; Tue,  1 Nov 2022 20:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8708E81753;
	Tue,  1 Nov 2022 20:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8708E81753
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73BE31BF307
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5032640462
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5032640462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQ2SQ7IvUsKM for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:17:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19BD9401C9
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19BD9401C9
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:17:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5B54100009;
 Tue,  1 Nov 2022 20:17:22 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:17:21 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221101211721.7ee3298a@windsurf>
In-Reply-To: <20221031232752.626154-1-christian@paral.in>
References: <20221031232752.626154-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667333843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLyxwrinEKhdYSxusmeesMHnI+68t/DIKnoYpDflIq4=;
 b=TArzQnpN7IQ7jUogKH3fIajPUj6pIpcGpY0eC+HpZ7bYuOpG/bIaM350n5i7mBYNKzxGa2
 n+I9CmjzYiaGNs3enXnibLvrYBdb3idsLSDAejWc9IcJdbrkzYMrXlaqBMLqGNkOADVVYA
 dKDkmjQj2O/3NmY5Oj3DdAU7AF3HnT7Erc+a9wFur263Zp+suxMnf2ry2pTnkZoJvOyf8G
 Hc0es4gSdujljHlY6aCdi0T/5UHqblumopktwxHALxDj9KxPMpkkRd0BW4S9WO60k6ZIO9
 pAsCwJBd70PEEgPWn+mduJZYPUQWUgHqpUikRzvsvUQc+mdMf6Kx0nDWkV1Jkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TArzQnpN
Subject: Re: [Buildroot] [PATCH v2 1/4]
 support/testing/tests/package/test_docker-compose: fix docker compose
 binary name
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 16:27:49 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Docker compose is now invoked as "docker compose" not "docker-compose."
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  support/testing/tests/package/test_docker_compose.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, series applied, after adding a reference to the Gitlab CI job
being fixed by the first patch into its commit log. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
