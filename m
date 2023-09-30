Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8AFE732D6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 18:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63F20415B8;
	Sat, 30 Sep 2023 18:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F20415B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6IpoAEfTvKz; Sat, 30 Sep 2023 18:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAE6541665;
	Sat, 30 Sep 2023 18:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAE6541665
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CFCB1BF2A7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25E9760F2C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25E9760F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7T1la5xe4W5W for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 18:55:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B34A360BB5
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 18:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B34A360BB5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53D7120002;
 Sat, 30 Sep 2023 18:55:08 +0000 (UTC)
Date: Sat, 30 Sep 2023 20:55:07 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230930205507.4893704e@windsurf>
In-Reply-To: <20230609174955.409551-3-romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
 <20230609174955.409551-3-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696100109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRtQrqgxoGXECXZHuL4pt5cXT2ZbXu8IeY4mj9s65yI=;
 b=CE9OSnhSaNzkogSojcF4pr5QewFAXFfSrs5mUgsazDzC5tWhayIAscRGM8zvx8PLSXOBLR
 lKY8yzFq2w6cArzwkq/jJuvhzVuAq2RsCs7wx7hNVjd42ALn/E21mUYdaRqwrJrtpFAnbU
 ZPKYdwcvIMpebBsL+dIzQKxHvtR7alQjfG20jGJUhKc5ypJ1TNhu9WAwxH98TNXK5pkLN5
 IOj2t246pNNCu0NlPv8Lncl4h3LP1mJERhXHzFiuwfp8mqf/as+sWAmrCqG6Cl6Z9OpNyI
 ZVLUsd+qKuiekBaZy/hUSm+w5bKY4FVf1TqaD4YqZt5i22z5yKFETF17LpFq8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CE9OSnhS
Subject: Re: [Buildroot] [PATCH 3/4] package/python-mako: add optionnal
 runtime dependency on python-babel
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

On Fri,  9 Jun 2023 19:49:54 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/python-mako/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)

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
