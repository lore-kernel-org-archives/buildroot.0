Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EBCC001DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEADE81F2F;
	Mon,  3 Jul 2023 20:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEADE81F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MoAv-1l5_u6h; Mon,  3 Jul 2023 20:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A3881EDE;
	Mon,  3 Jul 2023 20:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A3881EDE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 460CB1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F4B6409F8
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F4B6409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4DDw4vdQfEZ for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:03:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A38F6405FD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A38F6405FD
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:03:21 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73429C0003;
 Mon,  3 Jul 2023 20:03:18 +0000 (UTC)
Date: Mon, 3 Jul 2023 22:03:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703220317.3c5850b4@windsurf>
In-Reply-To: <20230702154715.3422865-1-bernd@kuhls.net>
References: <20230702154715.3422865-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjYTvr9LvWwkIJieSQOqWmK18Lsiw39FScgM4IdXIhI=;
 b=mc9O3OkPNXQkO5ZoJGLkZXh/IW7ZImIkmtUdw9hyVkjFcbP9MBcXVHZ/8QjCZ6DD3mfiFw
 MDRKMpGS1tHb5rlmrp/dniY4dlcG7IBYSEst1DXVn00pbsMfwJdlOKE4MYPWDaWB2JNyGg
 RASZVm8B1+sQv8Z6u4vKk2V8OaNS7JZ9lpFrPdOhbKR1hgkld8nrJ7ve48O9iApbyGmTup
 EMgvxK8CAX/5hZTu4ksEmnR2Y87jyITAJ1U3PGLFvXWAEb6ihUxcfBMDbE9yDjgpgy/qCo
 ThIVftJUs5DfW0XG/q5wdUNOXOaqWYobpPbtU322T8yD4kfELUlqUmgSF4n2KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mc9O3OkP
Subject: Re: [Buildroot] [PATCH 1/1] package/autoconf-archive: bump version
 to 2023.02.20
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

On Sun,  2 Jul 2023 17:47:15 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added sha1 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/autoconf-archive/autoconf-archive.hash | 4 +++-
>  package/autoconf-archive/autoconf-archive.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)

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
