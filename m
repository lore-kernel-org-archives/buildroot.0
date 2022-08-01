Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC04C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BF3340550;
	Mon,  1 Aug 2022 17:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BF3340550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uv6xIW22BqZJ; Mon,  1 Aug 2022 17:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92305404F3;
	Mon,  1 Aug 2022 17:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92305404F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A65E71BF315
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 818814053C
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 818814053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AgsBu-jIRO0G for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:01:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3011E4018B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3011E4018B
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:01:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9A8524000B;
 Mon,  1 Aug 2022 17:01:53 +0000 (UTC)
Date: Mon, 1 Aug 2022 19:01:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220801190152.385ca7eb@windsurf>
In-Reply-To: <20220731135258.2707220-1-giulio.benetti@benettiengineering.com>
References: <20220731135258.2707220-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659373314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbQzpJzrb4LOgkcqPQpa8nEv+eOCDKZh+jlof+fvBi8=;
 b=BLRZnTBCByR+nWOQ4vnabNa3g3l/7JxDJqGe73jTV3kzfo7uP4Gb4uVxdyq7d1cKM0i2PC
 KmB4UawEEqn7JEPK3pqPARoAmjQ3sPcspfR0GBDPj4tzsQSR9H6NOGLH7FT6bDB/jc4CXk
 06vLopLs7jCvzFYy2zkFaDhcbk1s1ycOicPx20rPfwIH/APc7hQgkxJaKbtCDak6UUvshD
 ncrkRKNEzRMEPciZ+7ZK+KdmTbxJNUnIDnrh6e1RtWvLf6m44ISBHp6AhAc4rb2B8aKIMV
 Fv63kuMBArmn3MXhWRlm3+S4iV4biKKK0Qn8eGEdvGTgaBS/zRa7oaJsJk2tNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BLRZnTBC
Subject: Re: [Buildroot] [PATCH] package/babeltrace2: fix host package build
 failure
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 31 Jul 2022 15:52:58 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> While building host-babeltrace2 asciidoc python3 module is required but
> Buildroot doesn't make it available, so let's --disable-man-pages for host
> as we do for target.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/babeltrace2/babeltrace2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
