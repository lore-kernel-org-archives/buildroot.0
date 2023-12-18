Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E97C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE53C404E9;
	Mon, 18 Dec 2023 08:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE53C404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2e2E3Ehuk4b; Mon, 18 Dec 2023 08:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9106B405B2;
	Mon, 18 Dec 2023 08:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9106B405B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 142BA1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E13D7417BE
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E13D7417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZLtw7PX9xCm for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:19:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D431741736
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D431741736
Received: by mail.gandi.net (Postfix) with ESMTPSA id B24F5C0009;
 Mon, 18 Dec 2023 08:19:13 +0000 (UTC)
Date: Mon, 18 Dec 2023 09:19:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231218091913.10ff65af@windsurf>
In-Reply-To: <20231204211359.12598-1-bernd@kuhls.net>
References: <20231204211359.12598-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702887554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYoxEGSmOofFgXw5xFCcEueE22hvf2MZSJyof2FHq1I=;
 b=cb9ctHlGnATqVdsyoYINiAoe+/KCGe5Qww9d4SxFyTvJYJLwIbwvqsS4r6LLLsAQOo6bvF
 2cz3E3AjAw5xFrQ9MPJcU7M6P1DD2+nwW6I5haxtsuR0J3O+Ylt7ytB+sDUUHb8HfPgzeG
 TgK+dQ6kA7FC1fr14w8ekwSsqAowcsCDQC8a/GyEDMCIKZH4uyswo3lTNP0ktqZMPZz/Hk
 b1xGFhyFHi1vVMYCf2KmNeZhaovk/Qp/1UapLeNv0SPZ2ybA3nSzLOAvcT+soQhMQfR5Ry
 LusjoRm8TCAZP72iQLvQJH5K19MmzJxIXtxsDW2USb7+ky5O/wbzPnvL6HoLPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cb9ctHlG
Subject: Re: [Buildroot] [PATCH 1/1] package/gettext-gnu: bump version to
 0.22.4
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  4 Dec 2023 22:13:59 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=08f342937a09ce41977e8ceecc23509e4b330490
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/gettext-gnu/gettext-gnu.hash   | 2 +-
>  package/gettext-gnu/gettext-gnu.mk     | 2 +-
>  package/gettext-tiny/gettext-tiny.hash | 2 +-
>  package/gettext-tiny/gettext-tiny.mk   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

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
