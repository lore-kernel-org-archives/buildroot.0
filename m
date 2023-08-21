Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168F1EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC7BA40B69;
	Mon, 21 Aug 2023 22:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC7BA40B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FWtRyTimeSOY; Mon, 21 Aug 2023 22:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E2BB40B59;
	Mon, 21 Aug 2023 22:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E2BB40B59
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92D011BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EF4A81FA0
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EF4A81FA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AfDXGp1Is94 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:08:18 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DF7D81F9B
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF7D81F9B
Received: by mail.gandi.net (Postfix) with ESMTPSA id F060EC0003;
 Mon, 21 Aug 2023 22:08:14 +0000 (UTC)
Date: Tue, 22 Aug 2023 00:08:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230822000813.7de8fb9a@windsurf>
In-Reply-To: <20230816195938.1352733-1-bernd@kuhls.net>
References: <20230816195938.1352733-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692655695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQNJItApSHQJvsYbT7IvY/vROtxXqRkIVwt03m2tPH4=;
 b=nCS1A9bpGVE8oxLdBBktDsydapHbmO3gu5cp0SkZCFSXmt0VsBkbcvNi6XR4VGATXMXsWv
 AOo4UlEI1rrqZ4UQ4r9fYb9dQ8Yet7PtqZMcBXc4d7OSQVINJgVu22xH4BpeqQ5+REPKAs
 kOmgjlpSjgkSuvpJH/DnZWByhMkIP31kCEcReiOyxg4IfL1ZxTuKYnzyJOfBSAup6k33TS
 ihF/6V89LkNQZAuWDMyglKy/uicu5u9RLVLRClswnpz0Qq9alQsN9OFSiC8LKA3X7JTmVv
 3jUUllZx8UrxqxispkbyE8uRun/nU2wwPgMhGXH67tsZABJsTEOCoHTZsCZNQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nCS1A9bp
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.2.9
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

On Wed, 16 Aug 2023 21:59:38 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://www.php.net/ChangeLog-8.php#8.2.9
> Release notes: https://www.php.net/releases/8_2_9.php
> 
> Fixes CVE-2023-3823 & CVE-2023-3824.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
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
