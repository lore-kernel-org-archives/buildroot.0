Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E96C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E645581E7A;
	Mon, 21 Nov 2022 21:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E645581E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dm1BYjP5mcB1; Mon, 21 Nov 2022 21:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22AB781E6E;
	Mon, 21 Nov 2022 21:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22AB781E6E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD8601BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD5E0405AA
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD5E0405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWnAG79A_hBR for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:21:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7751402F5
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7751402F5
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:21:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9DA99100003;
 Mon, 21 Nov 2022 21:21:22 +0000 (UTC)
Date: Mon, 21 Nov 2022 22:21:21 +0100
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20221121222121.0c27e885@windsurf>
In-Reply-To: <20221116212105.702408-1-thomas.petazzoni@bootlin.com>
References: <20221116212105.702408-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669065682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofvF8huG8Dy62E/Ypx5cg9xMQyFf5FrMlI2CpPy0dUA=;
 b=Ww9mWOI3H/XGlQkbn9yhg+CTK+N2HlpQwVhOTscnfT0JXMCERYIigbvaaUITADn5Evv9S3
 TV4A21xTOjWNygsQaozVXaiUCnNVelAg49Ix+6bUyPu5DozlachgKHad2r2UyzTnxF200f
 FtDBb6sr1ZhHloHP98hj9pfQy4D2AMz9fy7ylglb3OUe86YCxaqEwgC3MxuiR7HcdisS8K
 a+wIXDtKuUg3UCFtEc5Hfh2qHuKkYTcHZhFmpvpcKb6B7zc7c10vPGAu1dGj+MsLxD5PDj
 rJqQbuvsVIdZIeiBfqTe9obhv4prwo4VjUmy6h12Ssv6p40bNQ7Rh+LtF2EBuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ww9mWOI3
Subject: Re: [Buildroot] [PATCH 1/2] package/igh-ethercat: bump to latest
 Git commit
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Nov 2022 22:21:04 +0100
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> The current version 1.5.2 dates back from 2013, so it is extremely
> old. The latest master branch of igh-ethercat contains numerous fixes,
> including fixes to ensure that it builds with recent Linux kernel
> releases. Backporting the individual patches fixing those issues on a
> 9 year old release would be too much effort, so we propose to simply
> bump the version to the latest available in the Git master branch.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/4dc9b71c805a8156bcf8f398edd3a30f2b6ac6da/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/igh-ethercat/igh-ethercat.hash |  3 +--
>  package/igh-ethercat/igh-ethercat.mk   | 13 ++++++++++---
>  2 files changed, 11 insertions(+), 5 deletions(-)

Series applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
