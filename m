Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F621C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8F060A98;
	Sun, 30 Jul 2023 10:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB8F060A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i04nXAidlppf; Sun, 30 Jul 2023 10:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ECB360AFE;
	Sun, 30 Jul 2023 10:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ECB360AFE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B13171BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B3D2817EB
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B3D2817EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuHd6HYhES_t for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:35:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CE75817B5
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE75817B5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D7631C0003;
 Sun, 30 Jul 2023 10:35:54 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:35:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730123553.3338a2d4@windsurf>
In-Reply-To: <20230708200447.3919009-7-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
 <20230708200447.3919009-7-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690713355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7k/ZFuGxzRRbW9f5ywUNhboJY9Knaf/Jx7X29VV288=;
 b=DQ6Dxh/aU8hbjDbjZHgEOa8Ms/HXwDevfCvdG13C78wpGRKersTSg6s+IQ6unbn0ftU4n5
 6wF1YLwVQfI+vMNIyHOlrkG+divvzYur/CkcnwQIWOlT/arhvnppE+ugo5WodqoMukzImF
 i7kxp5qLQusnWJap8l99rvdHhi0JF+Vj0V7XGAdC2TNwv/5koiwvXU9rXV78Qr5wqKRcGI
 blMSeAGyXQopT8v4W00x0i4ZXPQx6LCo0/FREoCHWB6uQOZzefdKwBjuMHd6UW6cZSSvqg
 YU8/dTKpp3zf9nYgV5cvNWQAda+VNQYjQev+RlO3ECJV8U4WhT/I6sqftRunbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DQ6Dxh/a
Subject: Re: [Buildroot] [PATCH 7/7] package/kodi-imagedecoder-raw: new
 package
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  8 Jul 2023 22:04:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-imagedecoder-raw/Config.in             |  9 +++++++++
>  .../kodi-imagedecoder-raw.hash                      |  3 +++
>  .../kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk  | 13 +++++++++++++
>  package/kodi/Config.in                              |  1 +
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/kodi-imagedecoder-raw/Config.in
>  create mode 100644 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
>  create mode 100644 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk

Applied to master after adding "depends on" + Config.in comment. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
