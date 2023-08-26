Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E440C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF92418EB;
	Sat, 26 Aug 2023 18:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF92418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PnaIGD2hocP; Sat, 26 Aug 2023 18:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01F1841908;
	Sat, 26 Aug 2023 18:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01F1841908
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03D421BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C444182ECF
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C444182ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HDT9mZpbUds for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:06:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4461382E19
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4461382E19
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9018460003;
 Sat, 26 Aug 2023 18:06:47 +0000 (UTC)
Date: Sat, 26 Aug 2023 20:06:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230826200646.419fc433@windsurf>
In-Reply-To: <20230826112321.91916-1-bernd@kuhls.net>
References: <20230826112321.91916-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693073208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcB0wZ6pD077OdDHOoNbPO38BvWSRyVJCr7f+ZayQUY=;
 b=d1nTubhSFA5zWmrT5SpOge677Cp8PBvZR2XDAldfGcvBif5H5S6vP72j3LM2YZiNUDIfBl
 8kg/QchUxcX8Vw8MOzgGAnC7z6mdT0O++MEZQmrbEBNvDFwSqrklUdYb2dtKL5CZGkTPXb
 4qoGJP0/fpz0yjdeXUHBMAn8FM2XwFXhmu7r080AKyVAqUN0SjMUxRmY0zxS7cDUb+vHpS
 oY49WXCoLbz6ZW7Qw/bURYwaFHvPesvlBoTyN6uF4fLDoCgDzvPVAEYSk8TI5Hb4TDpa9E
 ZaSH7U93IGp8Q71EY3mR1V+QVGwEmlBWEXnetHUrVG3WvY1h+WfysWMkn/Pdiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d1nTubhS
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.11.5
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 26 Aug 2023 13:23:21 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added md5 hash provided by upstream.
> 
> Release notes: https://www.python.org/downloads/release/python-3115/
> 
> Fixes CVE-2023-40217.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python3/python3.hash | 4 +++-
>  package/python3/python3.mk   | 2 +-
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
