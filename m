Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17F4C433FE
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 20:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D1E9400DB;
	Sat, 12 Nov 2022 20:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D1E9400DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2r1lpLqd6JHQ; Sat, 12 Nov 2022 20:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CD3640147;
	Sat, 12 Nov 2022 20:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CD3640147
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 241C01BF397
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 20:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E772181E32
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 20:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E772181E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxdXexZslKOl for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 20:32:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFD5981E20
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFD5981E20
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 20:32:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 90C7E60003;
 Sat, 12 Nov 2022 20:32:45 +0000 (UTC)
Date: Sat, 12 Nov 2022 21:32:44 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20221112213244.161b83fe@windsurf>
In-Reply-To: <20221110102313.182828-1-buildroot@heine.tech>
References: <20221110102313.182828-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668285165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yiUSuKSKAUFTT7qgiFNLlOEEkUl6weQZk0l2i3ISOCE=;
 b=ZLAnok6HnZ+rqbNw5ud0iTwvRSfIS4uWebZNmiFcSz8OI41rB51Lcqi3R27nyK3rwb5pas
 TTRnv5lN1PvMnEUzfaYCdTaYGn8r9RR+9mjpZQztGE7q6q4aWIF/QDJVTR+J6/Cv0a9l3C
 z9YQeYgMfoA16GHnyisoWSOJc/B/n/OpZzFneydx5POFVBznHlc7ntq3fwEtutPbjBXeNo
 6bmMk6RDOfsXC+VFgXKveMIZmgTsNufji/h34nb4sjTnZ7tgYIqshEJVi6RnGQs7TEBfGx
 GXPxZGlb14G5e3GLa1tTt1NWY6Zub0viQy0tDwuP9FS2W/LRCC1uwfBit45fww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZLAnok6H
Subject: Re: [Buildroot] [PATCH v2] package/swupdate: add libubootenv as
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Thu, 10 Nov 2022 11:23:12 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> when using BR2_PER_PACKAGE_DIRECTORIES and configuring swupdate to
> use uboot the build fails because libubootenv is not a dependency.
> 
> Fixes:
> bootloader/uboot.c:23:10: fatal error: libuboot.h: No such file or directory
>    23 | #include <libuboot.h>
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Could you provide a bit more details? Your change is only making sure
libubootenv is built before swupdate *if* libubootenv is eanbled in the
Buildroot configuration. This would mean libubootenv is an optional
dependency of swupdate.

But your commit log seems to imply otherwise.

We are not seeing any build errors on swupdate in our autobuilders.
Could you provide an example Buildroot configuration that exhibits the
issue?

Thanks

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
